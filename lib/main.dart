import 'package:actividad1/pages/bt.dart';
import 'package:actividad1/pages/preview1.dart';
import 'package:actividad1/pages/view1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: const View1(),
    );
  }
}
