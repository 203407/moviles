import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: 120,
                              child: TextField(
                                decoration: InputDecoration(hintText: 'Age'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: 110,
                              child: TextField(
                                decoration: InputDecoration(hintText: 'Genero'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Username',
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Email'),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Last name'),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'First name'),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Phone'),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Email'),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'password'),
                          obscureText: true,
                        )),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration:
                              InputDecoration(hintText: 'Confirm password'),
                          obscureText: true,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 45.0),
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 112, 171, 113)),
                                child: const Text('Aceptar',
                                    style: TextStyle(color: Colors.white))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 112, 171, 113)),
                                child: const Text('Regresar',
                                    style: TextStyle(color: Colors.white))),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
