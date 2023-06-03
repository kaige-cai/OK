import 'package:flutter/material.dart';

import 'page/home_page.dart';

void main() => runApp(const FunApp());

class FunApp extends StatelessWidget {
  const FunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
