import 'package:flutter/material.dart';

class PseScreen extends StatelessWidget {
  const PseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arc à poulie PSE Lazer 2024"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Découvrez le PSE Lazer 2024",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: InteractiveViewer(
                        child: Image.asset(
                          'assets/images/pse.jpg',
                          width: 900,
                        ),
                      ),
                    );
                  },
                );
              },
              child: Image.asset(
                'assets/images/pse.jpg',
                width: 600,
              ),
            ),

            const SizedBox(height: 16),

            // Caractéristiques de l'arc
            const Text(
              "Caractéristiques techniques :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              """
              - Axe à axe : 37"
              - Vitesse IBO : 323 fps
              - Hauteur de l'arceau : 7.5"
              - Poids net : 4.5 lbs
              - Longueur de tirage : 24 - 30.5"
              - Poids de tirage : 40, 50, 60 lbs
              """,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Informations supplémentaires
            const Text(
              "Détails :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Le Lazer 2024 de PSE est conçu pour offrir une expérience de tir fluide et cohérente, grâce à sa came NF. Ce modèle est équipé de branches larges et d'un élévateur droit pour une rigidité optimale pendant tout le cycle de traction. Profitez du profil de poignée usiné de PSE (0 degré), avec une poignée modulaire de 4 degrés installée en usine pour réduire la tension du poignet et favoriser une ligne de force naturelle. Choisissez votre angle de poignée parmi 0, 4, 8 ou 12 degrés pour un ajustement personnalisé.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Prix
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Prix : 880,00 € TTC",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
