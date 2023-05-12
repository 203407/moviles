import 'package:actividad1/features/games/presentation/blocs/games_bloc.dart';
import 'package:actividad1/features/games/presentation/pages/bt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignF extends StatefulWidget {
  const SignF({super.key});

  @override
  State<SignF> createState() => _SignFState();
}

class _SignFState extends State<SignF> {
  @override
  void initState() {
    super.initState();
    context.read<GamesBloc>().add(GetGames());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Juegos"),
        ),
        body: BlocBuilder<GamesBloc, GamesState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Loaded) {
              return SingleChildScrollView(
                child: Column(
                    children: state.games.map((games) {
                  return Bt(
                    titulo: games.titulo,
                    imagen: games.imagen,
                    descrip: games.descripcion,
                    estrellas: games.estrellas.toDouble(),
                  );
                }).toList()),
              );
            } else if (state is Error) {
              return Center(
                child: Text(state.error,
                    style: const TextStyle(color: Colors.red)),
              );
            } else {
              return Text('s');
            }
          },
        ));
  }
}
