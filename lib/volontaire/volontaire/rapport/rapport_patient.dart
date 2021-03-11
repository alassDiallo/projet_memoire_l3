import 'package:flutter/material.dart';

class Rapport_Patient extends StatefulWidget {
  Rapport_Patient({Key key}) : super(key: key);

  @override
  _Rapport_PatientState createState() => _Rapport_PatientState();
}

class _Rapport_PatientState extends State<Rapport_Patient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activite patient"),
      ),
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text("Patient"),
          ],
        ),
      )),
    );
  }
}
