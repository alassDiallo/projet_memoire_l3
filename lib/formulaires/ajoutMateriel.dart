import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/Fournisseur.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

class AjoutMateriel extends StatefulWidget {
  @override
  _AjoutMaterielState createState() => _AjoutMaterielState();
}

class _AjoutMaterielState extends State<AjoutMateriel> {
  var cle = GlobalKey<FormState>();
  List<Fournisseur> fournisseurs = [];
  String _libelle, _type;
  double _prix;
  int _quantite, _fournisseur;
  Future<void> _valider() async {
    if (cle.currentState.validate()) {
      cle.currentState.save();
      Map<String, dynamic> donnees = {
        "libelle": _libelle,
        "type": _type,
        "prix": _prix.toString(),
        "quantite": _quantite.toString(),
        "idFournisseur": _fournisseur.toString()
      };
      var url = "auth/materiel";
      print(url);
      var response = await Connexion().envoideDonnnee(donnees, url);
      if (response.statusCode == 200) {
        print(response.body);
        cle.currentState.reset();
        if (response['success'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(response['success']),
            backgroundColor: Colors.greenAccent,
          ));
        }
      }
    }
  }

  List<DropdownMenuItem> listF() {
    List<DropdownMenuItem> l = [];
    for (Fournisseur f in fournisseurs) {
      l.add(DropdownMenuItem(
        child: Text('${f.nom}-${f.telephone}'),
        value: f.idFournisseur,
      ));
    }
    return l;
  }

  Future<void> getFournisseur() async {
    var url = "auth/fournisseur";
    var donnee = await Connexion().recuperation(url);
    if (donnee.statusCode == 200) {
      print(donnee.body);
      var f = convert.jsonDecode(donnee.body);
      for (var fn in f) {
        setState(() {
          fournisseurs.add(Fournisseur(
              adresse: fn["adresse"],
              nom: fn["nom"],
              telephone: fn["telephone"],
              idFournisseur: fn["idFournisseur"]));
        });
      }
      print(fournisseurs.length);
    }
  }

  @override
  void initState() {
    getFournisseur();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ajouter un materiel"),
        ),
        body: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[900],
                ),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.blue[900],
                                  child: Icon(
                                    Icons.settings,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Libelle",
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
                                          }
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            _libelle = value;
                                          });
                                        },
                                        onSaved: (value) {
                                          setState(() {
                                            _libelle = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            hintText:
                                                "entrer le libellé du materiel",
                                            //contentPadding: EdgeInsets.all(15),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Type",
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
                                            _type = value;
                                          });
                                        },
                                        onSaved: (value) {
                                          setState(() {
                                            _type = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            hintText:
                                                "entrer le type de materiel",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Prix",
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
                                        // inputFormatters: [
                                        //   WhitelistingTextInputFormatter.digitsOnly
                                        // ],
                                        maxLength: 12,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "le champs est obligatoire";
                                          } else {
                                            var n = num.tryParse(value);
                                            if (n == null) {
                                              return "veuillez entrez un nombre valide";
                                            }
                                            if (double.parse(value) < 1)
                                              return "veuillez saisir une valeur positive";
                                          }
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            _prix = double.parse(value);
                                          });
                                        },
                                        onSaved: (value) {
                                          setState(() {
                                            _prix = double.parse(value);
                                          });
                                        },
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                decimal: true),
                                        decoration: InputDecoration(
                                            hintText:
                                                "entrer le prix du materiel( franc cfa)",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Quantite",
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
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter
                                              .digitsOnly
                                        ],
                                        maxLength: 4,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "le champs est obligatoire";
                                          } else if (int.parse(value) < 1) {
                                            return "la quantité doit etre une valeur positive";
                                          }
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            _quantite = int.parse(value);
                                          });
                                        },
                                        onSaved: (value) {
                                          setState(() {
                                            _quantite = int.parse(value);
                                          });
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            hintText: "entrer la quantite",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Fournisseur",
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
                                              return "le champs est obligatoire";
                                            }
                                          },
                                          onSaved: (value) {
                                            setState(() {
                                              _fournisseur = value;
                                            });
                                          },
                                          value: _fournisseur,
                                          onChanged: (value) {
                                            setState(() {
                                              _fournisseur = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                              hintText:
                                                  "selectionner un fournisseur",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          items: fournisseurs.isNotEmpty
                                              ? listF()
                                              : null
                                          // [
                                          //   DropdownMenuItem(
                                          //     child: Text("assane diallo"),
                                          //     value: "assane diallo",
                                          //   ),
                                          //   DropdownMenuItem(
                                          //     child: Text("Bassirou Dabo"),
                                          //     value: "Bassirou Dabo",
                                          //   ),
                                          //   DropdownMenuItem(
                                          //     child: Text("Makhan traore"),
                                          //     value: "Makhan traore",
                                          //   ),
                                          //   DropdownMenuItem(
                                          //     child: Text("Yakhouba Cisse"),
                                          //     value: "Yakhouba Cisse",
                                          //   ),
                                          // ],
                                          ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      FlatButton(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        minWidth:
                                            MediaQuery.of(context).size.width,
                                        onPressed: _valider,
                                        child: Text("enregistrer"),
                                        color: Colors.blue,
                                        textColor: Colors.white,
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ))
                  ],
                ))));
  }
}
