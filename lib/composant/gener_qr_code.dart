import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class genere_qr_code extends StatefulWidget {
  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<genere_qr_code> {
  late String _url; // Lien URL pour le code QR

  @override
  void initState() {
    super.initState();
    _url = ''; // Initialiser avec une chaîne vide
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Ajoutez votre logique ici pour contrôler le comportement lors du retour en arrière
        // Par exemple, vous pouvez vérifier si _url est vide ou non
        // Si _url est vide, vous pouvez permettre le retour, sinon vous pouvez afficher une boîte de dialogue pour confirmer le retour
        return true; // Retourne true pour permettre le retour en arrière
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('QR Code Generator'),
          backgroundColor: Colors.pink,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Retour en arrière lorsque l'icône est cliquée
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: _url,
                version: QrVersions.auto,
                size: 200.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Scan the QR code',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter URL',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _url =
                          value; // Mettre à jour l'URL lorsque l'utilisateur saisit du texte
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Ajouter votre logique pour enregistrer le lien ou la note générée ici
                  // Par exemple, vous pouvez utiliser un package de gestion des données pour enregistrer le lien ou la note dans un fichier ou une base de données
                  // Vous pouvez également afficher une boîte de dialogue pour confirmer que le lien ou la note a été enregistré avec succès
                },
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
