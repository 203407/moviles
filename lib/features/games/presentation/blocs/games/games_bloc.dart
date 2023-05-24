import 'dart:convert';

import 'package:actividad1/features/games/data/models/games_models.dart';
import 'package:actividad1/features/games/domain/entities/game.dart';
import 'package:actividad1/features/games/domain/usecases/create_games_usecase.dart';
import 'package:actividad1/features/games/domain/usecases/get_games_usecase.dart';
import 'package:actividad1/features/games/domain/usecases/update_games_usecase.dart';
import 'package:actividad1/main.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/usecases/delete_games_usecase.dart';

import 'dart:convert' as convert;
part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GetGameUsecase getGameUsecase;
  final DeleteGameUsecase deleteGameUsecase;
  final CreateGameUsecase createGameUsecase;
  final UpdateGameUsecase updateGameUsecase;

  GamesBloc(
      {required this.getGameUsecase,
      required this.deleteGameUsecase,
      required this.createGameUsecase,
      required this.updateGameUsecase})
      : super(GameInitial()) {
    on<GamesEvent>((event, emit) async {
      if (event is GetGames) {
        try {
          emit(Loading());
          final prefs = await SharedPreferences.getInstance();
          if (prefs.containsKey('createGameOffline')) {
            // print('Notes added offline');
            String? encodedNotesCache = prefs.getString('createGameOffline');
            prefs.remove('createGameOffline');
            // if (encodedNotesCache != null) {
            List<dynamic> decodedList = json.decode(encodedNotesCache!);
            List<Game> gameL =
                decodedList.map((map) => Game.fromMap(map)).toList();
            for (var game in gameL) {
              String resultado = await createGameUsecase.execute(
                  game.titulo, game.descripcion, game.imagen);
              await Future.delayed(const Duration(seconds: 1));
            }
            List<Game> response = await getGameUsecase.execute();
          }
          if (prefs.containsKey('updateGameOffline')) {
            // print('Notes added offline');
            String? encodedNotesCache = prefs.getString('updateGameOffline');
            prefs.remove('updateGameOffline');
            // if (encodedNotesCache != null) {
            List<dynamic> decodedList = json.decode(encodedNotesCache!);
            List<Game> gameL =
                decodedList.map((map) => Game.fromMap(map)).toList();
            for (var game in gameL) {
              String resultado = await updateGameUsecase.execute(game.id,
                  game.estrellas, game.descripcion, game.titulo, game.imagen);
              await Future.delayed(const Duration(seconds: 1));
            }
            List<Game> response = await getGameUsecase.execute();
          }

          if (prefs.containsKey('deleteGameOffline')) {
            // print('Notes added offline');
            String? encodedNotesCache = prefs.getString('deleteGameOffline');
            prefs.remove('deleteGameOffline');
            // if (encodedNotesCache != null) {
            List<dynamic> decodedList = json.decode(encodedNotesCache!);
            List<Game> gameL =
                decodedList.map((map) => Game.fromMap(map)).toList();

            for (var game in gameL) {
              String resultado = await deleteGameUsecase.execute(
                game.id,
              );
              await Future.delayed(const Duration(seconds: 1));
            }
            List<Game> response = await getGameUsecase.execute();
          }
          List<Game> response = await getGameUsecase.execute();
          emit(Loaded(games: response));
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is GamesOffline) {
        try {
          // emit(DeletingGames());
          final prefs = await SharedPreferences.getInstance();
          String? gameData = prefs.getString('localData');
          print(gameData);
          // if (gameData != null) {
          List<dynamic> dataList = convert.jsonDecode(gameData!);
          List<Game> listGame =
              dataList.map((map) => Game.fromMap(map)).toList();

          emit(Loaded(games: listGame));
          // }
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      }
    });
  }
}
