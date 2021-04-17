import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'dart:async';
import 'dart:convert' as convert;

import 'package:gestion_materiel_cmu/models/specialite.dart';

class FormConsultation extends StatefulWidget {
  Patient p;
  FormConsultation({this.p});

  @override
  _FormConsultationState createState() => _FormConsultationState();
}

class _FormConsultationState extends State<FormConsultation> {
  final _formKey = GlobalKey<FormState>();
  List<Specialite> specialite = [];
  String _reference;
  String _specialite;

  Future<void> listConsultation() async {
    String url = "auth/listeC";
    var donnee = await Connexion().recuperation(url);
    print(donnee.body);
    if (donnee.statusCode == 200) {
      var d = convert.jsonDecode(donnee.body);
      for (var sp in d) {
        setState(() {
          specialite.add(
              Specialite(libelle: sp["libelle"], prix: sp["prixConsultation"]));
        });
      }
      print(specialite);
    }
  }
  //   List<Materiel> _Specialites = [];
  // Future<void> getSpecialite() async {
  //   var url = Connexion.url + "prixConsultation";
  //   var donnee = await http.get(url);
  //   if (donnee.statusCode == 200) {
  //     print(donnee.body);
  //     var specialite = convert.jsonDecode(donnee.body);
  //     for (var specia in specialite) {
  //       _Specialites.add(Consulter(
  // date: specia["type"],
  //           idPatient: specia["idPatient"],
  //           idMedecin: specia["idMedecin"]));
  //     }
  //     print(_Specialites.length);
  //   }
  // }

  // List<DropdownMenuItem> listeSp() {
  //   List<DropdownMenuItem> l = [];
  //   for (Consulter materiel in _Specialites) {
  //     l.add(DropdownMenuItem(
  //       child: Text("libelle: ${materiel.libelle}- type:${materiel.type}"),
  //       //  ${materiel.reference}"),
  //       value: materiel.idMateriel,
  //     ));
  //   }
  //   return l;
  // }

  @override
  void initState() {
    print(widget.p.telephone);
    listConsultation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Card(
            //   color: Colors.blueAccent.withOpacity(0.1),
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
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/m.jpg"), fit: BoxFit.cover)),
              child: Container(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Espace Consultation",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Divider(
                      color: Colors.blue[900],
                      thickness: 8,
                      indent: 50,
                      endIndent: 50,
                    ),
                    Divider(
                      color: Colors.blue[900],
                      thickness: 8,
                      indent: 70,
                      endIndent: 50,
                    ),
                    Divider(
                      color: Colors.blue[900],
                      thickness: 8,
                      indent: 90,
                      endIndent: 50,
                    ),
                  ],
                )),
                color: Colors.white.withOpacity(.4),
              ),
            ),
            //       ),
            //     ],
            //   ),
            // ),
            // Divider(
            //   thickness: 5,
            //   indent: 10,
            //   endIndent: 10,
            // ),
            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),

                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: 'Entrer la référence CMU du patient',
                      //     prefixIcon: Icon(Icons.code_rounded),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(15.0),
                      //       borderSide: BorderSide(),
                      //     ),
                      //     hintText: 'Reference',
                      //   ),
                      //   validator: (input) => input.isEmpty
                      //       ? ' Veuillez remplir ce champs'
                      //       : null,
                      //   onSaved: (input) => _reference = input,
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      DropdownButtonFormField<String>(
                        items: specialite
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e.prix.toString(),
                                child: Text(
                                  e.libelle,
                                ),
                              ),
                            )
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return "le champs est obligatoire";
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            _specialite = value;
                          });
                        },
                        value: _specialite,
                        onChanged: (value) {
                          setState(() {
                            _specialite = value;
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: 'Spécialité',
                            // hintText: 'Entrer du texte',
                            border: OutlineInputBorder()),
                        elevation: 2,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        isDense: true,
                        iconSize: 30.0,
                        iconEnabledColor: Colors.black,
                        dropdownColor: Colors.white,
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      //shape:,

                      Card(
                        color: Colors.blue[900],
                        // color: coleur.withOpacity(0.4),
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                        child: Container(
                          margin: EdgeInsets.all(30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Detail Consultation",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Prix Consultation : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    _specialite != null
                                        ? _specialite + " Fcfa"
                                        : "",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Prise en Charge (80%) : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    _specialite != null
                                        ? (int.parse(_specialite) * 0.8)
                                                .toString() +
                                            " Fcfa"
                                        : "",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Charge Patient (20%) : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    _specialite != null
                                        ? (int.parse(_specialite) * 0.2)
                                                .toString() +
                                            " Fcfa"
                                        : "",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              )
                              // TextFormField(
                              //   readOnly: true,
                              //   initialValue: _specialite,
                              //   decoration: InputDecoration(
                              //       prefixIcon:
                              //           Icon(Icons.monetization_on_outlined),
                              //       labelText: 'Prix',
                              //       hintText: _specialite,
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(25.0),
                              //         borderSide: BorderSide(),
                              //       )),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // TextField(
                              //   readOnly: true,
                              //   decoration: InputDecoration(
                              //       prefixIcon:
                              //           Icon(Icons.monetization_on_outlined),
                              //       labelText: 'Total à payer',
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(25.0),
                              //         borderSide: BorderSide(),
                              //       )),
                              // ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                            primary: Colors.blue[900],
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('  valider  '),
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ],
    );
  }

  Future<void> _submit() async {
    if (_formKey.currentState.validate()) {
      // _formKey.currentState.save();

      // Scaffold.of(context)
      //     .showSnackBar(SnackBar(content: Text('Traitement en cours')));
      _formKey.currentState.save();
      Map<String, dynamic> patient = {
        "infoPatient": widget.p.telephone,
        "cout": _specialite,
        "type": "consultation"
      };
      String url = "auth/facture";

      var donnee = await Connexion().envoideDonnnee(patient, url);
      print(donnee.body);
      if (donnee.statusCode == 200) {
        print(url);
        var d = convert.jsonDecode(donnee.body);
        if (d['success']) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("consultation enregistrée avec succées"),
            backgroundColor: Colors.greenAccent,
          ));
          _formKey.currentState.reset();
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("erreur d'enregistrement vueillez reésseyer"),
            backgroundColor: Colors.red,
          ));
        }
      }
    }
  }
}
