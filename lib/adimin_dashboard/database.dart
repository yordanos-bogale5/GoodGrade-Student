import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class InstRealTimeDatabase extends StatefulWidget {
  const InstRealTimeDatabase({super.key});

  @override
  State<InstRealTimeDatabase> createState() => _InstRealTimeDatabaseState();
}

final nameController = TextEditingController();
final addressController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
final saleryController = TextEditingController();
final roleController = TextEditingController();
final databaseReference = FirebaseDatabase.instance.ref("StoreData");

class _InstRealTimeDatabaseState extends State<InstRealTimeDatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Add Insreuctor"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          commonTestField("Name", nameController, false),
          commonTestField("Address", addressController, false),
          commonTestField("Email", emailController, false),
          commonTestField("Password", passwordController, true),
          commonTestField("Salery", saleryController, true),
          commonTestField("Role", roleController, true),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {
              // Check if any of the text fields are emply?
              if (nameController.text.isEmpty ||
                  addressController.text.isEmpty ||
                  emailController.text.isEmpty ||
                  saleryController.text.isEmpty ||
                  roleController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    "Please enter all fields",
                  ),
                  duration: Duration(seconds: 2),
                ));
                return; //Don't proceed with adding data
              }

              // when we have click the add button this items are added in database
              databaseReference
                  .child(DateTime.now().microsecond.toString())
                  .child("Details")
                  .set({
                'name': nameController.text.toString(),
                'address': addressController.text.toString(),
                'salery': saleryController.text.toString(),
                'role': roleController.text.toString(),
                'email': emailController.text.toString(),
                'password': passwordController.text.toString(),
                'id': DateTime.now()
                    .microsecond
                    .toString(), // every times id is unique
              });
              // Cear text controllers
              nameController.clear();
              addressController.clear();
              passwordController.clear();
              emailController.clear();
              saleryController.clear();
              roleController.clear();
              // For Dismiss the keybord after addint items
              FocusScope.of(context).unfocus();
            },
            child: const Text("Add"),
          )
        ],
      ),
    );
  }

  Padding commonTestField(hint, controller, hide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        controller: controller,
        obscureText: hide,
        decoration: InputDecoration(
            hintText: hint,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ))),
      ),
    );
  }
}
