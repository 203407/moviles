import 'package:actividad1/pages/principal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ath/Authenticator.dart';

class Sign extends StatelessWidget {
  const Sign({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 300.0, left: 70),
        child: Column(
          children: [
            Text(
              user?.displayName ?? 'Nombre de usuario no disponible',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              user?.email ?? 'usuario de usuario no disponible',
              style: const TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                  onPressed: () async {
                    await Authenticator.cerrarSesion();

                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, '/screen1');
                  },
                  child: const Text("Cerrar sesion")),
            )
          ],
        ),
      ),
    );
  }
}
