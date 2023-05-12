import 'package:actividad1/features/games/presentation/blocs/games_bloc.dart';
import 'package:actividad1/features/games/presentation/pages/principal.dart';
import 'package:actividad1/usecase_config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../firebase_options.dart';

UsecaseConfig usecaseConfig = UsecaseConfig();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MultiBlocProvider(
      providers: [
        BlocProvider<GamesBloc>(
            create: (BuildContext context) =>
                GamesBloc(getGameUsecase: usecaseConfig.getGameUsecase!)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.grey,
        ),
        home: const Principal(),
        routes: <String, WidgetBuilder>{
          '/screen1': (BuildContext context) => const Principal(),
        },
      ),
    );
    //
    //return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // is not restarted.
    //     primarySwatch: Colors.grey,
    //   ),
    //   home: const Principal(),
    //   routes: <String, WidgetBuilder>{
    //     '/screen1': (BuildContext context) => const Principal(),
    //   },

    // );
  }
}
