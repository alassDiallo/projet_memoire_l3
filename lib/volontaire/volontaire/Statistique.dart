import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_chart/chart/view/chart_bar.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/StatistiqueV.dart';
import 'dart:async';
import 'dart:convert' as convert;

class StatistiqueV extends StatefulWidget {
  @override
  _StatistiqueVState createState() => _StatistiqueVState();
}

class _StatistiqueVState extends State<StatistiqueV> {
  double _depense, _ordonnance, _analyse, _consultation;
  List<StatistV> donnee = [
    StatistV(
      nom: "Depenses",
      valeur: 12000,
      couleur: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    StatistV(
      nom: "Ordonnance",
      valeur: 10000,
      couleur: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    StatistV(
      nom: "analyse",
      valeur: 5000,
      couleur: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    StatistV(
      nom: "Consultation",
      valeur: 7000,
      couleur: charts.ColorUtil.fromDartColor(Colors.yellow),
    )
  ];

  Future<void> recupD() async {
    var url = "auth/statV";
    var donnee = await Connexion().recuperation(url);
    print(donnee.body);
    if (donnee.statusCode == 200) {
      var d = convert.jsonDecode(donnee.body);
      setState(() {
        _depense = d['depense'];
        _ordonnance = d['ordonnance'];
        _analyse = d['analyse'];
        _consultation = d['consultation'];
      });
    }
    donnee.add(StatistV(
      nom: "Depenses",
      valeur: 12000,
      couleur: charts.ColorUtil.fromDartColor(Colors.blue),
    ));

    donnee.add(StatistV(
      nom: "Ordonnance",
      valeur: 10000,
      couleur: charts.ColorUtil.fromDartColor(Colors.green),
    ));

    donnee.add(StatistV(
      nom: "analyse",
      valeur: 5000,
      couleur: charts.ColorUtil.fromDartColor(Colors.pink),
    ));

    donnee.add(StatistV(
      nom: "Consultation",
      valeur: 7000,
      couleur: charts.ColorUtil.fromDartColor(Colors.yellow),
    ));
  }

  // List<StatistV>
  //   StatistV(
  //     nom: "ordonnance",
  //     valeur: 120,
  //     couleur: charts.ColorUtil.fromDartColor(Colors.yellow),
  //   ),
  //   StatistV(
  //     nom: "analyse",
  //     valeur: 1200,
  //     couleur: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   StatistV(
  //     nom: "consultation",
  //     valeur: 1000,
  //     couleur: charts.ColorUtil.fromDartColor(Colors.pink),
  //   ),
  // ];
  //
  @override
  void initState() {
    //recupD();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistique"),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height / 2.3,
              padding: EdgeInsets.all(10),
              child: charts.BarChart(
                chart(),
                animate: true,
                animationDuration: Duration(seconds: 5),
              )),
        ],
      ),
    );
  }

  chart() {
    List<charts.Series<StatistV, String>> series = [
      charts.Series(
          id: "depense",
          data: donnee,
          domainFn: (StatistV series, _) => series.nom,
          measureFn: (StatistV series, _) => series.valeur,
          colorFn: (StatistV series, _) => series.couleur)
    ];

    return series;
  }
}
