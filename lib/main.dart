import 'package:flutter/material.dart';
import 'package:forum/screens/forum_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forum de Tir à l\'Arc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ForumHomePage(),
    );
  }
}

class ForumHomePage extends StatelessWidget {
  const ForumHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40), // Espacement pour simuler un appbar
              Center(
                child: Image.asset(
                  'assets/images/fta.png',
                  width: 300,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Bienvenue sur le Forum de Tir à l\'Arc!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Découvrez tout ce que ce forum a à offrir : des résultats de compétitions aux dernières actualités en passant par des conseils et des discussions passionnées.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              _buildSection(
                context,
                title: "Résultats Récents",
                description:
                    "Consultez les résultats des compétitions récentes pour suivre les performances.",
                icon: Icons.emoji_events,
              ),
              const SizedBox(height: 20),
              _buildSection(
                context,
                title: "Prochains Événements",
                description:
                    "Ne manquez aucun événement ! Découvrez le calendrier des compétitions et événements à venir.",
                icon: Icons.calendar_today,
              ),
              const SizedBox(height: 20),
              _buildSection(
                context,
                title: "Nouveaux Équipements",
                description:
                    "Restez informé des dernières innovations en matière d'équipement de tir à l'arc.",
                icon: Icons.architecture,
              ),
              const SizedBox(height: 20),
              _buildSection(
                context,
                title: "Discussions entre Passionnés",
                description:
                    "Participez aux discussions, échangez vos idées et trouvez des conseils utiles auprès des autres membres.",
                icon: Icons.chat,
              ),
              const SizedBox(height: 30),
              _buildCallToAction(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.green),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallToAction(BuildContext context) {
    return Card(
      color: Colors.green.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Prêt à découvrir plus de contenus passionnants ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ForumPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                "Je découvre",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
