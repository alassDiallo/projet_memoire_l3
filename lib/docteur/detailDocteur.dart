import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/medecin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

import 'package:url_launcher/url_launcher.dart';

class DetailDocteur extends StatefulWidget {
  Medecin medecin;
  DetailDocteur({this.medecin});

  @override
  _DetailDocteurState createState() => _DetailDocteurState();
}

class _DetailDocteurState extends State<DetailDocteur> {
  DateTime heure, date;
  DateFormat df = DateFormat("dd/MM/yyyy");
  var cle = GlobalKey<FormState>();
  void _enregistrer() async {
    if (cle.currentState.validate()) {
      cle.currentState.save();
      // print("heure ${heure.hour}:${heure.minute}");
      // print("heure ${date.toString()}");
      print(df.format(date));

      Map<String, dynamic> rv = {
        "idMedecin": widget.medecin.idMedecin.toString(),
        "date": date.toString(),
        "heure": (heure.hour > 9 ? '${heure.hour}h' : "0${heure.hour}h") +
            (heure.minute > 9 ? heure.minute.toString() : "0${heure.minute}")
      };

      var url = "auth/rendezvous";
      var donnee = await Connexion().envoideDonnnee(rv, url);
      // print(url);
      // print(rv);
      // var donnee = await http.post(Uri.encodeFull(url), body: rv);
      print(donnee.body);
      if (donnee.statusCode == 200) {
        print(donnee.body);
        Navigator.pop(context);
        reussite();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.medecin.telephone);
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/doctor-5883502_640.png'),
            alignment: Alignment.topLeft,
            fit: BoxFit.fitWidth),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 30),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Image.asset("images/vol.png"),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Dr. " +
                                widget.medecin.prenom +
                                " " +
                                widget.medecin.nom,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        SizedBox(height: 10),
                        Text(widget.medecin.libelleSpecialite),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.local_hospital,
                              color: Colors.green,
                            ),
                            Text(widget.medecin.structure),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                            Text(widget.medecin.region),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(10)),
                              //padding: EdgeInsets.all(10),
                              child: IconButton(
                                icon: Icon(
                                  Icons.call,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  launch("tel://" + widget.medecin.telephone);
                                },
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.yellow[50],
                                    borderRadius: BorderRadius.circular(10)),
                                // padding: EdgeInsets.all(10),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.chat,
                                    color: Colors.yellow,
                                  ),
                                  onPressed: () {},
                                )),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.red[50],
                                  borderRadius: BorderRadius.circular(10)),
                              // padding: EdgeInsets.all(5),
                              child: IconButton(
                                icon: Icon(
                                  Icons.videocam_off,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("A propos du Medecin",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Notre choix est porté sur le modèle vu contrôleur (MVC) qui présente beaucoup d’avantages.Ce modèle permet de classer les différentes parties de l’application. Le modèle représente la partie logique de l’application c’est à dire les interactions avec la base de données, les traitements des opérations correspondants",
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  onPressed: showR,
                  child: Text("Demender un rendez-vous"),
                  color: Colors.blue,
                  textColor: Colors.white,
                )),
          ),
        ],
      ),
    )));
  }

  Future showR() async {
    var format = DateFormat("yyyy-MM-dd");
    var f = DateFormat("HH:mm");
    return showDialog(
        barrierLabel: "Rendez-vous",
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Column(
              children: [
                Row(
                  children: [
                    Text("demande de rendez-vous"),
                  ],
                ),
                Divider()
              ],
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: cle,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("choisir la date"),
                    SizedBox(
                      height: 10,
                    ),
                    DateTimeField(
                      onChanged: (value) {
                        setState(() {
                          date = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          date = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "selectionner une date";
                        }
                      },
                      format: format,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 18),
                          hintStyle: TextStyle(fontSize: 12),
                          labelText: "choisir la date",
                          // labelStyle: TextStyle(
                          //     fontSize: 20, fontWeight: FontWeight.bold),
                          //floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "choisir la date",
                          suffixIcon: Icon(Icons.date_range),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            initialDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 10)));
                      },
                    ),
                    SizedBox(height: 20),
                    Text("choisir l'heure"),
                    SizedBox(
                      height: 10,
                    ),
                    DateTimeFormField(
                        formatter: f,
                        onlyTime: true,
                        initialValue: null,
                        label: "heure",
                        validator: (DateTime dateTime) {
                          if (dateTime == null) {
                            return "selectionner l'heure";
                          }
                          return null;
                        },
                        onSaved: (dateTime) {
                          setState(() {
                            heure = dateTime;
                          });
                        }),
                  ],
                ),
              ),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    _enregistrer();
                    print("vous avez valider");
                  },
                  child: Text("valider")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("annuler"))
            ],
          );
        });
  }

  Future reussite() async {
    return showDialog(
        barrierLabel: "Rendez-vous",
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("fermer"))
            ],
            content: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  CircleAvatar(
                    child: Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.white,
                    ),
                    radius: 50,
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Bravo! votre demande à été envoyer au medecin vous serez notifiez pour la suite")
                ],
              ),
            ),
          );
        });
  }

  void appel() {}
}
