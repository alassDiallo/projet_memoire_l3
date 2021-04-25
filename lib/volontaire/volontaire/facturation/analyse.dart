import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/controllers/ListeAnalyseP.dart';
import 'package:gestion_materiel_cmu/models/Analyse.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_ajoutAnalyse.dart';
import 'dart:convert' as convert;

class Analyse extends StatefulWidget {
  Analyse({Key key}) : super(key: key);

  @override
  _AnalyseState createState() => _AnalyseState();
}

class _AnalyseState extends State<Analyse> {
  Widget page;
  Patient patientf;
  List<AnalyseM> listeAna = [];

  List<AnalyseM> analyses = [];

  Future<void> getAnalyse() async {
    String url = "auth/analyse";
    var donneejs = await Connexion().recuperation(url);
    print(url);
    print(donneejs.body);
    if (donneejs.statusCode == 200) {
      var donnee = convert.jsonDecode(donneejs.body);
      for (var analyse in donnee) {
        setState(() {
          analyses.add(AnalyseM(
            libelle: analyse["libelle"], prix: analyse["prix"].toDouble(),
            // idPatient: analyse["idPatient"],
          ));
        });
      }
    }
  }

  Future<void> enregistrerFacture() async {
    Navigator.pop(context);
    Map<String, dynamic> patient = {
      "infoPatient": patientf.referencePatient,
      "cout": somme().toString(),
      "type": "analyse"
    };
    String url = "auth/facture";

    var donnee = await Connexion().envoideDonnnee(patient, url);
    print(donnee.body);
    if (donnee.statusCode == 200) {
      print(url);
      var d = convert.jsonDecode(donnee.body);
      if (d['success']) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor: Colors.white.withOpacity(0.8),
                content: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Center(
                        child: Column(children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            child: IconButton(
                              icon: Icon(
                                Icons.close,
                                size: 15,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )),
                      CircleAvatar(
                        child: Icon(
                          Icons.check,
                          size: 25,
                          color: Colors.white,
                        ),
                        radius: 35,
                        backgroundColor: Colors.greenAccent,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Facture enregistrée \n     avec succés",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ])))));
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor: Colors.white.withOpacity(0.8),
                content: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Center(
                        child: Column(children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            child: IconButton(
                              icon: Icon(
                                Icons.close,
                                size: 15,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )),
                      CircleAvatar(
                        child: Icon(
                          Icons.error,
                          size: 25,
                          color: Colors.white,
                        ),
                        radius: 35,
                        backgroundColor: Colors.redAccent,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Erreur d'enregistrement \n    veuillez reéssayer ",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ])))));
      }
    }
  }

  @override
  void initState() {
    getAnalyse();
    super.initState();
    // listeAnalys = ana.analyses;
  }

  double somme() {
    double total = 0;
    for (var analyse in listeAna) {
      total = total + analyse.prix;
    }
    return total;
  }

  double montantP() {
    double montantP = 0;
    double montant = somme() * 0.8;

    return montantP = somme() - montant;
  }

  void selctionner(bool b, AnalyseM element) async {
    if (b) {
      setState(() {
        b = true;
        listeAna.add(element);
      });
    } else {
      listeAna.remove(element);
    }
  }

  @override
  Widget build(BuildContext context) {
    patientf = ModalRoute.of(context).settings.arguments;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Analyse'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
              ),
              analyses.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Card(
                      // color: Colors.transparent,
                      elevation: 7,
                      shadowColor: Colors.blue,
                      margin: EdgeInsets.all(15),
                      child: DataTable(
                        // dividerThickness: true,
                        showBottomBorder: true,
                        columns: [
                          DataColumn(
                            label: Text("Description"),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text("Cout"),
                            numeric: true,
                          ),
                        ],
                        rows: analyses
                            .map(
                              (analyse) => DataRow(
                                  selected: listeAna.contains(analyse),
                                  onSelectChanged: (b) {
                                    selctionner(b, analyse);
                                  },
                                  cells: [
                                    DataCell(
                                      Text(analyse.libelle),
                                      onTap: () {
                                        // write your code..
                                      },
                                      // showEditIcon: true,
                                    ),
                                    DataCell(
                                      Text(analyse.prix.toString()),
                                      onTap: () {
                                        // write your code..
                                      },
                                      // showEditIcon: true,
                                    ),
                                  ]),
                            )
                            .toList(),
                      ),
                    ),
              // Divider(),
              SizedBox(
                height: 30,
              ),

              Container(
                width: MediaQuery.of(context).size.width - 80,
                child: ElevatedButton(
                  onPressed: () {
                    listeAna.isEmpty
                        ? showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => AlertDialog(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35)),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.8),
                                  // title: Text(
                                  //     "Il n'y pas de patient pour ce reference"),
                                  content: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: CircleAvatar(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 18,
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            )),
                                        CircleAvatar(
                                          child: Icon(
                                            Icons.error,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                          radius: 40,
                                          backgroundColor: Colors.red,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Selectionner d'abord ",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          " une ou des analyse(s)",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                        : showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => AlertDialog(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35)),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.8),
                                  content: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13)),
                                          elevation: 3,
                                          shadowColor: Colors.blue,
                                          margin: EdgeInsets.all(7),
                                          child: DataTable(
                                            showBottomBorder: true,
                                            columns: [
                                              DataColumn(
                                                label: Text("Description"),
                                                numeric: false,
                                              ),
                                              DataColumn(
                                                label: Text("Cout"),
                                                numeric: true,
                                              ),
                                            ],
                                            rows: listeAna
                                                .map(
                                                  (analyse) => DataRow(cells: [
                                                    DataCell(
                                                      Text(analyse.libelle),
                                                      onTap: () {
                                                        // write your code..
                                                      },
                                                      // showEditIcon: true,
                                                    ),
                                                    DataCell(
                                                      Text(analyse.prix
                                                          .toString()),
                                                      onTap: () {
                                                        // write your code..
                                                      },
                                                      // showEditIcon: true,
                                                    ),
                                                  ]),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 13,
                                        ),
                                        Divider(
                                          endIndent: 30,
                                          indent: 30,
                                          height: 3,
                                          thickness: 5,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  " Monta,t    : ",
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "   ${somme()} ",
                                                  style: TextStyle(
                                                    // fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                // Divider(
                                                //   thickness: 1,
                                                //   color: Colors.black,
                                                // )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  " % Prise en charge   : ",
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "  80%  ",
                                                  style: TextStyle(
                                                    // fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                // Divider(
                                                //   thickness: 1,
                                                //   color: Colors.black,
                                                // )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  " Total à payer   : ",
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "   ${montantP()} ",
                                                  style: TextStyle(
                                                    // fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                // Divider(
                                                //   thickness: 1,
                                                //   color: Colors.black,
                                                // )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Divider(
                                          endIndent: 30,
                                          indent: 30,
                                          height: 3,
                                          thickness: 5,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 5, 5, 5),
                                                primary: Colors.redAccent,
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: Text('  Annuler  '),
                                            ),
                                            // SizedBox(
                                            //   height: 15,
                                            // ),
                                            ElevatedButton(
                                              onPressed: enregistrerFacture,
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 5, 5, 5),
                                                primary: Colors.greenAccent,
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: Text('  Enregistrer  '),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    primary: Colors.blueAccent,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('  Valider  '),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.library_add_sharp),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AjoutAnalyse(
                          patient: patientf,
                        )));
          }),
    );
  }
}
