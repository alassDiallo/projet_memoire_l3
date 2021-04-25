import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/discussion/echange.dart';
import 'package:gestion_materiel_cmu/discussion/recherche.dart';
import 'package:gestion_materiel_cmu/models/utilisateur.dart';
import 'dart:async';
import 'dart:convert' as convert;

class Discussion extends StatefulWidget {
  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  List<Utilisateur> messagerie = [];
  List<Utilisateur> list = [
    Utilisateur(
        nom: "assane",
        contenu: "bonjour comment tu vas",
        image: "images/vol.png",
        heure: "21/02/2020"),
    Utilisateur(
        nom: "bassirou",
        contenu: "bonjour comment tu vas",
        image: "images/img4.png",
        heure: "21/02/2021"),
    Utilisateur(
        nom: "ousmane",
        contenu: "bonjour comment tu vas",
        image: "images/img2.png",
        heure: "21/03/2021"),
    Utilisateur(
        nom: "laye",
        contenu: "bonjour comment tu vas",
        image: "images/img3.png",
        heure: "02/02/2020"),
    Utilisateur(
        nom: "CYC",
        contenu: "bonjour comment tu vas",
        image: "images/ophtalmologie.png",
        heure: "21/06/2021"),
    Utilisateur(
        nom: "assane",
        contenu: "bonjour comment tu vas",
        image: "images/vol.png",
        heure: "21/02/2020"),
    Utilisateur(
        nom: "bassirou",
        contenu: "bonjour comment tu vas",
        image: "images/img4.png",
        heure: "23/01/2020"),
    Utilisateur(
        nom: "ousmane",
        contenu: "bonjour comment tu vas",
        image: "images/img2.png",
        heure: "24/01/2021"),
    Utilisateur(
        nom: "laye",
        contenu: "bonjour comment tu vas",
        image: "images/img3.png",
        heure: "21/02/2020"),
    Utilisateur(
        nom: "CYC",
        contenu: "bonjour comment tu vas",
        image: "images/ophtalmologie.png",
        heure: "21/02/2020"),
  ];

  Future<void> getMessagerie() async {
    // Utilisateur(
    //     nom: "assane",
    //     contenu: "bonjour comment tu vas",
    //     image: "images/vol.png",
    //     heure: "21/02/2020");
    String url = "auth/messagerie";
    var donnee = await Connexion().recuperation(url);
    print(donnee.body);
    if (donnee.statusCode == 200) {
      var d = convert.jsonDecode(donnee.body);
      for (var u in d) {
        // print(u['idMessagerie']);
        // var mess;
        // var dern = Connexion()
        //     .recuperation("auth/messagerie/" + u['idMessagerie'].toString());
        // print(dern.body);
        // if (dern.statusCode == 200) {
        //   var dr = convert.jsonDecode(dern.body);
        //   mess = dr["message"];
        // }
        // print(mess);
        setState(() {
          messagerie.add(Utilisateur(
            nom: "Dr. " + u['prenom'] + " " + u['nom'],
            idMessagerie: u['idMessagerie'],
            //contenu: "bonjour comment tu vas",
            image: "images/vol.png",
            // heure: "21/02/2020"
          ));
        });
      }
    }
  }

  @override
  void initState() {
    getMessagerie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Recheche()));
                })
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discussion",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[900]),
                      height: 30,
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 2),
                          Text(
                            "Nouveau",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
              messagerie.isEmpty
                  ? Center(
                      child: Text("Vous n'avez pas de discussion"),
                    )
                  : ListView.builder(
                      itemCount: messagerie.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Echange(u: messagerie[index]);
                      })
            ],
          ),
        ));
  }
}
