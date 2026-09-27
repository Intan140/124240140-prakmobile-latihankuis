import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Perpustakaan',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF8B5E3C),
        scaffoldBackgroundColor: const Color(0xFFFDFBF7),
      ),
      home: const LoginPage(),
    );
  }
}
