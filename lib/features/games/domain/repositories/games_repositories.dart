import 'package:actividad1/features/games/domain/entities/game.dart';

abstract class GamesRepository {
  Future<List<Game>> getGames();
}
