import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true; // Pour gérer l'état du masquage du mot de passe

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Ajouter un utilisateur'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextFieldWithLabel(_firstNameController, 'Prénom'),
            SizedBox(height: 20),
            _buildTextFieldWithLabel(_lastNameController, 'Nom'),
            SizedBox(height: 20),
            _buildTextFieldWithLabel(_emailController, 'Age'),
            SizedBox(height: 20),
            _buildTextFieldWithLabel(_ageController, 'Email'),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                controller: _passwordController,
                obscureText:
                    _obscurePassword, // Masquer le texte du mot de passe si true
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12.0),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Inverser l'état du masquage du mot de passe
                      _obscurePassword = !_obscurePassword;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _saveProfile(context);
              },
              child: Text('ajout utilisateur'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(
      TextEditingController controller, String labelText) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12.0),
        ),
      ),
    );
  }

  void _saveProfile(BuildContext context) {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String age = _ageController.text;
    String password = _passwordController.text;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        age.isEmpty ||
        password.isEmpty) {
      // Afficher une alerte pour demander à remplir tous les champs
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Champs obligatoires'),
            content: Text('Veuillez remplir tous les champs.'),
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
    } else {
      // Logique pour enregistrer le profil

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Profil enregistré'),
            content: Text(
                'Le profil de $firstName $lastName a été enregistré avec succès.'),
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
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
