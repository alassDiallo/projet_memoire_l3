import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

import 'package:url_launcher/url_launcher.dart';

class ProfilPatient extends StatefulWidget {
  Patient patient;
  ProfilPatient({this.patient});

  @override
  _ProfilPatientState createState() => _ProfilPatientState();
}

class _ProfilPatientState extends State<ProfilPatient> {
  // DateTime heure, date;
  // DateFormat df = DateFormat("dd/MM/yyyy");
  // var cle = GlobalKey<FormState>();
  // void _enregistrer() async {
  //   if (cle.currentState.validate()) {
  //     cle.currentState.save();
  //     // print("heure ${heure.hour}:${heure.minute}");
  //     // print("heure ${date.toString()}");
  //     print(df.format(date));

  //     Map<String, dynamic> rv = {
  //       "idpatient": widget.patient.idpatient.toString(),
  //       "date": date.toString(),
  //       "heure": (heure.hour > 9 ? '${heure.hour}h' : "0${heure.hour}h") +
  //           (heure.minute > 9 ? heure.minute.toString() : "0${heure.minute}")
  //     };

  //     var url = "auth/rendezvous";
  //     var donnee = await Connexion().envoideDonnnee(rv, url);
  //     // print(url);
  //     print(donnee);
  //     // var donnee = await http.post(Uri.encodeFull(url), body: rv);
  //     print(donnee.body);
  //     if (donnee.statusCode == 200) {
  //       print(donnee.body);
  //       Navigator.pop(context);
  //       reussite();
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Profil Patient "),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          width: double.infinity,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage('images/doctor-5883502_640.png'),
          //       alignment: Alignment.topLeft,
          //       fit: BoxFit.fitWidth),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 50,
                child: Image.asset("images/vol.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  " " +
                      widget.patient.prenom.toUpperCase() +
                      "  " +
                      widget.patient.nom.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 25,
              ),
              Divider(
                thickness: 2,
                endIndent: 15,
                indent: 15,
                color: Colors.blue,
                height: 5,
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.blue,
                                ),
                                Text("Lieu de naissance : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                Text(widget.patient.lieuDeNaissance),
                              ],
                            ),
                            SizedBox(height: 25),
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.date_range_sharp,
                            //       color: Colors.red,
                            //     ),
                            //     Text("Date de naissance : "),
                            //     Text("${widget.patient.dateDeNaissance}"),
                            //   ],
                            // ),
                            // SizedBox(height: 30),
                            Row(
                              children: [
                                Icon(
                                  Icons.person_rounded,
                                  color: Colors.blue,
                                ),
                                Text("Sexe : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                Text(widget.patient.sexe),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_city_outlined,
                                  color: Colors.blue,
                                ),
                                Text("Adresse : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                Text(widget.patient.adresse),
                              ],
                            ),
                            SizedBox(height: 25),
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.person_rounded,
                            //       color: Colors.red,
                            //     ),
                            //     Text("Email : "),
                            //     Text(widget.patient.email),
                            //   ],
                            // ),
                            Row(
                              children: [
                                Icon(
                                  Icons.format_list_numbered_rounded,
                                  color: Colors.blue,
                                ),
                                Text("C N I : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                Text(widget.patient.numeroCIN),
                              ],
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: [
                                Icon(
                                  Icons.format_list_numbered_rtl_sharp,
                                  color: Colors.blue,
                                ),
                                Text("Reference CMU : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                Text(widget.patient.referencePatient),
                              ],
                            ),
                            SizedBox(height: 25),
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.location_pin,
                            //       color: Colors.red,
                            //     ),
                            //     Text("Etat : "),
                            //     widget.patient.etat == true
                            //         ? Text("Active")
                            //         : Text("Non active")
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        launch("tel://" + widget.patient.telephone);
                      },
                    ),
                  ),
                  Text("Appeler ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  // Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 10),
                  //     decoration: BoxDecoration(
                  //         color: Colors.yellow[50],
                  //         borderRadius: BorderRadius.circular(10)),
                  //     // padding: EdgeInsets.all(10),
                  //     child: IconButton(
                  //       icon: Icon(
                  //         Icons.chat,
                  //         color: Colors.yellow,
                  //       ),
                  //       onPressed: () {},
                  //     )),
                ],
              ),
            ],
          ),
        )));
  }
}
