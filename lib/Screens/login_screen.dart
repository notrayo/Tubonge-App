import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:tubonge_app/Screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tubonge_app/Widgets/user_dp_picker.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';
  //unitializing image file
  File? _selectedImage;

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    _form.currentState!.save();

    //logic for what happens when user is in login or signup mode

    try {
      if (_isLogin) {
        // logging in logic
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
      } else {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {}
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Authentication failed my boi')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 200,
                child: Image.asset('assets/chat.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                // color: Theme.of(context).colorScheme.onBackground,
                margin: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                        key: _form,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!_isLogin) UserDPImagePickerWidget(),
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text('Enter Your Email :'),
                                  prefixIcon: Icon(Icons.email_outlined)),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              validator: ((value) {
                                if (value == null ||
                                    !value.contains('@') ||
                                    value.trim().isEmpty) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              }),
                              onSaved: (value) {
                                _enteredEmail = value!;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text('Enter Password : '),
                                  prefixIcon: Icon(Icons.lock_outline)),
                              obscureText: true,
                              autocorrect: false,
                              validator: ((value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter a valid password';
                                }
                                if (value.length < 6) {
                                  return 'input a longer password';
                                }
                                return null;
                              }),
                              onSaved: (value) {
                                _enteredPassword = value!;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(_isLogin ? 'Login' : 'Signup'),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const SignupScreen()));
                    },
                    child: Text(
                      _isLogin
                          ? 'New User ? ... Create an account !'
                          : 'I already have an account',
                      style: TextStyle(
                          decoration: TextDecoration.combine(
                              [TextDecoration.underline]),
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
