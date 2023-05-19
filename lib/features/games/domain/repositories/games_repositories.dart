import 'package:actividad1/features/games/domain/entities/game.dart';

abstract class GamesRepository {
  Future<List<Game>> getGames();
  Future<String> updateGames();
  Future<String> createGames();
  Future<String> deleteGames();
}
