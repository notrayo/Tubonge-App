import 'package:flutter/material.dart';
import 'package:tubonge_app/Widgets/drawer.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: const DrawerWidget(),
      body: const Center(
        child: Text('You are logged in!'),
      ),
    );
  }
}
