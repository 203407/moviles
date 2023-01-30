import 'package:actividad1/pages/register.dart';
import 'package:flutter/material.dart';

class Formm extends StatelessWidget {
  const Formm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('assets/images/ne.jpg')),
              const Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 20),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'email'),
                  )),
              const Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 20),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'password'),
                    obscureText: true,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 250),
                child: SizedBox(
                  height: 20,
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: const Text(
                      'Registrar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Aceptar')),
            ],
          ),
        ),
      ),
    );
  }
}
