import 'package:flutter/material.dart';

class ArticleNimeScreen extends StatelessWidget {
  const ArticleNimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nimes Indoor World Archery"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre de l'article
            const Text(
              "L'Arc Club de Nîmes - Tournoi International 2025",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Contenu de l'article
            const Text(
              "L'Arc Club de Nîmes organise en 2025, la XXVII ° édition de son "
              "Tournoi International de tir à l'arc en salle. Un événement à "
              "retrouver du 16 au 19 janvier 2025.\n\n"
              "Trois jours de compétition pour un événement exceptionnel avec les "
              "meilleurs archers du monde. Ouverture des inscriptions au cours "
              "du mois de septembre.\n\n"
              "Fort de son expérience en tant que organisateur des Championnats "
              "du Monde en salle de tir à l’arc en 2003 et 2014 et de pas moins "
              "de 25 Tournois internationaux en salle, l’Arc club de Nîmes est "
              "intégré depuis huit ans dans le circuit Indoor World Series du tir "
              "à l’arc avec Las Vegas (USA).\n\n"
              "C’est donc l’élite mondiale et tous les passionnés de tir à l'arc "
              "qui se donnent rendez-vous dans la cité gardoise, référence "
              "européenne, et capitale mondiale du tir à l’arc pendant ce week-end.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Image sous le texte
            Center(
              child: Image.asset(
                'assets/images/nimes_tournament.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
