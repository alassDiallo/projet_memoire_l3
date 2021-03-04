import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/models/consultation.dart';
import 'package:gestion_materiel_cmu/patient/ItemConsultation.dart';
import 'package:gestion_materiel_cmu/patient/detailConsultation.dart';

class Consultations extends StatelessWidget {
  Widget con(int index) {
    Consultation c = list[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Liste consultation")),
        body: Container(
            child: GridView.count(
          crossAxisCount: 1,
          crossAxisSpacing: 2,
          children: List.generate(list.length, (index) {
            return ItemConsultation(
                consultation: list[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Detail(consultation: list[index]))));
          }),
        )));
  }
}
