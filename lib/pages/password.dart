import 'package:actividad1/pages/login.dart';
import 'package:actividad1/pages/vpass.dart';
import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  const Password({super.key});

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
          padding: const EdgeInsets.only(left: 20, right: 30),
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportContrains) {
            return SingleChildScrollView(
                child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 70, left: 1, top: 20),
                  child: Text(
                    'Por seguridad, tu contraseña debe tener una longitud de entre 8 y 15 caracteres, usar mayúsculas, minúsculas, contener por lo menos un numero y un caracter especial.',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(192, 48, 46, 46),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 10),
                        child: Text(
                          'Nueva Contraseña',
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
                          hintStyle: const TextStyle(color: Colors.grey),
                          hintText: '   Contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 140),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 10),
                        child: Text(
                          'Confirmar nueva Contraseña',
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
                          hintStyle: const TextStyle(color: Colors.grey),
                          hintText: '   Confirma tu nueva Contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 58, 167, 89),
                        onPrimary: const Color.fromARGB(255, 2, 2, 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),

                        //border width and color
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Text(
                        'Actualizar contraseña',
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
