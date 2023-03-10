import 'package:actividad1/pages/principal.dart';
import 'package:actividad1/screens/onboarding/components/splash_view.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: const SplashView(),
      routes: <String, WidgetBuilder>{
        '/screen1': (BuildContext context) => const Principal(),
      },
    );
  }
}
