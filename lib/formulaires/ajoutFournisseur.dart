import 'package:flutter/material.dart';

class AjoutFournisseur extends StatefulWidget {
  @override
  _AjoutFournisseurState createState() => _AjoutFournisseurState();
}

class _AjoutFournisseurState extends State<AjoutFournisseur> {
  var cle = GlobalKey<FormState>();
  String _information, _adresse, _email, _telephone;

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
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Text(
                        "Ajouter un Fournisseur",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
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
                              "Information fournisseur",
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
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Adresse",
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
                                  hintText: "entrer l'adresse du fournisseur",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "E-mail fournisseur",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                            
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
                                  hintText: "entrer l'email du fournisseur",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "telephone fournisseur",
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
                              keyboardType: TextInputType.number,
                              maxLength: 9,
                              decoration: InputDecoration(
                                  hintText:
                                      "entrer le telephone du fournisseur",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FlatButton(
                              onPressed: _valider,
                              child: Text("enregistrer"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.blue,
                              textColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              minWidth: MediaQuery.of(context).size.width,
                            )
                          ],
                        ))
                  ],
                ))));
  }
}
