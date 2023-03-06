import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignF extends StatelessWidget {
  const SignF({super.key, this.nombre, this.email});
  final String? nombre, email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 300.0, left: 75),
        child: Column(
          children: [
            Text(
              nombre!,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              email!,
              style: const TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                  onPressed: () async {
                    await FacebookAuth.instance.logOut();

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
