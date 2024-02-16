import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Your Profile ...'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text('Widgets for  editing user information will appear here'),
        ),
      ),
    );
  }
}