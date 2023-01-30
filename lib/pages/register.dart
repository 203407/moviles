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
                            //border: OutlineInputBorder(
                            //borderSide: BorderSide(color: Colors.green))
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
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Aceptar')),
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
