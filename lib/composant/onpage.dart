import 'package:flutter/material.dart';

class onpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100], // Couleur de fond violet clair
      appBar: AppBar(
        title: Text('Choose Role'),
        automaticallyImplyLeading: false, // Supprime la flèche de retour
        backgroundColor: Colors.pink, // Couleur de fond rose pour l'appBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Redirection vers la page "Authentification utilisateur"
                Navigator.pushNamed(context, '/authentication');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // Couleur turquoise
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text('Utilisateur', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Redirection vers la page "Authentification administrateur"
                Navigator.pushNamed(context, '/authenc');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent, // Couleur rose fuchsia
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text('Administrateur', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // Redirection vers la page "Contactez-nous"
                Navigator.pushNamed(context, '/contactez-nous');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink, // Couleur rose fuchsia
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text('Contactez-nous',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white)), // Texte blanc
            ),
          ],
        ),
      ),
    );
  }
}
