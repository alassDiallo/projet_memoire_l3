import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;
import 'package:gestion_materiel_cmu/jika/statMois.dart';

class Statistique extends StatefulWidget {
  @override
  _StatistiqueState createState() => _StatistiqueState();
}

class _StatistiqueState extends State<Statistique> {
  List<chart.Series<Tache, String>> serie;
  List<chart.Series<Structures, String>> strc;
  List<chart.Series<Annee, int>> annees;

  _genererDonnees() {
    var an1 = [
      Annee(annee: 0, interval: 45),
      Annee(annee: 1, interval: 56),
      Annee(annee: 2, interval: 55),
      Annee(annee: 3, interval: 60),
      Annee(annee: 4, interval: 61),
      Annee(annee: 5, interval: 70),
    ];

    var an2 = [
      Annee(annee: 0, interval: 35),
      Annee(annee: 1, interval: 46),
      Annee(annee: 2, interval: 45),
      Annee(annee: 3, interval: 50),
      Annee(annee: 4, interval: 51),
      Annee(annee: 5, interval: 60),
    ];

    var an3 = [
      Annee(annee: 0, interval: 20),
      Annee(annee: 1, interval: 24),
      Annee(annee: 2, interval: 25),
      Annee(annee: 3, interval: 40),
      Annee(annee: 4, interval: 45),
      Annee(annee: 5, interval: 60),
    ];

    var str1 = [
      Structures(
          nomStructures: "Structures de dakar", region: "Dakar", nombre: 20),
      Structures(
          nomStructures: "Structures de thies", region: "thies", nombre: 25),
      Structures(
          nomStructures: "Structures de diourbel",
          region: "Diourbel",
          nombre: 40),
    ];

    var str2 = [
      Structures(
          nomStructures: "Structures de Fatick", region: "Fatick", nombre: 20),
      Structures(
          nomStructures: "Structures de Louga", region: "Louga", nombre: 25),
      Structures(
          nomStructures: "Structures de Kaffrine",
          region: "Kaffrine",
          nombre: 40),
    ];

    var str3 = [
      Structures(
          nomStructures: "Structures de Matam", region: "Matam", nombre: 20),
      Structures(
          nomStructures: "Structures de Kolda", region: "Kolda", nombre: 25),
      Structures(
          nomStructures: "Structures de Sedhiou",
          region: "Sedhiou",
          nombre: 40),
    ];

    strc.add(chart.Series(
      data: str1,
      domainFn: (Structures s, _) => s.nomStructures,
      measureFn: (Structures s, _) => s.nombre,
      id: "2019",
      fillPatternFn: (_, __) => chart.FillPatternType.solid,
      fillColorFn: (Structures s, _) =>
          chart.ColorUtil.fromDartColor(Color(0xff990099)),
    ));

    strc.add(chart.Series(
      data: str2,
      domainFn: (Structures s, _) => s.nomStructures,
      measureFn: (Structures s, _) => s.nombre,
      id: "2020",
      fillPatternFn: (_, __) => chart.FillPatternType.solid,
      fillColorFn: (Structures s, _) =>
          chart.ColorUtil.fromDartColor(Color(0xff109618)),
    ));

    strc.add(chart.Series(
      data: str3,
      domainFn: (Structures s, _) => s.nomStructures,
      measureFn: (Structures s, _) => s.nombre,
      id: "2021",
      fillPatternFn: (_, __) => chart.FillPatternType.solid,
      fillColorFn: (Structures s, _) =>
          chart.ColorUtil.fromDartColor(Color(0xffff9900)),
    ));

    var _d = [
      Tache(couleur: Color(0xff3366cc), nom: "travail", valeur: 38.5),
      Tache(couleur: Color(0xff990099), nom: "repas", valeur: 8.3),
      Tache(couleur: Color(0xff109618), nom: "commune", valeur: 10.8),
      Tache(couleur: Color(0xfffdbe19), nom: "Telé", valeur: 19.2),
      Tache(couleur: Color(0xffff9900), nom: "sommeil", valeur: 38.5),
      Tache(couleur: Color(0xffdc3912), nom: "autre", valeur: 10.3),
    ];

    annees.add(chart.Series(
        data: an1,
        colorFn: (_, __) => chart.ColorUtil.fromDartColor(Color(0xff990099)),
        domainFn: (Annee e, _) => e.annee,
        measureFn: (Annee e, _) => e.interval,
        id: "annee"));

    annees.add(chart.Series(
        data: an2,
        colorFn: (_, __) => chart.ColorUtil.fromDartColor(Color(0xff109618)),
        domainFn: (Annee e, _) => e.annee,
        measureFn: (Annee e, _) => e.interval,
        id: "annee"));

    annees.add(chart.Series(
        data: an3,
        colorFn: (_, __) => chart.ColorUtil.fromDartColor(Color(0xffff9900)),
        domainFn: (Annee e, _) => e.annee,
        measureFn: (Annee e, _) => e.interval,
        id: "annee"));

    serie.add(chart.Series(
      data: _d,
      domainFn: (Tache tache, _) => tache.nom,
      measureFn: (Tache tache, _) => tache.valeur,
      colorFn: (Tache tache, _) => chart.ColorUtil.fromDartColor(tache.couleur),
      id: "Comptabilite",
      labelAccessorFn: (Tache tache, _) => '${tache.valeur}',
    ));
  }

  @override
  void initState() {
    super.initState();
    serie = List<chart.Series<Tache, String>>();
    strc = List<chart.Series<Structures, String>>();
    annees = List<chart.Series<Annee, int>>();
    _genererDonnees();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text("comptablite"),
                ),
                Tab(
                  child: Text("depense"),
                ),
                Tab(
                  child: Text("activite"),
                ),
                Tab(
                  child: Text("activite Mois"),
                ),
              ],
            ),
          ),
          body: Container(
              child: TabBarView(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Statistique de la comptabilité",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: chart.PieChart(
                        serie,
                        animate: true,
                        animationDuration: Duration(seconds: 5),
                        behaviors: [
                          chart.DatumLegend(
                              outsideJustification:
                                  chart.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxColumns: 2,
                              cellPadding: EdgeInsets.only(right: 4, bottom: 4),
                              entryTextStyle: chart.TextStyleSpec(
                                color:
                                    chart.MaterialPalette.purple.shadeDefault,
                                fontFamily: 'Georgia',
                                fontSize: 11,
                              ))
                        ],
                        defaultRenderer: chart.ArcRendererConfig(
                            arcWidth: 100,
                            arcRendererDecorators: [
                              chart.ArcLabelDecorator(
                                  labelPosition: chart.ArcLabelPosition.inside)
                            ]),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Statistique des Structuress",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: chart.BarChart(
                          strc,
                          animate: true,
                          barGroupingType: chart.BarGroupingType.grouped,
                          animationDuration: Duration(seconds: 5),
                        ))
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Statistique des annees",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: chart.LineChart(
                          annees,
                          animate: true,
                          defaultRenderer: chart.LineRendererConfig(
                            includeArea: true,
                            stacked: true,
                          ),
                          animationDuration: Duration(seconds: 5),
                          behaviors: [
                            chart.ChartTitle("Annees",
                                behaviorPosition: chart.BehaviorPosition.bottom,
                                titleOutsideJustification:
                                    chart.OutsideJustification.middleDrawArea),
                            chart.ChartTitle("Annees",
                                behaviorPosition: chart.BehaviorPosition.start,
                                titleOutsideJustification:
                                    chart.OutsideJustification.middleDrawArea),
                            chart.ChartTitle("Annees",
                                behaviorPosition: chart.BehaviorPosition.end,
                                titleOutsideJustification:
                                    chart.OutsideJustification.middleDrawArea),
                          ],
                        ))
                      ],
                    ),
                  ),
                )),
            StatM()
          ]))),
    );
  }
}

class Tache {
  String nom;
  double valeur;
  Color couleur;

  Tache({this.nom, this.valeur, this.couleur});
}

class Structures {
  String nomStructures;
  String region;
  double nombre;

  Structures({this.nomStructures, this.nombre, this.region});
}

class Annee {
  int annee;
  int interval;
  Annee({this.annee, this.interval});
}
