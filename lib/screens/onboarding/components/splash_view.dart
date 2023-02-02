import 'package:actividad1/screens/onboarding/body_boarding.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsetsDirectional.only(top: 0),
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/images/top.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 55.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BodyBoarding()));
                },
                child: const Image(
                  image: AssetImage('assets/images/iconc.png'),
                  width: 230,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 167.96),
              child: Image(
                image: AssetImage('assets/images/bottom.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
