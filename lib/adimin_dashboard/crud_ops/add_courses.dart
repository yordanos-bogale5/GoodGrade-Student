// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AddCourses extends StatefulWidget {
  const AddCourses({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddCoursesState createState() => _AddCoursesState();
}

class _AddCoursesState extends State<AddCourses> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final courseRef = FirebaseFirestore.instance.collection("Courses");
  // final CollectionReference _items = FirebaseFirestore.instance.collection("Add_Courses");
  List<Map<String, dynamic>> localItems = []; // List to store locally added items
  String fileUrl = '';
  PlatformFile? pickedFile;
  UploadTask? uploadTask;


// A sectiom to upload a course file to firebase storage

Future selectFile() async{
  final result =  await  FilePicker.platform.pickFiles();
  if(result == null){
    return ;
  }
  setState((){
    pickedFile = result.files.first;
  });

  uploadFile();

}

Future uploadFile() async{
  final path = "courses/${pickedFile!.name}";
  final file = File(pickedFile!.path!);

  final ref =  FirebaseStorage.instance.ref().child(path);
  uploadTask =  ref.putFile(file);



var fileUrl = await (await uploadTask!).ref.getDownloadURL();

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
                child: Text("Add Course"),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'eg Mathmatics',
                ),
              ),
              TextField(
                controller: _numberController,
                decoration: const InputDecoration(
                  labelText: 'Course Id',
                  hintText: 'eg 001',
                ),
              ),
   const  SizedBox(
                height: 10,
              ),
              Center(
                child: IconButton(
                  onPressed: selectFile,
                  icon: const Icon(Icons.add),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                  await courseRef.add({   "name": _nameController.text,
                        "number": _nameController.text,
                        "file": fileUrl,
                      });

                      _nameController.text = '';
                      _numberController.text = '';
                      Navigator.of(context).pop();
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
        stream: courseRef.snapshots(),
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

  const PdfViewer(Set<dynamic> set, {Key? key, required this.pdfUrl}) : super(key: key);

  @override
Widget build(BuildContext context) {
  return Scaffold(
      body: SfPdfViewer.network(
          'https://console.firebase.google.com/project/my-creavers-project-9ae09/database/my-creavers-project-9ae09-default-rtdb/data/~2F/content/PDFViewer/flutter-succinctly.pdf'));
}
}