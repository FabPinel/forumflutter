import 'package:flutter/material.dart';

class X23Screen extends StatelessWidget {
  const X23Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tube aluminium X23 d'EASTON"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Découvrez le Tube aluminium X23 d'EASTON",
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
                          'assets/images/x23.webp',
                          width: 900,
                        ),
                      ),
                    );
                  },
                );
              },
              child: Image.asset(
                'assets/images/x23.webp',
                width: 600,
              ),
            ),

            const SizedBox(height: 16),

            // Caractéristiques du tube X23
            const Text(
              "Caractéristiques techniques :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              """
              - Diamètre : 23 mm (maximum autorisé pour le tir en salle)
              - Matériau : Aluminium poli de haute qualité
              - Compatibilité : Arc à poulie et arc classique (puissance élevée)
              - Usage recommandé : Tir en salle
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
              "Le X23 d’EASTON est conçu pour le tir en salle avec un diamètre de 23 mm, le maximum autorisé pour les compétitions. Sa finition en aluminium poli offre un look élégant sur le pas de tir et garantit une résistance accrue, même pour les tirs les plus exigeants. La précision et les performances sont au rendez-vous avec ce modèle.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Résultat du test
            const Text(
              "Test et performances :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Lors de nos tests, le X23 a démontré une excellente stabilité et une précision impressionnante. La construction en aluminium dense garantit des groupements serrés même à longue distance, rendant ce tube idéal pour les compétiteurs. Bien que son poids puisse nécessiter une légère adaptation, les résultats sont largement à la hauteur des attentes.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Points forts et avis
            const Text(
              "Points forts et avis final :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              """
              - Points forts : Stabilité, précision, élégance, polyvalence
              - Points faibles : Légèrement plus lourd que certains modèles en carbone
              - Note : 9/10

              Verdict : Un choix parfait pour les archers en salle qui recherchent un tube fiable et performant. Le X23 est un investissement de qualité pour ceux qui veulent améliorer leurs performances.
              """,
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
                "Prix : 11,00 € unité (tube nu)",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
