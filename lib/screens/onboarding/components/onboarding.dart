import 'package:actividad1/pages/login.dart';
import 'package:actividad1/screens/onboarding/components/content_boarding.dart';
import 'package:actividad1/screens/onboarding/components/content_page.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OnBoarding> {
  late PageController controlito;
  int currentPage = 0;
  List<Map<dynamic, dynamic>> boardingData = [
    {
      "Image": "assets/images/B1.png",
      "Title": "ESPARCIMIENTO",
      "Texto":
          "Brindamos todos los servicios para \n    \t    consentir a tu mascota"
    },
    {
      "Image": "assets/images/B2.png",
      "Title": "ADOPCIÓN",
      "Texto": "La casa para tus mascotas queridas"
    },
    {
      "Image": "assets/images/B3.png",
      "Title": "HOSPITALIDAD",
      "Texto": "Tu mascota dormira demasiado"
    },
    {
      "Image": "assets/images/B4.png",
      "Title": "VETERINARIA",
      "Texto": "Todos los cuidados necesarios  \n \t\t  para que se sienta bien"
    },
    {
      "Image": "assets/images/B5.png",
      "Title": "TIENDA",
      "Texto":
          "Compra todas las necesidades de \n \t tu mascota sin salir de casa"
    }
  ];

  @override
  void initState() {
    controlito = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controlito.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: controlito,
              itemBuilder: (context, index) => ContentBoarding(
                image: boardingData[index]['Image'],
                title: boardingData[index]['Title'],
                texto: boardingData[index]['Texto'],
              ),
              itemCount: boardingData.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(boardingData.length,
                        (index) => page(index, currentPage)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: SizedBox(
                  width: 300,
                  child: OutlinedButton(
                    onPressed: () {
                      if (controlito.page == 4) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      }
                      controlito.nextPage(
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 300));
                    },
                    style: OutlinedButton.styleFrom(
                        shadowColor: Colors.black,
                        backgroundColor: currentPage == 4
                            ? const Color.fromARGB(255, 112, 171, 113)
                            : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    child: Text(
                      currentPage == 4 ? 'Continuar' : 'Siguiente',
                      style: currentPage == 4
                          ? const TextStyle(color: Colors.white, fontSize: 18)
                          : const TextStyle(
                              color: Color.fromARGB(255, 113, 113, 113),
                              fontSize: 18),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
