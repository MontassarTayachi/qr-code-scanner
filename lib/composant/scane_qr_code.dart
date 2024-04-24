import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class lire_qr_code extends StatefulWidget {
  @override
  _LireQRCodePageState createState() => _LireQRCodePageState();
}

class _LireQRCodePageState extends State<lire_qr_code> {
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Lire QR Code'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _launchURL();
                },
                child: Text('Ouvrir le lien'),
              ),
              ElevatedButton(
                onPressed: () {
                  _showNotesDialog();
                },
                child: Text('Afficher les notes'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      // Récupérer les données du QR code
      String qrData = scanData.code ??
          ''; // Utilisation de l'opérateur ?? pour fournir une valeur par défaut
      // Utiliser les données du QR code selon les besoins
      print('QR Code Data: $qrData');
      // Vous pouvez ajouter d'autres traitements ici
    });
  }

  void _launchURL() async {
    String qrData = ''; // Initialiser avec une chaîne vide
    await for (Barcode scanData in controller.scannedDataStream) {
      qrData = scanData.code!;
      break; // Sortir de la boucle une fois que les données sont obtenues
    }
    if (qrData.isNotEmpty) {
      if (await canLaunch(qrData)) {
        await launch(qrData);
      } else {
        // Afficher un message d'erreur si l'URL ne peut pas être ouverte
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Impossible d\'ouvrir le lien.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showNotesDialog() {
    // Afficher une boîte de dialogue pour les notes
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notes'),
          content: Text('Afficher les notes ici.'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
