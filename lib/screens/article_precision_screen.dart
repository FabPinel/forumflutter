import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticlePrecisionScreen extends StatefulWidget {
  const ArticlePrecisionScreen({Key? key}) : super(key: key);

  @override
  _ArticlePrecisionScreenState createState() => _ArticlePrecisionScreenState();
}

class _ArticlePrecisionScreenState extends State<ArticlePrecisionScreen> {
  // Controllers pour gérer l'entrée utilisateur
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _pseudoController = TextEditingController();
  List<Map<String, String>> _comments =
      []; // Liste pour stocker les commentaires

  @override
  void initState() {
    super.initState();
    _loadComments(); // Charger les commentaires sauvegardés dès le démarrage de l'écran
  }

  // Fonction pour charger les commentaires depuis SharedPreferences
  void _loadComments() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedComments =
        prefs.getStringList('precision_article_comments');
    if (savedComments != null) {
      setState(() {
        _comments = savedComments.map((commentData) {
          List<String> parts = commentData.split('||');
          return {
            'pseudo': parts[0],
            'comment': parts[1],
          };
        }).toList();
      });
    }
  }

  // Fonction pour sauvegarder un nouveau commentaire
  void _saveComment() async {
    final prefs = await SharedPreferences.getInstance();

    // Récupération du pseudo et du commentaire
    String pseudo =
        _pseudoController.text.isNotEmpty ? _pseudoController.text : "Anonyme";
    String comment = _commentController.text;

    if (comment.isNotEmpty) {
      setState(() {
        _comments.add({'pseudo': pseudo, 'comment': comment});
      });

      // Formatage des commentaires pour sauvegarde dans SharedPreferences
      List<String> commentsToSave = _comments
          .map((commentData) =>
              '${commentData['pseudo']}||${commentData['comment']}')
          .toList();
      await prefs.setStringList('precision_article_comments', commentsToSave);

      // Nettoyage des champs de texte
      _commentController.clear();
      _pseudoController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conseils pour améliorer sa précision"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre principal de l'article
            const Text(
              "Conseils pour améliorer sa précision",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Introduction
            const Text(
              "Vous pratiquez le tir à l’arc et souhaitez perfectionner votre technique pour viser le centre de la cible avec précision ? "
              "Sachez que ce sport exige de la concentration et un entraînement intensif. Voici quelques conseils pour vous aider à atteindre vos objectifs.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Section : Comment améliorer sa précision ?
            const Text(
              "Comment améliorer sa précision ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "La précision au tir à l’arc repose sur la maîtrise de plusieurs techniques approuvées par les plus grands archers. "
              "En travaillant votre position, votre visée, votre prise de l’arc et votre lâcher, vous augmenterez significativement vos chances de toucher le centre de la cible.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 8),
            Image.asset(
              'assets/images/precision1.jpg',
              width: 600,
            ),
            const SizedBox(height: 16),

            // Section : L’œil directeur a-t-il une influence sur le tir ?
            const Text(
              "L’œil directeur a-t-il une influence sur le tir ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Oui, l’œil directeur joue un rôle majeur dans la précision. Il est même plus important que la main dominante, car il aide à aligner "
              "la visée et évaluer la distance entre vous et la cible. Assurez-vous de connaître votre œil directeur pour viser efficacement.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Section : Quelle est la posture idéale pour viser avec précision ?
            const Text(
              "Quelle est la posture idéale pour viser avec précision ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Pour un tir précis, la posture est cruciale. Placez-vous de manière stable, aligné avec la cible, et écartez vos pieds à la largeur des épaules. "
              "Gardez le buste droit, la tête stable et confortable. Un bon positionnement vous aidera à éviter les frottements et à gagner en précision.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Section : Pourquoi utiliser un viseur ou un œilleton ?
            const Text(
              "Pourquoi utiliser un viseur ou un œilleton ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Un viseur ou œilleton aide à aligner le réticule avec la cible, mais il peut être influencé par la fatigue, la lumière et le stress. "
              "Bien qu'il améliore la précision, la visée avec un seul œil nécessite un certain temps d’adaptation.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Section : Quelles sont les étapes à respecter ?
            const Text(
              "Quelles sont les étapes à respecter ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Pour garantir un bon tir, respectez la posture, le bras d’arc, le bras de corde et l’encochage. Une prise en main souple absorbera les vibrations, et "
              "l’encochage permet d’aligner parfaitement la corde pour un tir précis.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Section : Quelques conseils pour viser le centre avec précision
            const Text(
              "Quelques conseils pour viser le centre avec précision",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "- Déterminez votre œil directeur.\n"
              "- Stabilisez votre corps en tenant compte du recul.\n"
              "- Concentrez-vous sur le centre de la cible au moment de relâcher la corde.\n"
              "- Maintenez une prise ferme et une position stable pour chaque tir.\n"
              "- Assurez un lâcher souple pour une meilleure trajectoire.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 8),
            Image.asset(
              'assets/images/precision2.jpg',
              width: 600,
            ),
            const SizedBox(height: 16),

            // Section finale : Comment viser avec un arc classique ou à poulie
            const Text(
              "Comment viser avec un arc classique ou à poulie",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Que vous utilisiez un arc classique ou à poulie, la précision repose sur le réglage, la posture et le contrôle du viseur. "
              "Avec un arc sans viseur, le mouvement doit être fluide et maintenu après le lâcher pour garantir une trajectoire stable.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Section pour les commentaires
            const Text(
              "Fil de Discussion :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Affichage des commentaires
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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

            // Champ pour entrer le pseudo
            const Text(
              "Ajouter un pseudo :",
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

            // Champ pour entrer le commentaire
            const Text(
              "Ajouter un commentaire :",
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

            // Bouton pour sauvegarder le commentaire
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
