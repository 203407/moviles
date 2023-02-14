import 'package:actividad1/pages/password.dart';
import 'package:flutter/material.dart';

class Vpass extends StatelessWidget {
  const Vpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 255, 75, 75), //change your color here
        ),
        title: Row(
          children: [
            const Text(
              "Recuperar contraseña",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Image.asset(
                "assets/images/fotito2.jpg",
                scale: 1.9,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(213, 49, 1, 94),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 5),
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportContrains) {
            return SingleChildScrollView(
                child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 70, left: 1),
                  child: Text(
                    'Ingresa tu email para recuperar tu contraseña',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(192, 48, 46, 46),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 250),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 10),
                        child: Text(
                          'Correo electrónico',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 3, 3, 3),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Direccion de correo',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        obscureText: true,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          "Ingrese su correo electronico registrado y le enviaremos un correo electronico que contiene un enlace para restablecer su contraseña",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 58, 167, 89),
                        onPrimary: const Color.fromARGB(255, 2, 2, 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),

                        //border width and color
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Password()));
                      },
                      child: const Text(
                        'Enviar solicitud',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 254, 253, 253),
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
              ],
            ));
          }),
        ),
      ),
    );
  }
}
