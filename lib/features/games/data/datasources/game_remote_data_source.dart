import 'package:actividad1/features/games/data/models/games_models.dart';
import 'package:actividad1/features/games/domain/entities/game.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert' as convert;

abstract class GamesRemoteDataSource {
  // https://jsonplaceholder.typicode.com/posts
  Future<List<GamesModel>> getGames();
  Future<String> createGames();
  Future<String> updateGames();
  Future<String> deleteGames();
}

class GamesRemoteDataSourceImp implements GamesRemoteDataSource {
  @override
  Future<List<GamesModel>> getGames() async {
    //print('DataSource');

    FirebaseFirestore db = FirebaseFirestore.instance;

    List games = [];
    CollectionReference collectionReferenceGames = db.collection('games');

    QuerySnapshot queryGames = await collectionReferenceGames.get();

    queryGames.docs.forEach((element) {
      games.add(element.data());
    });

    return games.map<GamesModel>((data) => GamesModel.fromJson(data)).toList();
  }

  @override
  Future<String> createGames() async {
    String a = "";
    return a;
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
