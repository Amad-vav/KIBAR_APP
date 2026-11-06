import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // 1. Memastikan binding framework Flutter siap sebelum async call
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Inisialisasi SDK Firebase
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Firebase Connected'))),
    );
  }
}
