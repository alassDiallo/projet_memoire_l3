import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
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
      var url = Connexion.url + "structure";
      print(url);
      // var data = await http.get(url);
      // var donnee = convert.jsonDecode(data.body);
      // print(donnee);
      Map<String, dynamic> donnees = {
        "nom": _nom,
        "region": _region,
        "adresse": _adresse,
        "telephone": _telephone
      };
      print(donnees);

      final reponse = await http.post(Uri.encodeFull(url), body: donnees);
      print(reponse.statusCode);
      if (reponse.statusCode == 200) {
        var c = convert.jsonDecode(reponse.body);
        cle.currentState.reset();
        // print(c["error"]["telephone"][0]);
      }
      // print(_nom);
      // print(_region);
      // print(_adresse);
      // print(_telephone);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Ajouter une Structure",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Form(
                    key: cle,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "nom de la Structure",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                              // labelText: "nom structure",
                              // floatingLabelBehavior:
                              //     FloatingLabelBehavior.always,
                              hintText: "entrer le nom de la structure",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
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
                              fontWeight: FontWeight.bold, fontSize: 16),
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
                                    borderRadius: BorderRadius.circular(20))),
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
                                  child: Text("Diourbel"), value: "Diourbel"),
                              DropdownMenuItem(
                                  child: Text("Kaolack"), value: "Kaolack"),
                              DropdownMenuItem(
                                  child: Text("Fatick"), value: "Fatick"),
                              DropdownMenuItem(
                                child: Text("Kolda"),
                                value: "Kolda",
                              ),
                              DropdownMenuItem(
                                child: Text("Sedhiou"),
                                value: "Sedhiou",
                              ),
                              DropdownMenuItem(
                                  child: Text("Matam"), value: "Matam"),
                              DropdownMenuItem(
                                  child: Text("Saint-Louis"),
                                  value: "Saint-Louis"),
                              DropdownMenuItem(
                                  child: Text("Kedougou"), value: "Kedougou"),
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
                                  child: Text("Louga"), value: "Louga"),
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
                              fontWeight: FontWeight.bold, fontSize: 16),
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
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "telephone",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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
                            } else if (value.length < 9) {
                              return "veullez entrer un numero valide de 9 chiffre";
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
                          decoration: InputDecoration(
                              hintText: "entrer le numero de telephone",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: _valider,
                          child: Text("enregistrer"),
                          color: Colors.blue,
                          textColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          minWidth: MediaQuery.of(context).size.width,
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
