import 'package:actividad1/features/games/presentation/pages/viewReview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Bt extends StatelessWidget {
  const Bt({super.key, this.titulo, this.imagen, this.descrip, this.estrellas});
  final String? titulo, imagen, descrip;
  final double? estrellas;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
          width: 500,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 225, 220, 220),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 245, 245),
                  minimumSize: Size(2, 2),
                ),
                onPressed: () {},
                child: Image(
                  image: NetworkImage(imagen!),
                  height: 70,
                  width: 70,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 245, 245),
                      minimumSize: const Size(200, 200),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewReview(
                                  titulo: titulo,
                                  imagen: imagen,
                                  descrip: descrip,
                                  estrellas: estrellas)));
                    },
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30, bottom: 1),
                          child: Text(titulo!)),
                      Column(
                        children: [
                          const Text("Calificacion"),
                          RatingBar.builder(
                            initialRating: estrellas!,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            // ignore: prefer_const_constructors
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                    ]))),
          ])),
    );
  }
}
