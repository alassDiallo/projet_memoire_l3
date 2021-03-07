import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/docteur/infoDocteur.dart';

class Medecins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          children: List.generate(20, (index) {
            return Medecin();
          }),
        )));
  }
}
