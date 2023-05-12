import 'package:actividad1/features/games/data/datasources/game_remote_data_source.dart';
import 'package:actividad1/features/games/domain/usecases/get_games_usecase.dart';

import 'features/games/data/repositories/games_repository_impl.dart';

class UsecaseConfig {
  GetGameUsecase? getGameUsecase;
  GameRepositoryImpl? gameRepositoryImpl;
  GamesRemoteDataSourceImp? gamesRemoteDataSourceImp;

  UsecaseConfig() {
    gamesRemoteDataSourceImp = GamesRemoteDataSourceImp();
    gameRepositoryImpl =
        GameRepositoryImpl(gamesRemoteDataSource: gamesRemoteDataSourceImp!);
    getGameUsecase = GetGameUsecase(gameRepositoryImpl!);
  }
}
