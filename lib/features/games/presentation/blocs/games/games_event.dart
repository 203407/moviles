part of 'games_bloc.dart';

@immutable
abstract class GamesEvent {}

class GetGames extends GamesEvent {}

class PressDeleteGameButton extends GamesEvent {
  final String id;

  PressDeleteGameButton({required this.id});
}

class GamesOffline extends GamesEvent {}
