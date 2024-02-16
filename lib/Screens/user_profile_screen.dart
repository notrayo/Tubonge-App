import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:tubonge_app/Screens/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Profile'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                      width: 140,
                      height: 140,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Image.asset('assets/IMG_2007.JPG'))),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Luh Geeky'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const EditProfileScreen())));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black87)),
                      child: const Text('Edit Profile'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
