import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/auth_gate.dart';

void main() async {
  // 1. Ensure Flutter is ready before talking to native code
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize Firebase using the file flutterfire just generated
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 3. Start the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth App',
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
