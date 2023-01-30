import 'package:actividad1/pages/formm.dart';
import 'package:actividad1/pages/preview1.dart';
import 'package:actividad1/pages/view2.dart';
import 'package:flutter/material.dart';

class View1 extends StatelessWidget {
  const View1({Key? key}) : super(key: key);

//https://blog.logrocket.com/flutter-layouts-guide-margins-padding/    y https://api.flutter.dev/flutter/widgets/Padding-class.html
//https://esflutter.dev/docs/cookbook/navigation/navigation-basics#:~:text=Navega%20a%20la%20segunda%20pantalla%20usando%20Navigator.,-push&text=Para%20navegar%20a%20una%20nueva,rutas%20administradas%20por%20el%20Navigator.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsetsDirectional.only(top: 240),
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsetsDirectional.only(bottom: 20),
                child: Text("Raul Alvarez",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            const Padding(
                padding: EdgeInsetsDirectional.only(bottom: 20),
                child: Text("20",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            const Padding(
                padding: EdgeInsetsDirectional.only(bottom: 20),
                child: Text(
                  "203407@ids.upchiapas.edu.mx",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 60),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const View2()));
                },
                child: const Text('Ir a view 2'),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Formm()));
                },
                child: const Text('Ir a view forms'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
