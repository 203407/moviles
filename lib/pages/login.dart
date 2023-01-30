import 'package:actividad1/pages/register.dart';
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
                      // child: Image.asset(
                      //   'assets/images/ne.jpg',
                      //   colorBlendMode: BlendMode.darken,
                      //   fit: BoxFit.fitWidth,
                      // )),
                      const Padding(
                          padding: EdgeInsetsDirectional.only(bottom: 20),
                          child: TextField(
                            decoration: InputDecoration(hintText: 'email'),
                            // onChanged: (value) =>
                            //     print('First text field: $value'))),
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
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Aceptar')),
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
