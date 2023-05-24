import 'dart:convert';

import 'package:actividad1/features/games/data/models/games_models.dart';
import 'package:actividad1/features/games/domain/entities/game.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

abstract class GamesRemoteDataSource {
  // https://jsonplaceholder.typicode.com/posts
  Future<List<GamesModel>> getGames();
  Future<String> createGames(nombre, descrip, img);
  Future<String> updateGames(id, stars, descri, titulo, img);
  Future<String> deleteGames(id);
}

class GamesRemoteDataSourceImp implements GamesRemoteDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<GamesModel>> getGames() async {
    final prefs = await SharedPreferences.getInstance();

    List<Game> games = [];
    CollectionReference collectionReferenceGames = db.collection('games');
    List gamesRender = [];
    var queryGames = await collectionReferenceGames.get();

    for (var doc in queryGames.docs) {
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      final gamesito = {
        'Estrellas': data['Estrellas'],
        'Descripcion': data['Descripcion'],
        'Imagen': data['Imagen'],
        'id': doc.id,
        'Titulo': data['Titulo']
      };
      Game game = Game(
          estrellas: data['Estrellas'],
          descripcion: data['Descripcion'],
          imagen: data['Imagen'],
          id: doc.id,
          titulo: data['Titulo']);
      games.add(game);
      gamesRender.add(gamesito);
    }

    List<Map<String, dynamic>> encodedList =
        games.map((note) => note.toMap()).toList();
    var dataGameOnline = gamesRender
        .map<GamesModel>((data) => GamesModel.fromJson(data))
        .toList();
    String encodedNotes = json.encode(encodedList);
    prefs.setString('localData', encodedNotes);
    return dataGameOnline;
  }

  @override
  Future<String> createGames(nombre, descrip, img) async {
    int numero = 0;
    print(nombre + descrip + img + "porque da null");
    final data = {
      "Titulo": nombre.toString(),
      "Imagen": img.toString(),
      "Descripcion": descrip.toString(),
      "Estrellas": numero
    };

    await db.collection("games").add(data);

    return "si";
  }

  @override
  Future<String> updateGames(id, stars, descri, titulo, img) async {
    final data = {
      "Titulo": titulo.toString(),
      "Imagen": img.toString(),
      "Descripcion": descri.toString(),
      "Estrellas": stars
    };

    await db.collection("games").doc(id).set(data);

    return "si2";
  }

  @override
  Future<String> deleteGames(id) async {
    await db.collection("games").doc(id).delete();
    return "si3";
  }
}
