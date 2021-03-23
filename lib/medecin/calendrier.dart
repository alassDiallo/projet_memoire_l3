import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/medecin/listepatient.dart';

class Calendrier extends StatefulWidget {
  @override
  _CalendrierState createState() => _CalendrierState();
}

class _CalendrierState extends State<Calendrier> {
  List d = [
    "21/12/2020",
    "23/12/2020",
    "25/12/2020",
    "28/12/2020",
    "29/12/2020",
    "4/02/2021",
  ];

  List<Widget> enfant() {
    List<Widget> l = [];
    d.forEach((element) {
      l.add(Container(
        child: ListeP(),
      ));
    });

    return l;
  }

  List<Tab> list = [];

  void i() {
    d.forEach((element) {
      setState(() {
        list.add(Tab(
          child: Text(element),
        ));
      });
    });
  }

  @override
  void initState() {
    i();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: list.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
          child: TabBarView(children: enfant()
              // [
              //   Container(
              //     child: ListeP(),
              //   ),
              //   Container(
              //     child: ListeP(),
              //   ),
              //   Container(
              //     child: ListeP(),
              //   ),
              //   Container(
              //     child: ListeP(),
              //   ),
              //   Container(
              //     child: ListeP(),
              //   ),
              //   Container(
              //     child: ListeP(),
              //   ),
              // ],
              ),
        ),
      ),
    );
  }
}
