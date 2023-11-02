import 'package:flutter/material.dart';
import './Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tubonge App',
      theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 16, 20, 21),
            brightness: Brightness.dark,
            surface: const Color.fromARGB(255, 54, 90, 125),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 233, 234, 235),
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.black, // Set the text color to black
            ),
            bodyText2: TextStyle(
              color: Color.fromARGB(
                  255, 90, 89, 90), // Set the text color to black
            ),
          )),
      initialRoute: '/home',
      routes: {'/home': (context) => const HomeScreen()},
    );
  }
}
