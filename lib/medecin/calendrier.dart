import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/medecin/listepatient.dart';

class Calendrier extends StatelessWidget {
  List<Tab> list = [
    Tab(
      child: Text("21/01/2021"),
    ),
    Tab(
      child: Text("21/01/2021"),
    ),
    Tab(
      child: Text("21/01/2021"),
    ),
    Tab(
      child: Text("21/01/2021"),
    ),
    Tab(
      child: Text("21/01/2021"),
    ),
    Tab(
      child: Text("21/01/2021"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mon Calendrier"),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_today_rounded),
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: list,
          ),
        ),
        body: Container(
          child: TabBarView(
            children: [
              Container(
                child: ListeP(),
              ),
              Container(
                child: ListeP(),
              ),
              Container(
                child: ListeP(),
              ),
              Container(
                child: ListeP(),
              ),
              Container(
                child: ListeP(),
              ),
              Container(
                child: ListeP(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
