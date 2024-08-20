import 'package:alura_01/screens/form_screen.dart';
import 'package:alura_01/screens/initial_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // bool opacidade = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alura 01',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const InitialScreen(),
      home: const FormScreen(),
    );
  }
}
