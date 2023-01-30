import 'package:flutter/material.dart';

class View2 extends StatelessWidget {
  const View2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsetsDirectional.only(top: 140),
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/images/na.jpg'),
              width: 150,
            ),
            const Text("smokey nagata"),
            const Image(
              image: AssetImage('assets/images/na.jpg'),
              width: 150,
            ),
            const Text("smokey nagata"),
            const Image(
              image: AssetImage('assets/images/na.jpg'),
              width: 150,
            ),
            const Text("smokey nagata"),
            const Image(
              image: AssetImage('assets/images/na.jpg'),
              width: 150,
            ),
            const Text("smokey nagata"),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Regresar a view 1'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
