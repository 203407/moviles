part of 'games_bloc.dart';

@immutable
abstract class GamesState {}

class GamesInitial extends GamesState {}

class Loading extends GamesState {}

class Loaded extends GamesState {
  final List<Game> games;

  Loaded({required this.games});
}

class GameInitial extends GamesState {}

class Error extends GamesState {
  final String error;

  Error({required this.error});
}

// class GettingGames extends GamesState {}
// class GameTable extends GamesState {
//   final List<Game> games;

//   GameTable({required this.games});
// }
// class ErrorGettingGames extends GamesState {
//   final String message;

//   ErrorGettingGames({required this.message});
// }

// class DeletingGames extends GamesState {}
// class GamesDeleted extends GamesState {}
// class ErrorDeletingGames extends GamesState {
//   final String message;

//   ErrorDeletingGames({required this.message});
// }