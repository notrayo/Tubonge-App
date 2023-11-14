import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserDPImagePickerWidget extends StatefulWidget {
  const UserDPImagePickerWidget({super.key});

  @override
  State<UserDPImagePickerWidget> createState() =>
      _UserDPImagePickerWidgetState();
}

class _UserDPImagePickerWidgetState extends State<UserDPImagePickerWidget> {
  File? _pickedImageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.camera, imageQuality: 100, maxWidth: 150);

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            foregroundImage:
                _pickedImageFile != null ? FileImage(_pickedImageFile!) : null),
        TextButton.icon(
            onPressed: _pickImage,
            icon: const Icon(Icons.image),
            label: Text(
              'Add Profile Picture',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ))
      ],
    );
  }
}
