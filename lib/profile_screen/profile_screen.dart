import 'package:flutter/material.dart';
import 'package:creavers_project/profile_screen/sections/bio_section.dart';
import 'package:creavers_project/profile_screen/sections/level_progress.dart';
import 'package:creavers_project/profile_screen/sections/status.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Profile'),
            backgroundColor:Colors.blue[900],
            foregroundColor:Colors.white,
            elevation: 0,
            leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
          ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              BioSection(),
              SizedBox(height: 16.0),
              LevelProgressSection(),
              SizedBox(height: 16.0),
              StatusSection(),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
