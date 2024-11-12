import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:forum/screens/article_nime_screen.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Forum de Tir à l\'Arc'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildForumHeader(),
          const SizedBox(height: 20),
          _buildForumSection(
            context,
            title: "Prochains évènements",
            items: [
              "Calendrier saison 2024/2025 région PACA",
              "L'Arc Club de Nîmes - Tournoi International 2025",
            ],
            icon: Icons.emoji_events,
          ),
          const SizedBox(height: 20),
          _buildForumSection(
            context,
            title: "Derniers résultats",
            items: [
              "Championnat régional - 28 octobre 2024",
              "Compétition nationale - 15 octobre 2024",
              "Open de Paris - 5 septembre 2024"
            ],
            icon: Icons.emoji_events,
          ),
          const SizedBox(height: 20),
          _buildForumSection(
            context,
            title: "Nouveaux équipements",
            items: [
              "Arc à poulie PSE Lazzer 2024",
              "Flèches en aluminium - X23"
            ],
            icon: Icons.architecture,
          ),
          const SizedBox(height: 20),
          _buildForumSection(
            context,
            title: "Discussions récentes",
            items: [
              "Conseils pour améliorer sa précision",
              "Quel est le meilleur équipement pour débuter ?"
            ],
            icon: Icons.chat_bubble,
          ),
        ],
      ),
    );
  }

  Widget _buildForumHeader() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bienvenue sur le Forum de Tir à l\'Arc!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Retrouvez ici les derniers résultats, découvrez les nouveautés en équipements, et discutez avec d\'autres passionnés.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildForumSection(BuildContext context,
      {required String title,
      required List<String> items,
      required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // Map des items pour créer des Cards avec la logique du PDF ou de l'article
        ...items.map((item) => Card(
              child: ListTile(
                leading: Icon(icon, color: Colors.green),
                title: Text(item),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  if (item == "Calendrier saison 2024/2025 région PACA") {
                    _openPDF(
                        "https://www.tirarcpaca.fr/media/uploaded/sites/11475/document/67326431bd309_Calendrierdu11112024au31032025Concoursetarbitresau111120243.pdf");
                  } else if (item ==
                      "L'Arc Club de Nîmes - Tournoi International 2025") {
                    // Navigation vers la page de l'article
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ArticleNimeScreen()),
                    );
                  }
                  // Ajoutez d'autres actions pour les autres éléments si nécessaire
                },
              ),
            )),
      ],
    );
  }

  // Fonction pour ouvrir le PDF
  void _openPDF(String url) async {
    final Uri pdfUrl = Uri.parse(url);
    if (await canLaunchUrl(pdfUrl)) {
      await launchUrl(pdfUrl);
    } else {
      throw 'Impossible d\'ouvrir $url';
    }
  }
}