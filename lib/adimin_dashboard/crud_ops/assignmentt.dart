// ignore_for_file: unused_local_variable, library_private_types_in_public_api, unnecessary_import, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';


class Assignment extends StatefulWidget {
  const Assignment({Key? key}) : super(key: key);

  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final courseRef = FirebaseFirestore.instance.collection("Assignment");

  List<Map<String, dynamic>> localItems = [];
  String fileUrl = '';
  PlatformFile? pickedFile;
  UploadTask? uploadTask;




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
                child: Text("Add Assignment"),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Assignment Name',
                  hintText: 'eg Mathmatics Assignment',
                ),
              ),
              TextField(
                controller: _numberController,
                decoration: const InputDecoration(
                  labelText: 'Assignment Id',
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
        title: const Text('Add Assignment'),
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



















// Pdf Viewr
class PdfViewer extends StatelessWidget {
  final String pdfUrl;

  const PdfViewer({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: Center(),
    );
  }
}



             