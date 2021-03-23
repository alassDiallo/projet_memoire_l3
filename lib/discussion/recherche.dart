import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/discussion/echange.dart';
import 'package:gestion_materiel_cmu/models/utilisateur.dart';

class Recheche extends StatefulWidget {
  @override
  _RechecheState createState() => _RechecheState();
}

class _RechecheState extends State<Recheche> {
  List<Utilisateur> list = [];
  List<Utilisateur> filtre = [];

  void ajout() {
    list.add(Utilisateur(
        nom: "assane",
        contenu: "bonjour comment tu vas",
        image: "images/vol.png",
        heure: "21/02/2020"));
    list.add(Utilisateur(
        nom: "bassirou",
        contenu: "bonjour comment tu vas",
        image: "images/img4.png",
        heure: "21/02/2021"));
    list.add(Utilisateur(
        nom: "ousmane",
        contenu: "bonjour comment tu vas",
        image: "images/img2.png",
        heure: "21/03/2021"));
    list.add(Utilisateur(
        nom: "laye",
        contenu: "bonjour comment tu vas",
        image: "images/img3.png",
        heure: "02/02/2020"));
    list.add(Utilisateur(
        nom: "CYC",
        contenu: "bonjour comment tu vas",
        image: "images/ophtalmologie.png",
        heure: "21/06/2021"));
    list.add(Utilisateur(
        nom: "assane",
        contenu: "bonjour comment tu vas",
        image: "images/vol.png",
        heure: "21/02/2020"));
    list.add(Utilisateur(
        nom: "bassirou",
        contenu: "bonjour comment tu vas",
        image: "images/img4.png",
        heure: "23/01/2020"));
    list.add(Utilisateur(
        nom: "ousmane",
        contenu: "bonjour comment tu vas",
        image: "images/img2.png",
        heure: "24/01/2021"));
    list.add(Utilisateur(
        nom: "laye",
        contenu: "bonjour comment tu vas",
        image: "images/img3.png",
        heure: "21/02/2020"));
    list.add(Utilisateur(
        nom: "CYC",
        contenu: "bonjour comment tu vas",
        image: "images/ophtalmologie.png",
        heure: "21/02/2020"));
  }

  @override
  void initState() {
    ajout();
    setState(() {
      filtre = list;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(filtre);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: TextField(
            onChanged: (value) {
              setState(() {
                filtre = list
                    .where((element) => element.nom.contains(value))
                    .toList();
              });
            },
            autofocus: true,
            decoration: InputDecoration(
                hintText: "Recherche",
                hintStyle: TextStyle(color: Colors.grey),
                // prefixIcon: Icon(
                //   Icons.search,
                //   color: Colors.grey.shade400,
                //   size: 20,
                // ),
                // fillColor: Colors.grey.shade100,
                contentPadding: EdgeInsets.all(8),
                border: InputBorder.none
                // enabledBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(30),
                //     borderSide: BorderSide(color: Colors.grey))
                )),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: filtre.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                      child: Text(
                    "aucun resultatat",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
                  )),
                )
              : ListView.builder(
                  itemCount: filtre.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Echange(
                        nom: filtre[index].nom,
                        contenu: filtre[index].contenu,
                        image: filtre[index].image,
                        heure: filtre[index].heure,
                        lu: (index == 0 || index == 3) ? false : true);
                  }),
        ),
      ),
    );
  }
}
