import 'package:flutter/material.dart';
import 'package:tubonge_app/Screens/settings_screen.dart';
import 'package:tubonge_app/Screens/user_profile_screen.dart';
import 'package:tubonge_app/Widgets/drawer.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectScreenFromDrawer(String identifier) {
    if (identifier == 'Home') {
      Navigator.of(context).pop();
      setState(() {
        _selectedPageIndex = 0;
      });
    } else if (identifier == 'Profile') {
      Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => const ProfileScreen())));
    } else if (identifier == 'Settings') {
      Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => const SettingsScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: DrawerWidget(
        onSelectScreenFromDrawer: _selectScreenFromDrawer,
      ),
      body: const Center(
        child: Text('You are logged in!'),
      ),
    );
  }
}
