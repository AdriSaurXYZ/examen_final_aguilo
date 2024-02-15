import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NouArbreScreen extends StatefulWidget {
  @override
  _NouArbreScreenState createState() => _NouArbreScreenState();
}

class _NouArbreScreenState extends State<NouArbreScreen> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _varietatController = TextEditingController();
  // ... otros controladores para cada campo

  void _afegirArbre() {
    FirebaseFirestore.instance.collection('arbres').add({
      'nom': _nomController.text,
      'varietat': _varietatController.text,
      // ... otros campos
    }).then((result) {
      // Navegar de vuelta o mostrar un mensaje de éxito
    }).catchError((error) {
      // Manejar el error
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nou Arbre')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: _varietatController,
              decoration: InputDecoration(labelText: 'Varietat'),
            ),
            // ... otros TextField para cada campo
            ElevatedButton(
              child: Text('Afegir Arbre'),
              onPressed: _afegirArbre,
            ),
          ],
        ),
      ),
    );
  }
}
