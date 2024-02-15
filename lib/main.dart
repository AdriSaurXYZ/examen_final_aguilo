import 'package:firebase_demo/screens/login_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Aquí se podría verificar el estado de la sesión
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen Final Primer Llinatge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // O HomeScreen si la sesión está activa
    );
  }
}
