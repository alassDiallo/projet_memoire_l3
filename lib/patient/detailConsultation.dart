import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/docteur/doctorCategorie.dart';
import 'package:gestion_materiel_cmu/medecin/Affichage.dart';
import 'package:gestion_materiel_cmu/models/consultation.dart';
import 'package:gestion_materiel_cmu/models/medecin.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Detail extends StatefulWidget {
  final Consultation consultation;
  Detail({this.consultation, Key key}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List<Medecin> medecins = [];
  Future<void> getMedecin() async {
    var url = "auth/specialite/${widget.consultation.nom}";
    print(url);
    var donnees = await Connexion().recuperation(url);
    if (donnees.statusCode == 200) {
      var medecin = convert.jsonDecode(donnees.body);
      for (var med in medecin) {
        setState(() {
          medecins.add(Medecin(
              nom: med["nom"],
              idMedecin: med["idMedecin"],
              prenom: med["prenom"],
              libelleSpecialite: med["libelle"],
              telephone: med["telephone"],
              region: med["region"],
              structure: med["nomStructure"]));
        });
      }
    }
  }

  @override
  void initState() {
    getMedecin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail consultation"),
      ),
      backgroundColor: Colors.blue,
      /* floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Message()));
        },
        tooltip: "contacter le medecin",
      ),*/
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: size.height * 0.1, left: 10, right: 10),
              margin: EdgeInsets.only(top: size.height * 0.3),
              //height: 500,

              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Consultation : ",
                                style: Theme.of(context).textTheme.headline6),
                            TextSpan(
                                text: widget.consultation.prix.toString(),
                                style: Theme.of(context).textTheme.headline5)
                          ])),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          children: [
                            Icon(Icons.list),
                            Text(
                              "Liste des Medecins",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      SingleChildScrollView(
                        child: Container(
                            height: 400,
                            //     .size
                            //     .bottomCenter(Offset(0, 0)),
                            // width: MediaQuery.of(context).size.width,
                            child: medecins.isNotEmpty
                                ? ListView.builder(
                                    itemCount: medecins.length,
                                    itemBuilder: (context, index) {
                                      return DocteurCategorie(
                                          medecin: medecins[index]);
                                    })
                                : Text(
                                    "cette Specialite n'a pas encore de medecin")),
                      )
                    ],
                  ),
                ],
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(children: [
                Text(
                  widget.consultation.nom.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 38),
                ),
                Divider(
                  color: Colors.white,
                ),
                Image.asset(
                  widget.consultation.image,
                  width: size.width,
                  height: 200,
                )
              ]),
            ),
            // Positioned(
            //   bottom: 5,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //     width: size.width,
            //     child: ClipRRect(
            //         borderRadius: BorderRadius.circular(29),
            //         child: FlatButton(
            //             padding:
            //                 EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            //             color: Colors.blue,
            //             //textColor: Colors.white,
            //             child: Text(
            //               "Demande de rendez-vous",
            //               style: TextStyle(color: Colors.white),
            //             ),
            //             onPressed: dateR)),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Future<Null> dateR() async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Date pour le rendez-vous"),
            content: Container(
              height: 100,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("choisir la date"),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onTap: date,
                    )
                  ],
                ),
              ),
            ),
            actions: [
              FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    print("annuler");
                    Navigator.pop(context);
                  },
                  child: Text("annuler")),
              FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    snack();
                    print("valider");
                    Navigator.pop(context);
                  },
                  child: Text("valider")),
            ],
          );
        });
  }

  Future<Null> date() async {
    var date = showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
  }

  void snack() {
    SnackBar sn = SnackBar(
        backgroundColor: Colors.green,
        content: Text("Votre demande de rendez-vous a été envoyer"));
    Scaffold.of(context).showSnackBar(sn);
  }

  List<Widget> listeMedecin() {
    List<Widget> l = [];
    ListView.builder(
        itemCount: medecins.length,
        itemBuilder: (context, index) {
          return DocteurCategorie(medecin: medecins[index]);
        });
  }
}

/*class Detail extends StatelessWidget {
  final Consultation consultation;

  Detail({this.consultation, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail consultation"),
      ),
      backgroundColor: Colors.blue,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          
        },
        tooltip: "contacter le medecin",
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: size.height * 0.12, left: size.width * 0.12),
            margin: EdgeInsets.only(top: size.height * 0.3),
            //height: 500,
            child: Column(
              children: [
                Text("Description",
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Divider(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25, top: 10),
                      child: Text(
                        "akalksoksoikzoiiiisssssssssaaaaaaaaaaaaaaaaaaaaasssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
                        style: TextStyle(height: 1.5),
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Consultation : ",
                              style: Theme.of(context).textTheme.headline6),
                          TextSpan(
                              text: consultation.prix.toString(),
                              style: Theme.of(context).textTheme.headline5)
                        ])),
                      ],
                    ),
                    Text("Dr. " + consultation.nomDocteur)
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(children: [
              Text(
                consultation.nom.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              Divider(
                color: Colors.white,
              ),
              Image.asset(
                consultation.image,
                width: size.width,
                height: 200,
              )
            ]),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.7,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    color: Colors.blue,
                    //textColor: Colors.white,
                    child: Text(
                      "Demande de rendez-vous",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                    
                      Navigator.pop(context);
                    },
                  )),
            ),
          )
        ],
      ),
      
    );
    
    
  }
  void ans {
      SnackBar sn = SnackBar(
          //backgroundColor: Colors.green,
          content: Text("Votre demande de rendez-vous a été envoyer"));
      Scaffold.of(context).showSnackBar(sn);
    }
  
}*/
