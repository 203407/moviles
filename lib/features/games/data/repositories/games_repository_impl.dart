import 'dart:async';
import 'package:actividad1/features/games/data/datasources/game_remote_data_source.dart';
import 'package:actividad1/features/games/domain/entities/game.dart';
import 'package:actividad1/features/games/domain/repositories/games_repositories.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../datasources/game_local_data_source.dart';

class GameRepositoryImpl implements GamesRepository {
  final GamesRemoteDataSource gamesRemoteDataSource;
  final GamesLocalDataSource localDataSource;

  GameRepositoryImpl(
      {required this.gamesRemoteDataSource, required this.localDataSource});

  @override
  Future<String> updateGames(id, stars, descri, titulo, img) async {
    // Actualiza los juegos en ambos data sources
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      await gamesRemoteDataSource.updateGames(id, stars, descri, titulo, img);
    } else {
      await localDataSource.updateGames(id, stars, descri, titulo, img);
    }

    return "success";
  }

  @override
  Future<String> createGames(nombre, descrip, img) async {
    // Crea los juegos en ambos data sources
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      await gamesRemoteDataSource.createGames(nombre, descrip, img);
    } else {
      await localDataSource.createGames(nombre, descrip, img);
    }

    return "success";
  }

  @override
  Future<String> deleteGames(id) async {
    // Elimina los juegos en ambos data sources
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      await gamesRemoteDataSource.deleteGames(id);
    } else {
      await localDataSource.deleteGames(id);
    }

    return "success";
  }

  @override
  Future<List<Game>> getGames() async {
    return await gamesRemoteDataSource.getGames();
  }
}
