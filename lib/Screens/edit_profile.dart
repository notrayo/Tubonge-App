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
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 130,
                  height: 130,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset('assets/IMG_2007.JPG'),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.yellow),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 20,
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  //controller: controller.userName,
                  decoration: const InputDecoration(
                    label: Text('username ...'),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //controller: controller.userName,
                  decoration: const InputDecoration(
                      label: Text('email ...'),
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //controller: controller.userName,
                  decoration: const InputDecoration(
                      label: Text('enter new password ...'),
                      prefixIcon: Icon(Icons.password_outlined),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //controller: controller.userName,
                  decoration: const InputDecoration(
                      label: Text('re-enter password ...'),
                      prefixIcon: Icon(Icons.password_sharp),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black87)),
                    child: const Text('Update Profile'))
              ],
            ))
          ],
        ),
      )),
    );
  }
}
