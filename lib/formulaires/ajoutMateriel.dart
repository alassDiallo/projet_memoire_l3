import 'package:flutter/material.dart';

class AjoutMateriel extends StatefulWidget {
  @override
  _AjoutMaterielState createState() => _AjoutMaterielState();
}

class _AjoutMaterielState extends State<AjoutMateriel> {
  var cle = GlobalKey<FormState>();
  String _libelle, _type, _fournisseur;
  double _prix;
  int _quantite;
  void _valider() {
    if (cle.currentState.validate()) {
      cle.currentState.save();
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
                child: Text(
                  "Ajouter Un materiel",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
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
                        "Libelle",
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
                            _libelle = value;
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            _libelle = value;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "entrer le libellé du materiel",
                            //contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Type",
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
                            _type = value;
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            _type = value;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "entrer le type de materiel",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Prix",
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
                          } else if (double.parse(value) < 1) {
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
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "entrer le prix",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Quantite",
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
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Fournisseur",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
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
                            hintText: "selectionner un fournisseur",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        items: [
                          DropdownMenuItem(
                            child: Text("assane diallo"),
                            value: "assane diallo",
                          ),
                          DropdownMenuItem(
                            child: Text("Bassirou Dabo"),
                            value: "Bassirou Dabo",
                          ),
                          DropdownMenuItem(
                            child: Text("Makhan traore"),
                            value: "Makhan traore",
                          ),
                          DropdownMenuItem(
                            child: Text("Yakhouba Cisse"),
                            value: "Yakhouba Cisse",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: _valider,
                        child: Text("enregistrer"),
                        color: Colors.blue,
                        textColor: Colors.white,
                      )
                    ],
                  ))
            ],
          ),
        )));
  }
}
