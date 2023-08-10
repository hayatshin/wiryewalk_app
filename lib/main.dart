import 'package:flutter/material.dart';
import 'package:wiryewalk_app/features/authentication/views/sign_up_screen.dart';

void main() {
  runApp(const WiryeWalkApp());
}

class WiryeWalkApp extends StatelessWidget {
  const WiryeWalkApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WiryeWalk App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 171, 33, 33),
        ),
      ),
      home: const SignUpScreen(),
    );
  }
}
