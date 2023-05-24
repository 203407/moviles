import 'package:actividad1/features/games/data/datasources/game_remote_data_source.dart';
import 'package:actividad1/features/games/domain/usecases/create_games_usecase.dart';
import 'package:actividad1/features/games/domain/usecases/delete_games_usecase.dart';
import 'package:actividad1/features/games/domain/usecases/get_games_usecase.dart';
import 'package:actividad1/features/games/domain/usecases/update_games_usecase.dart';

import 'features/games/data/datasources/game_local_data_source.dart';
import 'features/games/data/repositories/games_repository_impl.dart';

class UsecaseConfig {
  GetGameUsecase? getGameUsecase;
  CreateGameUsecase? createGameUsecase;
  UpdateGameUsecase? updateGameUsecase;
  DeleteGameUsecase? deleteGameUsecase;
  GameRepositoryImpl? gameRepositoryImpl;
  GamesRemoteDataSourceImp? gamesRemoteDataSourceImp;
  GamesLocalDataSourceImp? gamesLocalDataSourceImpl;

  UsecaseConfig() {
    gamesRemoteDataSourceImp = GamesRemoteDataSourceImp();
    gamesLocalDataSourceImpl = GamesLocalDataSourceImp();

    gameRepositoryImpl = GameRepositoryImpl(
      gamesRemoteDataSource: gamesRemoteDataSourceImp!,
      localDataSource: gamesLocalDataSourceImpl!,
    );
    getGameUsecase = GetGameUsecase(gameRepositoryImpl!);
    createGameUsecase = CreateGameUsecase(gameRepositoryImpl!);
    updateGameUsecase = UpdateGameUsecase(gameRepositoryImpl!);
    deleteGameUsecase = DeleteGameUsecase(gameRepositoryImpl!);
  }
}
