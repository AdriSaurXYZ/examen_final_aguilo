import 'package:firebase_demo/models/arbre.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArbreDetallScreen extends StatelessWidget {
  final Arbre arbre;

  ArbreDetallScreen({required this.arbre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arbre.nom),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              if (arbre.id != null) {
                FirebaseFirestore.instance
                    .collection('arbres')
                    .doc(arbre.id)
                    .delete()
                    .then((_) {
                  Navigator.pop(context);
                }).catchError((error) {
                  // Mostrar un error
                });
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nom: ${arbre.nom}'),
            Text('Varietat: ${arbre.varietat}'),
            Text('Tipus: ${arbre.tipus}'),
            SwitchListTile(
              title: Text('Autòcton'),
              value: arbre.autocton,
              onChanged: (bool value) {},
            ),
            Image.network(arbre.foto),
            InkWell(
              child: Text('Detall: ${arbre.detall}', style: TextStyle(color: Colors.blue)),
              onTap: () => launch(arbre.detall),
            ),
          ],
        ),
      ),
    );
  }
}
