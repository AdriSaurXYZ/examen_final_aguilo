import 'package:firebase_demo/models/arbre.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'arbre_detall_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Llistat d\'Arbres')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('arbres').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              var data = doc.data() as Map<String, dynamic>; // Cambio aquí
              Arbre arbre = Arbre.fromMap(data, doc.id);

              return ListTile(
                title: Text(arbre.nom),
                subtitle: Text(arbre.varietat),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ArbreDetallScreen(arbre: arbre)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
