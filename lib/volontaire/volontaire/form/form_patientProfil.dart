import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
// import 'package:gestion_materiel_cmu/volontaire/volontaire/patient/patient.dart';
import 'dart:convert' as convert;

// import 'package:gestion_materiel_cmu/models/volontaire.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/accueil.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/patient/patient_profil.dart';

class FormPatientProfil extends StatefulWidget {
  Widget page;
  Color couleur;
  FormPatientProfil({this.page, this.couleur});
  @override
  _FormPatientProfilState createState() => _FormPatientProfilState();
}

class _FormPatientProfilState extends State<FormPatientProfil> {
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
            idPatient: patient["idPatient"],
            referencePatient: patient["referencePatient"],
            nom: patient["nom"],
            prenom: patient["prenom"],
            lieuDeNaissance: patient["lieuDeNaissance"],
            adresse: patient["adresse"],
            telephone: patient["telephone"],
            sexe: patient["sexe"],
            // dateDeNaissance: patient["dateDeNaissance"],
            numeroCIN: patient["numeroCIN"],

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
      if (pat.referencePatient == _reference) {
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

//Patient patient=recherche(patients);
  final _formKey = GlobalKey<FormState>();
  String _reference;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Colors.white,
            // color: coleur.withOpacity(0.4),
            elevation: 7,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            margin: EdgeInsets.fromLTRB(0, 1, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Text(
                    "Entrer la référence CMU du patient s'il vous plait",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  thickness: 10,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 5),
          Container(
            margin: EdgeInsets.all(30),
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        showCursor: true,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          hintStyle: TextStyle(
                            color: Colors.white,
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
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width - 90,
                        child: ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              // if (_reference == "12345ref") {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => widget.page,
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
                                      builder: (context) => AlertDialog(
                                            //elevation: 3,
                                            // shape:BorderRadius.circular(10)
                                            backgroundColor:
                                                Colors.white.withOpacity(0.8),
                                            // title: Text(
                                            //     "Il n'y pas de patient pour ce reference"),
                                            content: Container(
                                              height: MediaQuery.of(context)
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
                                                      color: Colors.white,
                                                    ),
                                                    radius: 40,
                                                    backgroundColor: Colors.red,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Il n'y pas de patient pour ce reference",
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    "Voulez-vous réessayer ?",
                                                    textAlign: TextAlign.center,
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
                                                            builder: (context) =>
                                                                Volontaire()));
                                                  },
                                                  child: Text(
                                                    "Quitter",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                              FlatButton(
                                                  color: Colors.blue,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Réessayer'))
                                            ],
                                          ))
                                  :
                                  //recherche(patients)
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfilPatient(
                                                patient: recherche(patients),
                                              )));
                            }
                          },
                          child: Text('Enregistrer'),
                        ),
                      )
                    ])),
          ),
        ],
      ),
    );
  }
}
