import 'package:flutter/material.dart';

class Preview1 extends StatelessWidget {
  const Preview1({Key? key}) : super(key: key);

//https://blog.logrocket.com/flutter-layouts-guide-margins-padding/    y https://api.flutter.dev/flutter/widgets/Padding-class.html

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const Center(
          child: Text(
        "íuto",
        style: TextStyle(fontSize: 501),
      )),
    );
  }
}
