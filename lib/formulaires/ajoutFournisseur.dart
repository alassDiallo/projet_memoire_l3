import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

class AjoutFournisseur extends StatefulWidget {
  @override
  _AjoutFournisseurState createState() => _AjoutFournisseurState();
}

class _AjoutFournisseurState extends State<AjoutFournisseur> {
  var cle = GlobalKey<FormState>();
  String _information, _adresse, _email, _telephone;

  Future<void> _valider() async {
    if (cle.currentState.validate()) {
      cle.currentState.save();
      Map<String, dynamic> donnees = {
        "nom": _information,
        "adresse": _adresse,
        "email": _email,
        "telephone": _telephone
      };

      var url = "auth/fournisseur";
      print(url);
      var reponse = await Connexion().envoideDonnnee(donnees, url);
      if (reponse.statusCode == 200) {
        var donnee = convert.jsonDecode(reponse.body);
        print(donnee);
        cle.currentState.reset();
        if (donnee['succes'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(donnee['succes']),
            backgroundColor: Colors.greenAccent,
          ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blue[900],
        appBar: AppBar(
          title: Text("Ajouter un fournisseur"),
        ),
        body: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[900],
                ),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                radius: 50,
                                backgroundColor: Colors.blue[900],
                                child: Icon(
                                  Icons.transfer_within_a_station,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Form(
                                key: cle,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Information fournisseur",
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
                                          _information = value;
                                        });
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          _information = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          hintText:
                                              "entrer les informations du fournisseur",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Adresse",
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
                                          hintText:
                                              "entrer l'adresse du fournisseur",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "E-mail fournisseur",
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
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value.isEmpty ||
                                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(value)) {
                                          return 'Entrer une adresse email valide';
                                        }
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          _email = value;
                                        });
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          _email = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          hintText:
                                              "entrer l'email du fournisseur",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "telephone fournisseur",
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
                                            if (value.substring(0, 2) != "77" &&
                                                value.substring(0, 2) != "76" &&
                                                value.substring(0, 2) != "78" &&
                                                value.substring(0, 2) != "70" &&
                                                value.substring(0, 2) != "33" &&
                                                value.substring(0, 2) != "30") {
                                              return "le numero doit commencer par 77,76,78,70,33,30";
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
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly
                                      ],
                                      maxLength: 9,
                                      decoration: InputDecoration(
                                          hintText:
                                              "entrer le telephone du fournisseur",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FlatButton(
                                      onPressed: _valider,
                                      child: Text("enregistrer"),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      color: Colors.blue,
                                      textColor: Colors.white,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
