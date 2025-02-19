import 'package:flutter/material.dart';
import 'package:min_chat_app/services/auth/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:min_chat_app/themes/theme_provider.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final Widget? authGate;
  const MyApp({super.key, this.authGate});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Page',
      home: authGate ?? const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}