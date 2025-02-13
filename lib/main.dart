import 'package:flutter/material.dart';
import 'package:min_chat_app/auth/login_or_register.dart';
import 'package:min_chat_app/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Page',
      home: const LoginOrRegister(),
      theme: lightMode,
    );
  }
}