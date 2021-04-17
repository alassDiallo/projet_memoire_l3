import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/accueil.dart';
import 'dart:convert' as convert;

class FormPatient1 extends StatefulWidget {
  Widget page;
  Color couleur;
  FormPatient1({this.page, this.couleur});
  @override
  _FormPatient1State createState() => _FormPatient1State();
}

class _FormPatient1State extends State<FormPatient1> {
  List<Patient> patients = [];

  Future<List<Patient>> getPatient() async {
    String url = "auth/patient";
    var donneejs = await Connexion().recuperation(url);
    print(url);
    print(donneejs.body);
    if (donneejs.statusCode == 200) {
      var donnee = convert.jsonDecode(donneejs.body);
      for (var patient in donnee) {
        setState(() {
          patients.add(Patient(
            dateDeNaissance: patient["dataDeNaissance"],
            telephone: patient["telephone"],
            email: patient["email"],
            numeroCIN: patient["numeroCIN"],
            sexe: patient["sexe"],
            adresse: patient["adresse"],
            lieuDeNaissance: patient["lieuDeNaissance"],
            idPatient: patient["idPatient"],
            referencePatient: patient["referencePatient"],
            nom: patient["nom"],
            prenom: patient["prenom"],
            // lieuDeNaissance: patient["lieuDeNaissance"],
            // adresse: patient["adresse"],
            // telephone: patient["telephone"],
            // sexe: patient["sexe"],
            // dateDeNaissance: patient["dateDeNaissance"],
            // numeroCIN: patient["numeroCIN"],

            //  email: patient["email"],
            // etat: patient["etat"],
            // heure: patient["heure"].toDateTime(),
            // date: patient["date"].toDateTime(),
          ));
        });
      }
      return patients;
    }
  }

  Patient recherche(List<Patient> patients) {
    Patient patientR = null;
    for (var pat in patients) {
      if (pat.referencePatient == _reference ||
          pat.numeroCIN == _reference ||
          pat.telephone == _reference ||
          pat.email == _reference) {
        patientR = pat;
      }
    }
    return patientR;
  }

  @override
  void initState() {
    getPatient();
    //filter();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String _reference;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //  width: double.infinity,
            // height: size.height,
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //   image: AssetImage("images/i3.jpg"),
            //   fit: BoxFit.contain,
            // )),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Column(
                  children: [
                    Text(
                      "SENJICA",
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Espace",
                                style: TextStyle(
                                    //color: Colors.blue[900],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Consultation",
                                style: TextStyle(
                                    //color: Colors.blue[900],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Icon(
                            Icons.local_hospital_sharp,
                            color: Colors.green,
                            size: 60,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
                // Card(
                //   color: Colors.blueAccent,
                //   // color: coleur.withOpacity(0.4),
                //   elevation: 7,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.only(
                //           bottomLeft: Radius.circular(40),
                //           bottomRight: Radius.circular(40))),
                //   margin: EdgeInsets.fromLTRB(0, 1, 0, 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       SizedBox(
                //         height: 30,
                //       ),
                //       Container(
                //         padding: EdgeInsets.symmetric(
                //           vertical: 20,
                //         ),
                //         child: Text(
                //           "Entrer la référence CMU du patient",
                //           style: TextStyle(
                //               fontSize: 18, fontWeight: FontWeight.w500),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.symmetric(
                //     vertical: 20,
                //   ),
                //   child: Text(
                //     "Entrer la référence CMU du patient",
                //     style:
                //         TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                //   ),
                // ),
                Divider(
                  thickness: 5,
                  indent: 10,
                  endIndent: 10,
                ),
                SizedBox(height: 50),
                Center(
                  child: Card(
                    color: widget.couleur,
                    // color: coleur.withOpacity(0.4),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(40))),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                    child: Container(
                      margin: EdgeInsets.all(30),
                      child: Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TextFormField(
                                  maxLength: 12,
                                  decoration: InputDecoration(
                                    labelText: 'Référence CMU ',
                                    prefixIcon: Icon(Icons.code_rounded),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(),
                                    ),
                                    hintText: 'Reference',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "le champs est obligatoire";
                                    }
                                    if (value.length < 9) {
                                      return "le champs doit avoir 9 caractere";
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _reference = value;
                                    });
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      _reference = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 110,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        // Scaffold.of(context).showSnackBar(SnackBar(
                                        //     content: Text('Traitement en cours')));
                                        _formKey.currentState.save();
                                        // if (_reference == "12345ref") {
                                        //   Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             widget.page,
                                        //       ));
                                        // }

                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(SnackBar(
                                        //   content: Text("Traitement en cours"),
                                        //   backgroundColor: Colors.green,
                                        // ));
                                        recherche(patients) == null
                                            ? showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      elevation: 3,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          35)),
                                                      backgroundColor: Colors
                                                          .white
                                                          .withOpacity(0.8),
                                                      // title: Text(
                                                      //     "Il n'y pas de patient pour ce reference"),
                                                      content: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.2,
                                                        child: Column(
                                                          children: [
                                                            // Align(
                                                            //   alignment:
                                                            //       Alignment.topRight,
                                                            //   child: IconButton(
                                                            //     icon: Icon(
                                                            //       Icons.close,
                                                            //       size: 40,
                                                            //     ),
                                                            //     onPressed: () {
                                                            //       Navigator.pop(context);
                                                            //     },
                                                            //   ),
                                                            // ),
                                                            CircleAvatar(
                                                              child: Icon(
                                                                Icons.error,
                                                                size: 30,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              radius: 40,
                                                              backgroundColor:
                                                                  Colors.red,
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "Il n'y pas de patient pour ce reference",
                                                              style: TextStyle(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              "Voulez-vous réessayer ?",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: [
                                                        FlatButton(
                                                            color: Colors.red,
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              Volontaire()));
                                                            },
                                                            child: Text(
                                                              "Quitter",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            )),
                                                        FlatButton(
                                                            color: Colors.blue,
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                                'Réessayer'))
                                                      ],
                                                    ))
                                            :
                                            //recherche(patients)
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => ProfilPatient(
                                            //               patient: recherche(patients),
                                            //             )));
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        widget.page,
                                                    settings: RouteSettings(
                                                      arguments:
                                                          recherche(patients),
                                                    )));
                                      }
                                    },
                                    child: Text('Enregistrer'),
                                  ),
                                )
                              ])),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
