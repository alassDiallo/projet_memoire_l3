import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_rapport_maintennance.dart';

class Rapport_Maintenance extends StatefulWidget {
  Rapport_Maintenance({Key key}) : super(key: key);

  @override
  _Rapport_MaintenanceState createState() => _Rapport_MaintenanceState();
}

class _Rapport_MaintenanceState extends State<Rapport_Maintenance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rapport'),
        centerTitle: true,
        // actions: [Text("SELECTIONNER")],
      ),
      body: SingleChildScrollView(child: Rapport_Maintenancev()),
    );
  }
}
