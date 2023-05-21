import 'package:actividad1/features/games/data/models/games_models.dart';
import 'package:actividad1/features/games/domain/entities/game.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert' as convert;

abstract class GamesRemoteDataSource {
  // https://jsonplaceholder.typicode.com/posts
  Future<List<GamesModel>> getGames(d);
  Future<String> createGames(nombre, descrip, img);
  Future<String> updateGames();
  Future<String> deleteGames();
}

class GamesRemoteDataSourceImp implements GamesRemoteDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<GamesModel>> getGames(d) async {
    //print('DataSource');

    print("aqui esta el pase de parametros" + d.toString());

    List games = [];
    CollectionReference collectionReferenceGames = db.collection('games');

    QuerySnapshot queryGames = await collectionReferenceGames.get();

    queryGames.docs.forEach((element) {
      games.add(element.data());
    });

    return games.map<GamesModel>((data) => GamesModel.fromJson(data)).toList();
  }

  @override
  Future<String> createGames(nombre, descrip, img) async {
    int a = 0;

    final data = {
      "Titulo": nombre.toString(),
      "Imagen": img.toString(),
      "Descripcion": descrip.toString(),
      "Estrellas": a
    };

    await db.collection("games").add(data);

    return "si";
  }

  @override
  Future<String> updateGames() async {
    String a = "";
    return a;
  }

  @override
  Future<String> deleteGames() async {
    String a = "";
    return a;
  }
}
