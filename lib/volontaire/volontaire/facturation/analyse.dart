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
  // double total;
//  List<AnalyseM> listeAnalys = [];
  List<AnalyseM> listeAna = [];
//  AnalyselistP ana = AnalyselistP();

  List<AnalyseM> analyses = [];

  Future<void> getAnalyse() async {
    String url = "auth/analysesPatient";
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
    // for (var depense in listeAnalys) {
    //   total += depense.prix;
    // }
    // return total;
    //
    //
    Patient patient = ModalRoute.of(context).settings.arguments;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Analyse'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          // //height: size.height,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("images/accueil.jpg"),
          //     fit: BoxFit.,
          //   ),
          // ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 35,
                child: Icon(Icons.toll_rounded),
              ),
              SizedBox(
                height: 20,
              ),
              Text(" Analyses ".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontStyle: FontStyle.italic)),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   width: double.infinity,

              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("images/accueil.jpg"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
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
              // Container(
              //   margin: EdgeInsets.all(15),
              //   child: TextField(
              //     readOnly: true,
              //     decoration: InputDecoration(
              //         prefixIcon: Icon(Icons.monetization_on_outlined),
              //         labelText: 'Total à payer',
              //         hintText: total.toString(),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(15.0),
              //           borderSide: BorderSide(),
              //         )),
              //   ),
              // ),

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
                                  // title: Text(
                                  //     "Il n'y pas de patient pour ce reference"),
                                  content: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13)),
                                          elevation: 5,
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
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  " Total    : ",
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
                                                  " Montant à payer   : ",
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
                                        // Text(
                                        //   "Taux de Prise en charge   : ",
                                        //   style: TextStyle(
                                        //     fontStyle: FontStyle.italic,
                                        //     fontWeight: FontWeight.bold,
                                        //     fontSize: 17,
                                        //   ),
                                        // ),
                                        // Text(
                                        //   "Montant à payer   : ",
                                        //   style: TextStyle(
                                        //     fontStyle: FontStyle.italic,
                                        //     fontWeight: FontWeight.bold,
                                        //     fontSize: 17,
                                        //   ),
                                        // ),
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
                          patient: patient,
                        )));
          }),
    );
  }
}
