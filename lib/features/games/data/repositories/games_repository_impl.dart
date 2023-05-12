import 'package:actividad1/features/games/data/datasources/game_remote_data_source.dart';
import 'package:actividad1/features/games/domain/entities/game.dart';
import 'package:actividad1/features/games/domain/repositories/games_repositories.dart';

class GameRepositoryImpl implements GamesRepository {
  final GamesRemoteDataSource gamesRemoteDataSource;

  GameRepositoryImpl({required this.gamesRemoteDataSource});

  @override
  Future<List<Game>> getGames() async {
    return await gamesRemoteDataSource.getGames();
  }
}