import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/facturation/analyse.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/facturation/ordonnance.dart';

class Analyse_Ordonnance extends StatefulWidget {
  @override
  _Analyse_OrdonnanceState createState() => _Analyse_OrdonnanceState();
}

class _Analyse_OrdonnanceState extends State<Analyse_Ordonnance> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(' Facturation '),
            centerTitle: true,
            bottom: TabBar(
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.post_add), text: "Analyse"),
                Tab(icon: Icon(Icons.local_hospital_sharp), text: "Ordonnance"),
              ],
              indicatorColor: Colors.redAccent,
              indicatorWeight: 7,
              labelColor: Colors.redAccent,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Analyse(),
              Ordonnance(),
            ],
          ),
        ));
  }
}
