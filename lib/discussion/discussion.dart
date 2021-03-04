import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/discussion/echange.dart';
import 'package:gestion_materiel_cmu/models/utilisateur.dart';

class Discussion extends StatefulWidget {
  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  List<Utilisateur> list = [
    Utilisateur(
        nom: "assane",
        contenu: "bonjour comment tu vas",
        image: "images/vol.png",
        heure: "now"),
    Utilisateur(
        nom: "bassirou",
        contenu: "bonjour comment tu vas",
        image: "images/img4.png",
        heure: "now"),
    Utilisateur(
        nom: "ousmane",
        contenu: "bonjour comment tu vas",
        image: "images/img2.png",
        heure: "now"),
    Utilisateur(
        nom: "laye",
        contenu: "bonjour comment tu vas",
        image: "images/img3.png",
        heure: "now"),
    Utilisateur(
        nom: "CYC",
        contenu: "bonjour comment tu vas",
        image: "images/ophtalmologie.png",
        heure: "now"),
    Utilisateur(
        nom: "assane",
        contenu: "bonjour comment tu vas",
        image: "images/vol.png",
        heure: "now"),
    Utilisateur(
        nom: "bassirou",
        contenu: "bonjour comment tu vas",
        image: "images/img4.png",
        heure: "now"),
    Utilisateur(
        nom: "ousmane",
        contenu: "bonjour comment tu vas",
        image: "images/img2.png",
        heure: "now"),
    Utilisateur(
        nom: "laye",
        contenu: "bonjour comment tu vas",
        image: "images/img3.png",
        heure: "now"),
    Utilisateur(
        nom: "CYC",
        contenu: "bonjour comment tu vas",
        image: "images/ophtalmologie.png",
        heure: "now"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.pink[50]),
                  height: 30,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 20,
                      ),
                      SizedBox(width: 2),
                      Text(
                        "Nouveau",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
                decoration: InputDecoration(
                    hintText: "Recherche",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade400,
                      size: 20,
                    ),
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey)))),
          ),
          ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Echange(
                    nom: list[index].nom,
                    contenu: list[index].contenu,
                    image: list[index].image,
                    heure: list[index].heure,
                    lu: (index == 0 || index == 3) ? false : true);
              })
        ],
      ),
    ));
  }
}
