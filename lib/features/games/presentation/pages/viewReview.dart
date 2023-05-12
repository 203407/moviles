import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../notifications/notification_api.dart';

class ViewReview extends StatelessWidget {
  const ViewReview(
      {super.key, this.titulo, this.imagen, this.descrip, this.estrellas});
  final String? titulo, imagen, descrip;
  final double? estrellas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 35, 35),
      appBar: AppBar(
        actions: <Widget>[],
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: const [
            CircleAvatar(
                backgroundImage: AssetImage('assets/images/games.jpg')),
            Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                "GameReview",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(208, 0, 0, 0),
      ),
      body: Column(children: [
        SizedBox(
          child: Image.network(imagen!),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text("Nombre del juego:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Text(titulo!),
              ),
              const Text("Reseña:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 20, left: 10, right: 10),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    width: 300,
                    height: 100,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            descrip!,
                          ),
                        ),
                      ),
                    )),
              ),
              const Text("Calificacion",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              RatingBar.builder(
                initialRating: estrellas!.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                // ignore: prefer_const_constructors
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // ignore: avoid_print
                  print(rating.toInt());
                  print(titulo);
                  showNotification(
                      title: 'Haz calificado $titulo',
                      body:
                          'Gracias por tus $rating estrellas, sigue navegando y descubre nuevos juegos!');
                },
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
