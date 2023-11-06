import 'package:flutter/material.dart';
import 'package:tubonge_app/Screens/login_screen.dart';
import './Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 20, color: Colors.black),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white, // Set the text color to white
      fontSize: 21, // Adjust the font size as needed
      fontWeight: FontWeight.bold, // Adjust the font weight as needed
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
);

ThemeData darkTheme = ThemeData(
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 20, color: Colors.white70),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.deepOrange,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepOrange,
    brightness: Brightness.dark,
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tubonge App',
      theme: lightTheme,
      initialRoute: '/login',
      routes: {'/login': (context) => const LoginScreen()},
    );
  }
}
