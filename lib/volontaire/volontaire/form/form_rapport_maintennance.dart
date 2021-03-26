import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/models/materiel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

import 'package:gestion_materiel_cmu/controllers/Connexion.dart';

//TODO: Validation Complete

class Rapport_Maintenancev extends StatefulWidget {
  Rapport_Maintenancev({Key key}) : super(key: key);

  @override
  _Rapport_MaintenancevState createState() => _Rapport_MaintenancevState();
}

class _Rapport_MaintenancevState extends State<Rapport_Maintenancev> {
  final _formKey = GlobalKey<FormState>();
  String _description, _materiel;

  List<Materiel> _materiels = [];
  Future<void> getMateriels() async {
    var url = Connexion.url + "materielsVolontaire/3";
    var donnee = await http.get(url);
    if (donnee.statusCode == 200) {
      print(donnee.body);
      var materielV = convert.jsonDecode(donnee.body);
      for (var matV in materielV) {
        _materiels.add(Materiel(
            libelle: matV["libelle"],
            type: matV["type"],
            reference: matV["reference"],
            idMateriel: matV["idMateriel"]));
      }
      print(_materiels.length);
    }
  }

  List<DropdownMenuItem> listeM() {
    List<DropdownMenuItem> l = [];
    for (Materiel materiel in _materiels) {
      l.add(DropdownMenuItem(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("¤- ${materiel.libelle}"),
            SizedBox(
              height: 5,
            ),
            // Text(" Type: ${materiel.type}"),
          ],
        ),

        //  ${materiel.reference}"),
        value: materiel.idMateriel,
      ));
    }
    return l;
  }

  @override
  void initState() {
    getMateriels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.blueAccent.withOpacity(0.1),
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
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Text(
                  "Maintenance materiel",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   margin: EdgeInsets.all(15),
                //   child: TextFormField(
                //     maxLength: 25,
                //     decoration: InputDecoration(
                //         labelText: 'Type de materiel',
                //         hintText: 'Entrer du texte',
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(15.0),
                //           borderSide: BorderSide(),
                //         )),
                //     validator: (value) {
                //       if (value.isEmpty) {
                //         return "le champs est obligatoire";
                //       }
                //     },
                //     onChanged: (value) {
                //       setState(() {
                //         _materiel = value;
                //       });
                //     },
                //     onSaved: (value) {
                //       setState(() {
                //         _materiel = value;
                //       });
                //     },
                //   ),
                // ),

                Container(
                  margin: EdgeInsets.all(15),
                  child: DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return "le champs est obligatoire";
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          _materiel = value;
                        });
                      },
                      value: _materiel,
                      onChanged: (value) {
                        setState(() {
                          _materiel = value;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Selectionner le materiel concerné",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      items: _materiels.isNotEmpty ? listeM() : null),
                ),

                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    maxLength: 400,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: 'Description du probleme',
                      hintText: 'Entrer du texte',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "le champs est obligatoire";
                      } else {
                        if (value.length < 10) {
                          return "Ce champs doit comporter au moins 10 caractere";
                        }
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: ElevatedButton(
                        onPressed: _submit,
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
                        child: Text('  Envoyer  '),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Traitement en cours')));
    }
  }
}
