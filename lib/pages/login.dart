import 'package:actividad1/pages/principal.dart';
import 'package:actividad1/pages/register.dart';
import 'package:actividad1/pages/vpass.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 50, right: 50),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                            width: 250,
                            height: 190,
                            child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/ne.jpg'))),
                      ),
                      const Padding(
                          padding: EdgeInsetsDirectional.only(bottom: 20),
                          child: TextField(
                            decoration: InputDecoration(hintText: 'email'),
                          )),
                      const Padding(
                          padding: EdgeInsetsDirectional.only(bottom: 30),
                          child: TextField(
                            decoration: InputDecoration(hintText: 'password'),
                            obscureText: true,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 200),
                        child: SizedBox(
                          height: 20,
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 112, 171, 113),
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
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, left: 105),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            primary: Color.fromARGB(255, 80, 77, 78),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Vpass()),
                            );
                          },
                          child: const Text(
                            'Se me olvido mi contraseña',
                            style: TextStyle(color: Colors.lightBlueAccent),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Principal()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 112, 171, 113)),
                        child: const Text(
                          'Aceptar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
