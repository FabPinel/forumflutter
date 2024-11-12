import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DebuterScreen extends StatefulWidget {
  const DebuterScreen({Key? key}) : super(key: key);

  @override
  _DebuterScreenState createState() => _DebuterScreenState();
}

class _DebuterScreenState extends State<DebuterScreen> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _pseudoController = TextEditingController();
  List<Map<String, String>> _comments = [];

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  void _loadComments() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedComments =
        prefs.getStringList('debuter_screen_comments');
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

  void _saveComment() async {
    final prefs = await SharedPreferences.getInstance();
    String pseudo =
        _pseudoController.text.isNotEmpty ? _pseudoController.text : "Anonyme";
    String comment = _commentController.text;

    if (comment.isNotEmpty) {
      setState(() {
        _comments.add({'pseudo': pseudo, 'comment': comment});
      });

      List<String> commentsToSave = _comments
          .map((commentData) =>
              '${commentData['pseudo']}||${commentData['comment']}')
          .toList();
      await prefs.setStringList('debuter_screen_comments', commentsToSave);

      _commentController.clear();
      _pseudoController.clear();
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    _pseudoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stinger Extreme : Un Arc Abordable"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "PSE Stinger Extreme : Un excellent choix pour les débutants",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Le PSE Stinger Extreme est une excellente option pour les tireurs débutants ou ceux qui souhaitent passer au niveau supérieur sans se ruiner. "
              "Disponible dès 299 \$ pour le modèle de base et jusqu'à 494,97 \$ pour un package complet, cet arc propose une grande variété d'options de personnalisation.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: InteractiveViewer(
                        child: Image.asset(
                          'assets/images/extreme.jpg',
                          width: 900,
                        ),
                      ),
                    );
                  },
                );
              },
              child: Image.asset(
                'assets/images/extreme.jpg',
                width: 600,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Ajouter un Commentaire :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _pseudoController,
              decoration: const InputDecoration(
                hintText: "Entrez votre pseudo...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _commentController,
              decoration: const InputDecoration(
                hintText: "Écrivez votre commentaire ici...",
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveComment,
              child: const Text("Sauvegarder le commentaire"),
            ),
            const SizedBox(height: 16),
            const Text(
              "Commentaires :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
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
          ],
        ),
      ),
    );
  }
}
