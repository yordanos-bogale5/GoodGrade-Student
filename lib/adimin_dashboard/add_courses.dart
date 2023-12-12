import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class AddCourses extends StatefulWidget {
  const AddCourses({Key? key}) : super(key: key);

  @override
  _AddCoursesState createState() => _AddCoursesState();
}

class _AddCoursesState extends State<AddCourses> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final CollectionReference _items = FirebaseFirestore.instance.collection("Add_Courses");

  List<Map<String, dynamic>> localItems = []; // List to store locally added items

  String fileUrl = '';

  Future<void> _pickAndUploadFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        File file = File(result.files.first.path!);
        String fileName = DateTime.now().microsecondsSinceEpoch.toString();

        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDireFiles = referenceRoot.child('courses');
        Reference referenceFileToUpload = referenceDireFiles.child(fileName);

        await referenceFileToUpload.putFile(file);
        fileUrl = await referenceFileToUpload.getDownloadURL();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("File uploaded successfully"),
          ),
        );
      }
    } on PlatformException catch (error) {
      print("Error picking/uploading file: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error picking/uploading file"),
        ),
      );
    }
  }

  Future<void> _create() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text("Create your Items"),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'eg Elon',
                ),
              ),
              TextField(
                controller: _numberController,
                decoration: const InputDecoration(
                  labelText: 'Number',
                  hintText: 'eg 10',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: IconButton(
                  onPressed: _pickAndUploadFile,
                  icon: const Icon(Icons.add),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (fileUrl.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select and upload the course"),
                        ),
                      );
                      return;
                    }
                    final String name = _nameController.text;
                    final int? number = int.tryParse(_numberController.text);
                    if (number != null) {
                      await _items.add({
                        "name": name,
                        "number": number,
                        "file": fileUrl,
                      });

                      // Update the local list
                      localItems.add({
                        "name": name,
                        "number": number,
                        "file": fileUrl,
                      });

                      _nameController.text = '';
                      _numberController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Create'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Course'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _items.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasError) {
            return Center(
              child: Text("Some error occurred: ${streamSnapshot.error}"),
            );
          }

          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<QueryDocumentSnapshot> document = streamSnapshot.data!.docs;
          localItems = document.map((e) => e.data() as Map<String, dynamic>).toList();

          return ListView.builder(
            itemCount: localItems.length,
            itemBuilder: (BuildContext context, int index) {
              Map thisItems = localItems[index];
              return ListTile(
                title: Text(
                  "${thisItems['name']}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                subtitle: Text("${thisItems['number']}"),
                leading: CircleAvatar(
                  radius: 27,
                  child: thisItems.containsKey('file')
                      ? const Icon(Icons.picture_as_pdf,
                          size: 40, color: Colors.red)
                      : const CircleAvatar(),
                ),
                onTap: () {
                  if (thisItems.containsKey('file')) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfViewer(
                          pdfUrl: thisItems['file'],
                        ),
                      ),
                    );
                  }
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        backgroundColor:  Colors.blue[900],
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PdfViewer extends StatelessWidget {
  final String pdfUrl;

  const PdfViewer({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: pdfUrl,
      ),
    );
  }
}
