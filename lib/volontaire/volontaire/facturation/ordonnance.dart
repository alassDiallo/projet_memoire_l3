import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_ajoutOrdonnance.dart';
import 'dart:convert' as convert;

class Ordonnance extends StatefulWidget {
  Ordonnance({Key key}) : super(key: key);

  @override
  _OrdonnanceState createState() => _OrdonnanceState();
}

class _OrdonnanceState extends State<Ordonnance> {
  final _formKey = GlobalKey<FormState>();
  Widget page;
  Patient patientf;
  double _montant;
  Future<void> enregistrerFacture() async {
    // if (_formKey.currentState.validate()) {
    Navigator.pop(context);
    _formKey.currentState.save();
    Map<String, dynamic> patient = {
      "infoPatient": patientf.referencePatient,
      "cout": _montant.toString(),
      "type": "ordonnance"
    };
    String url = "auth/facture";

    var donnee = await Connexion().envoideDonnnee(patient, url);
    print(donnee.body);
    if (donnee.statusCode == 200) {
      print(url);
      var d = convert.jsonDecode(donnee.body);
      if (d['success']) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor: Colors.white.withOpacity(0.8),
                content: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Center(
                        child: Column(children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            child: IconButton(
                              icon: Icon(
                                Icons.close,
                                size: 15,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )),
                      CircleAvatar(
                        child: Icon(
                          Icons.check,
                          size: 25,
                          color: Colors.white,
                        ),
                        radius: 35,
                        backgroundColor: Colors.greenAccent,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Facture enregistrée \n     avec succés",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ])))));
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor: Colors.white.withOpacity(0.8),
                content: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Center(
                        child: Column(children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            child: IconButton(
                              icon: Icon(
                                Icons.close,
                                size: 15,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )),
                      CircleAvatar(
                        child: Icon(
                          Icons.error,
                          size: 25,
                          color: Colors.white,
                        ),
                        radius: 35,
                        backgroundColor: Colors.redAccent,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Erreur d'enregistrement \n    veuillez reéssayer ",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ])))));
      }
    }
    // }
  }

  @override
  Widget build(BuildContext context) {
    patientf = ModalRoute.of(context).settings.arguments;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: size.height,
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/medicament.png"),
                        fit: BoxFit.cover)),
                child: Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Montant Ordonnance",
                        style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      ),
                      Divider(
                        color: Colors.redAccent.withOpacity(.8),
                        thickness: 8,
                        indent: 50,
                        endIndent: 50,
                      ),
                    ],
                  )),
                  color: Colors.white.withOpacity(.3),
                ),
              ),
              Center(
                child: Card(
                  color: Colors.redAccent.withOpacity(.8),
                  // color: coleur.withOpacity(0.4),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(50))),
                  margin: EdgeInsets.all(10),
                  child: Container(
                    margin: EdgeInsets.all(30),
                    child: Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                // maxLength: 12,
                                decoration: InputDecoration(
                                  labelText: ' Montant ',
                                  prefixIcon: Icon(Icons.code_rounded),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "le champs est obligatoire";
                                  } else if (double.parse(value) < 1) {
                                    return "veuillez saisir une valeur positive";
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _montant = double.parse(value);
                                  });
                                },
                                onSaved: (value) {
                                  setState(() {
                                    _montant = double.parse(value);
                                  });
                                },
                              ),
                              SizedBox(height: 20),
                            ])),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 110,
                child: ElevatedButton(
                  onPressed: () {
                    // enregistrerFacture,
                    if (_formKey.currentState.validate()) {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                backgroundColor: Colors.white.withOpacity(0.8),
                                content: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Divider(
                                        endIndent: 30,
                                        indent: 30,
                                        height: 3,
                                        thickness: 5,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                " Montant    : ",
                                                style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "   ${_montant} ",
                                                style: TextStyle(
                                                  // fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              // Divider(
                                              //   thickness: 1,
                                              //   color: Colors.black,
                                              // )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                " % Prise en charge   : ",
                                                style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "  80%  ",
                                                style: TextStyle(
                                                  // fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              // Divider(
                                              //   thickness: 1,
                                              //   color: Colors.black,
                                              // )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                " Total à payer   : ",
                                                style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "   ${_montant * 0.2} ",
                                                style: TextStyle(
                                                  // fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Divider(
                                        endIndent: 30,
                                        indent: 30,
                                        height: 3,
                                        thickness: 5,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 5, 5, 5),
                                              primary: Colors.redAccent,
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: Text('  Annuler  '),
                                          ),
                                          // SizedBox(
                                          //   height: 15,
                                          // ),
                                          ElevatedButton(
                                            onPressed: enregistrerFacture,
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 5, 5, 5),
                                              primary: Colors.greenAccent,
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: Text('  Enregistrer  '),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    primary: Colors.blueAccent,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('  Enregistrer  '),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.library_add_sharp),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AjoutOrdonnance()));
          }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
    );
  }
}
