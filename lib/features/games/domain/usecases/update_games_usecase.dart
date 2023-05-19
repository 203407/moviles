import 'package:actividad1/features/games/domain/entities/game.dart';
import 'package:actividad1/features/games/domain/repositories/games_repositories.dart';

class UpdateGameUsecase {
  final GamesRepository gamesRepository;

  UpdateGameUsecase(this.gamesRepository);

  Future<String> execute() async {
    return await gamesRepository.updateGames();
  }
}
