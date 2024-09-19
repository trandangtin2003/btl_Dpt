import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("I Am Rich", style: TextStyle(color: Colors.white),)),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Image.asset('assets/diamond.png'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}