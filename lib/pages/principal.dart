// ignore_for_file: deprecated_member_use
import 'package:actividad1/ath/authenticator.dart';
import 'package:actividad1/pages/register2.dart';
import 'package:actividad1/pages/sign.dart';
import 'package:actividad1/pages/signF.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'login.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportContrains) {
          return SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                width: 300,
                height: 300,
                child: (Image(image: AssetImage('assets/images/fotito.png'))),
              ),
              ElevatedButton(
                /*Google*/
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 23, 151, 255),
                  onPrimary: const Color.fromARGB(255, 254, 253, 253),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () async {
                  /*googleLogin();*/
                  User? user =
                      await Authenticator.iniciarSesion(context: context);

                  if (user != null) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Sign(user: user)),
                      (Route<dynamic> route) => false,
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // Icon(Icons.add),
                      Image(
                        image: AssetImage("assets/images/google.png"),
                        height: 18.0,
                        width: 24,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24, right: 8),
                        child: Text(
                          'Continuar con Google',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 253, 253),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                /*Facebook*/
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 22, 89, 144),
                  onPrimary: const Color.fromARGB(255, 254, 253, 253),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () async {
                  FacebookAuth.instance.login(
                      permissions: ["public_profile", "email"]).then((value) {
                    FacebookAuth.instance.getUserData().then((userData) async {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignF(
                                nombre: userData['name'],
                                email: userData['email'])),
                        (Route<dynamic> route) => false,
                      );
                    });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage("assets/images/facebook.png"),
                        height: 18.0,
                        width: 24,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 4),
                        child: Text(
                          'Continuar con Facebook',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 253, 253),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                /*e-mail*/
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 251, 252, 252),
                  onPrimary: const Color.fromARGB(255, 2, 2, 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  side: const BorderSide(
                      width: 2,
                      color: Color.fromARGB(
                          171, 58, 57, 57)), //border width and color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Register2()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage("assets/images/email.png"),
                        height: 18.0,
                        width: 24,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 8),
                        child: Text(
                          'Registrarse con e-mail',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(137, 59, 58, 58),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  primary: Color.fromARGB(255, 251, 64, 151),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const Text('Entrar como invitado'),
              ),
              /*const SizedBox(height: 20),*/
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  primary: Color.fromARGB(255, 2, 110, 29),
                ),
                onPressed: () {},
                child: const Text('Entrar como vendedor'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 5, right: 4),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: 130,
                        child: Text(
                          '¿Ya tienes cuenta?',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 11, 11, 11),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        primary: Color.fromARGB(255, 251, 64, 151),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Text('Iniciar sesion'),
                    ),
                  ],
                ),
              ),
            ],
          ));
        }),
      ),
    ));
  }
}
