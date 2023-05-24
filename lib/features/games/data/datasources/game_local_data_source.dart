import 'dart:convert';

import 'package:actividad1/features/games/data/models/games_models.dart';
import 'package:actividad1/features/games/domain/entities/game.dart';
import 'package:actividad1/features/games/presentation/pages/viewReview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

abstract class GamesLocalDataSource {
  // https://jsonplaceholder.typicode.com/posts
  Future<List<GamesModel>> getGames();
  // Future<void> saveGames(List<GamesModel> games);
  Future<String> createGames(nombre, descrip, img);
  Future<String> updateGames(id, stars, descri, titulo, img);
  Future<void> deleteGames(id);
}

class GamesLocalDataSourceImp implements GamesLocalDataSource {
  @override
  Future<List<GamesModel>> getGames() async {
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String gamesString = sharedPreferences.getString('nombre') ?? "[]";
    List<GamesModel> games = jsonDecode(gamesString)
        .map<GamesModel>((data) => GamesModel.fromJson(data))
        .toList();

    return games;
  }

  @override
  Future<String> createGames(nombre, descrip, img) async {
    final newGame = Game(
      id: 'local_$nombre', // Genera un ID local temporal
      estrellas: 0,
      descripcion: descrip,
      imagen: img,
      titulo: nombre,
    );

    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String usersString = sharedPreferences.getString('localData') ?? "[]";
    List<dynamic> dataList = convert.jsonDecode(usersString);

    List<Game> listGame = dataList.map((map) => Game.fromMap(map)).toList();
    listGame.add(newGame);

    List<Map<String, dynamic>> encodedList =
        listGame.map((note) => note.toMap()).toList();
    String encodedNotes = json.encode(encodedList);
    sharedPreferences.setString('localData', encodedNotes);
    if (sharedPreferences.containsKey('createGameOffline')) {
      // print('exists');
      String? encodedPkCache = sharedPreferences.getString('createGameOffline');
      sharedPreferences.remove('createGameOffline');
      // if (encodedPkCache != null) {
      List<dynamic> decodedList = json.decode(encodedPkCache!);
      List<Game> gameslocal =
          decodedList.map((map) => Game.fromMap(map)).toList();

      gameslocal.add(newGame);
      List<Map<String, dynamic>> encodedList =
          gameslocal.map((note) => note.toMap()).toList();
      String encodedNotes = json.encode(encodedList);
      sharedPreferences.setString('createGameOffline', encodedNotes);
    } else {
      // print('not exists');
      List<Game> gamesLocal = [];
      gamesLocal.add(newGame);
      List<Map<String, dynamic>> encodedList =
          gamesLocal.map((note) => note.toMap()).toList();
      String encodedPks = json.encode(encodedList);
      sharedPreferences.setString('createGameOffline', encodedPks);
    }

    return newGame.id;
  }

  @override
  Future<String> updateGames(id, stars, descri, titulo, img) async {
    final updatedGame = Game(
      id: id,
      estrellas: stars,
      descripcion: descri,
      imagen: img,
      titulo: titulo,
    );

    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String usersString = sharedPreferences.getString('localData') ?? "[]";
    List<dynamic> dataList = convert.jsonDecode(usersString);

    List<Game> listGame = dataList.map((map) => Game.fromMap(map)).toList();
    listGame.add(updatedGame);

    List<Map<String, dynamic>> encodedList =
        listGame.map((note) => note.toMap()).toList();
    String encodedNotes = json.encode(encodedList);
    sharedPreferences.setString('localData', encodedNotes);
    if (sharedPreferences.containsKey('updateGameOffline')) {
      // print('exists');
      String? encodedPkCache = sharedPreferences.getString('updateGameOffline');
      sharedPreferences.remove('updateGameOffline');
      // if (encodedPkCache != null) {
      List<dynamic> decodedList = json.decode(encodedPkCache!);
      List<Game> gameslocal =
          decodedList.map((map) => Game.fromMap(map)).toList();

      gameslocal.add(updatedGame);
      List<Map<String, dynamic>> encodedList =
          gameslocal.map((note) => note.toMap()).toList();
      String encodedNotes = json.encode(encodedList);
      sharedPreferences.setString('updateGameOffline', encodedNotes);
    } else {
      // print('not exists');
      List<Game> gamesLocal = [];
      gamesLocal.add(updatedGame);
      List<Map<String, dynamic>> encodedList =
          gamesLocal.map((note) => note.toMap()).toList();
      String encodedPks = json.encode(encodedList);
      sharedPreferences.setString('updateGameOffline', encodedPks);
    }
    return "Actualizado con exito";
  }

  @override
  Future<void> deleteGames(id) async {
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    // Obtener la lista actual de juegos
    String gamesString = sharedPreferences.getString('localData') ?? "[]";
    List<dynamic> dataList = convert.jsonDecode(gamesString);
    List<Game> listGame = dataList.map((map) => Game.fromMap(map)).toList();

    // Eliminar el juego con el ID correspondiente
    listGame.removeWhere((game) => game.id == id);

    // Guardar la lista actualizada en localData
    List<Map<String, dynamic>> encodedList =
        listGame.map((game) => game.toMap()).toList();
    String encodedNotes = json.encode(encodedList);
    sharedPreferences.setString('localData', encodedNotes);

    if (sharedPreferences.containsKey('deleteGameOffline')) {
      // print('exists');
      String? encodedPkCache = sharedPreferences.getString('deleteGameOffline');
      sharedPreferences.remove('deleteGameOffline');
      // if (encodedPkCache != null) {
      List<dynamic> decodedList = json.decode(encodedPkCache!);
      List<Game> gameslocal =
          decodedList.map((map) => Game.fromMap(map)).toList();
      // gameslocal.removeWhere((game) => game.id == id);

      gameslocal.add(id);
      List<Map<String, dynamic>> encodedList =
          gameslocal.map((note) => note.toMap()).toList();
      String encodedNotes = json.encode(encodedList);
      sharedPreferences.setString('deleteGameOffline', encodedNotes);
    } else {
      // print('not exists');
      List<String> gamesLocal = [];
      gamesLocal.add(id);
      // List<Map<String, dynamic>> encodedList =
      //     gamesLocal.map((note) => note.toMap()).toList();
      String encodedPks = json.encode(gamesLocal);
      sharedPreferences.setString('deleteGameOffline', encodedPks);
    }
  }
}
