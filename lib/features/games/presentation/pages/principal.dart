import 'dart:async';

import 'package:actividad1/features/games/presentation/blocs/games/games_bloc.dart';
import 'package:actividad1/features/games/presentation/pages/signF.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    interConectivity();
  }

  void interConectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      context.read<GamesBloc>().add(GetGames());
      ScaffoldMessenger.of(context).clearSnackBars();
    } else {
      const snackBar = SnackBar(
        content: Text(
          'Se perdió la conectividad Wi-Fi',
          style: TextStyle(),
        ),
        duration: Duration(days: 365),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi) {
        context.read<GamesBloc>().add(GetGames());
        ScaffoldMessenger.of(context).clearSnackBars();
      } else {
        const snackBar = SnackBar(
          content: Text(
            'Se perdió la conectividad Wi-Fi',
            style: TextStyle(),
          ),
          duration: Duration(days: 365),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(208, 0, 0, 0),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(),
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportContrains) {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text("GameReview",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50.0),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: (CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/games.jpg'))),
                    ),
                  ),
                  ElevatedButton(
                    /*Google*/
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 23, 151, 255),
                      onPrimary: const Color.fromARGB(255, 254, 253, 253),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {
                      Navigator.pushAndRemoveUntil(
                        context,
                        // MaterialPageRoute(builder: (context) => Sign(user: user)),
                        MaterialPageRoute(builder: (context) => const SignF()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 8),
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 255, 253, 253),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
            }),
          ),
        ));
  }
}
