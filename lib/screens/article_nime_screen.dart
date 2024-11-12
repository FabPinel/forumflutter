import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleNimeScreen extends StatefulWidget {
  const ArticleNimeScreen({Key? key}) : super(key: key);

  @override
  _ArticleNimeScreenState createState() => _ArticleNimeScreenState();
}

class _ArticleNimeScreenState extends State<ArticleNimeScreen> {
  TextEditingController _commentController = TextEditingController();
  TextEditingController _pseudoController = TextEditingController();
  List<Map<String, String>> _comments = [];

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  void _loadComments() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      List<String>? savedComments = prefs.getStringList('article_comments');
      if (savedComments != null) {
        _comments = savedComments.map((commentData) {
          List<String> parts = commentData.split('||');
          return {
            'pseudo': parts[0],
            'comment': parts[1],
          };
        }).toList();
      }
    });
  }

  void _saveComment() async {
    final prefs = await SharedPreferences.getInstance();

    String pseudo =
        _pseudoController.text.isEmpty ? "Anonyme" : _pseudoController.text;
    String comment = _commentController.text;

    if (comment.isNotEmpty) {
      setState(() {
        _comments.add({'pseudo': pseudo, 'comment': comment});
      });

      List<String> commentsToSave = _comments
          .map((commentData) =>
              '${commentData['pseudo']}||${commentData['comment']}')
          .toList();
      await prefs.setStringList('article_comments', commentsToSave);

      _commentController.clear();
      _pseudoController.clear();
    }
  }

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

            Center(
              child: Image.asset(
                'assets/images/nimes_tournament.jpg',
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Titre pour les commentaires
            const Text(
              "Fil de Discussion:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Afficher les commentaires sous forme de liste
            ListView.builder(
              shrinkWrap: true,
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_comments[index]['pseudo']!),
                  subtitle: Text(_comments[index]['comment']!),
                  leading: Icon(Icons.comment),
                );
              },
            ),

            const SizedBox(height: 16),

            // Champ pour ajouter un pseudo
            const Text(
              "Ajouter un pseudo:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _pseudoController,
              decoration: const InputDecoration(
                hintText: "Entrez votre pseudo...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Champ pour ajouter un commentaire
            const Text(
              "Ajouter un commentaire:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _commentController,
              decoration: const InputDecoration(
                hintText: "Écrivez votre commentaire ici...",
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),

            // Bouton pour sauvegarder le commentaire et le pseudo
            ElevatedButton(
              onPressed: _saveComment,
              child: const Text("Sauvegarder le commentaire"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    _pseudoController.dispose();
    super.dispose();
  }
}
