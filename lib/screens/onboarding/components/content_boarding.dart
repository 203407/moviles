import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({super.key, this.texto, this.title, this.image});
  final String? title, texto, image;
  // final String? tittle, title2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 160.0),
      child: Column(
        children: [
          Image(
            image: AssetImage(image!),
            width: 170,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              title!,
              style: const TextStyle(
                  color: Color.fromARGB(255, 103, 0, 121),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            texto!,
          )
        ],
      ),
    );
  }
}
