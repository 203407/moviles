import 'package:actividad1/pages/preview1.dart';
import 'package:actividad1/pages/view1.dart';
import 'package:actividad1/pages/view2.dart';
import 'package:flutter/material.dart';

class Bt extends StatelessWidget {
  const Bt({Key? key}) : super(key: key);

//https://blog.logrocket.com/flutter-layouts-guide-margins-padding/    y https://api.flutter.dev/flutter/widgets/Padding-class.html

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsetsDirectional.only(top: 250),
        child: Column(
          children: <Widget>[
            const Text("nombre: Raul", style: TextStyle(fontSize: 30)),
            const Text("Edad: 20", style: TextStyle(fontSize: 30)),
            const Text(
              "correo: 203407@ids..edu.mx",
              style: TextStyle(fontSize: 20),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const View2()),
                );
              },
              child: const Text('Enabled'),
            ),
            // Center(child: fl)
            // Preview1()
            // Center(child: Preview1())
          ],
        ),
      ),
    );
  }
}
