import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.onSelectScreenFromDrawer});

  final void Function(String identifier) onSelectScreenFromDrawer;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  // Icon(
                  //   Icons.person,
                  //   size: 40,
                  // ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Tubonge App'),
                ],
              )),
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('Your profile'),
            onTap: () {
              onSelectScreenFromDrawer('Profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              onSelectScreenFromDrawer('Settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
    );
  }
}
