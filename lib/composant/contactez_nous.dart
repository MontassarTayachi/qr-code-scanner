import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Contactez-nous'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nous Contacter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Adresse Email : commercial@elfouladh.com.tn',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'fax:(246) : +72 473 100',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Numéro de téléphone : (246)+72 473 222 / 72 473 054 )',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Adresse : menzel bourquiba , bizerte , tunis',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Heures d\'ouverture :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Lundi - Vendredi : 9h00 - 17h00',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'jeudi : 9h00 - 12h00',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
