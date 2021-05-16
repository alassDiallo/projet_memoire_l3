import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;
import 'dart:io';

class AjoutStructure extends StatefulWidget {
  @override
  _AjoutStructureState createState() => _AjoutStructureState();
}

class _AjoutStructureState extends State<AjoutStructure> {
  String _nom, _adresse, _region, _telephone;

  final cle = GlobalKey<FormState>();

  Future<void> _valider() async {
    if (cle.currentState.validate()) {
      cle.currentState.save();
      var url = "auth/structure";
      print(url);
      // var data = await http.get(url);
      // var donnee = convert.jsonDecode(data.body);
      // print(donnee);
      Map<String, dynamic> donnees = {
        "nomStructure": _nom,
        "region": _region,
        "adresse": _adresse,
        "telephone": _telephone
      };
      print(donnees);

      final reponse = await Connexion().envoideDonnnee(donnees, url);
      print(reponse.statusCode);
      if (reponse.statusCode == 200) {
        var c = convert.jsonDecode(reponse.body);
        print(c);
        cle.currentState.reset();
        if (reponse['success'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(reponse['success']),
            backgroundColor: Colors.greenAccent,
          ));
          // print(c["error"]["telephone"][0]);
        }
        // print(_nom);
        // print(_region);
        // print(_adresse);
        // print(_telephone);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ajouter une structure"),
        ),
        body: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[900],
                ),
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.blue[900],
                                child: Icon(
                                  Icons.home_work,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 15,
                            ),
                            Form(
                                key: cle,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "nom de la Structure",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          // labelText: "nom structure",
                                          // floatingLabelBehavior:
                                          //     FloatingLabelBehavior.always,
                                          hintText:
                                              "entrer le nom de la structure",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "le champs est obligatoire";
                                        }
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          _nom = value;
                                        });
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          _nom = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "region",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DropdownButtonFormField(
                                        validator: (value) {
                                          if (value == null) {
                                            return "veuillez selectionner une region";
                                          }
                                        },
                                        onSaved: (value) {
                                          setState(() {
                                            _region = value;
                                          });
                                        },
                                        value: _region,
                                        onChanged: (value) {
                                          setState(() {
                                            _region = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            hintText: "selectionner le region",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("Dakar"),
                                            value: "Dakar",
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Thies"),
                                            value: "Thies",
                                          ),
                                          DropdownMenuItem(
                                              child: Text("Diourbel"),
                                              value: "Diourbel"),
                                          DropdownMenuItem(
                                              child: Text("Kaolack"),
                                              value: "Kaolack"),
                                          DropdownMenuItem(
                                              child: Text("Fatick"),
                                              value: "Fatick"),
                                          DropdownMenuItem(
                                            child: Text("Kolda"),
                                            value: "Kolda",
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Sedhiou"),
                                            value: "Sedhiou",
                                          ),
                                          DropdownMenuItem(
                                              child: Text("Matam"),
                                              value: "Matam"),
                                          DropdownMenuItem(
                                              child: Text("Saint-Louis"),
                                              value: "Saint-Louis"),
                                          DropdownMenuItem(
                                              child: Text("Kedougou"),
                                              value: "Kedougou"),
                                          DropdownMenuItem(
                                            child: Text("Ziguinchor"),
                                            value: "Zinguichor",
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Kaffrine"),
                                            value: "Kaffrine",
                                          ),
                                          DropdownMenuItem(
                                              child: Text("Tambacounda"),
                                              value: "Tambacounda"),
                                          DropdownMenuItem(
                                              child: Text("Louga"),
                                              value: "Louga"),
                                        ]),
                                    /*TextFormField(
                      decoration: InputDecoration(
                          hintText: "choisir la region",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),*/
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "adresse",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "le champs est obligatoire";
                                        }
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          _adresse = value;
                                        });
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          _adresse = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          hintText: "entrer l'adresse",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "telephone",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "le champs est obligatoire";
                                        } else {
                                          if (value.length > 1) {
                                            if (value.substring(0, 2) != "78" &&
                                                value.substring(0, 2) != "77" &&
                                                value.substring(0, 2) != "76" &&
                                                value.substring(0, 2) != "75" &&
                                                value.substring(0, 2) != "70" &&
                                                value.substring(0, 2) != "33" &&
                                                value.substring(0, 2) != "30") {
                                              return "le numero commence par 77,78,76,75,70,33,30";
                                            }
                                          }
                                          if (value.length < 9) {
                                            return "veullez entrer un numero valide de 9 chiffre";
                                          }
                                        }
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          _telephone = value;
                                        });
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          _telephone = value;
                                        });
                                      },
                                      maxLength: 9,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          hintText:
                                              "entrer le numero de telephone",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      onPressed: _valider,
                                      child: Text("enregistrer"),
                                      color: Colors.blue,
                                      textColor: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
