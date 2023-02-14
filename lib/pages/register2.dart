import 'package:flutter/material.dart';

import 'login.dart';

class Register2 extends StatelessWidget {
  const Register2({super.key});

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
              "Regístrate",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 160),
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
                  padding: EdgeInsets.only(bottom: 40, left: 1, top: 15),
                  child: Text(
                    'Cree una cuenta para emprezar a usar la app',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(192, 48, 46, 46),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 10),
                        child: Text(
                          'Nombre',
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
                          hintText: 'Nombre Completo',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
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
                          hintText: 'Dirección de correo',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 10),
                        child: Text(
                          'Contraseña',
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
                          hintText: 'Contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          suffixIcon: const Icon(
                            Icons.visibility,
                            color: Color.fromARGB(255, 186, 179, 179),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'La contraseña debe de contener carcteres, numeros y simbolos con un minimo de 6 caracteres',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(112, 66, 64, 64),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: const CircleBorder(),
                      checkColor: Colors.white,
                      activeColor: Colors.deepPurple,
                      tristate: true,
                      value: false,
                      onChanged: (val) {},
                    ),
                    const Text(
                      'Al registrarme, acepto los',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 13,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Terminos y condiciones',
                        style: TextStyle(
                          color: Color(0xFFE1416D),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Text(
                      'y',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, bottom: 10),
                  child: Row(
                    children: [
                      const Text(
                        'la',
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 13,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Politica de privacidad',
                          style: TextStyle(
                            color: Color(0xFFE1416D),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
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
                        onPressed: () {},
                        child: const Text(
                          'Crear Cuenta',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 254, 253, 253),
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Ya tienes cuenta?',
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(
                            color: Color(0xFFE1416D),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
          }),
        ),
      ),
    );
  }
}
