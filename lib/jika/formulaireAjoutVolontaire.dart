import 'package:flutter/material.dart';

class AjoutVolontaire extends StatefulWidget {
  @override
  _AjoutVolontaireState createState() => _AjoutVolontaireState();
}

class _AjoutVolontaireState extends State<AjoutVolontaire> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: [
            Text("Ajouter un volontaire"),
            Form(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                    hintText: "entrer le nom du volontaire",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                      hintText: "entrer le prenom du volontaire",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ))),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                    hintText: "entrer la date de naissance du volontaire",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                    hintText: "entrer le lieu de naissance du volontaire",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                    hintText: "entrer l'adresse du volontaire",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                    hintText: "entrer le telephone du volontaire",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                      hintText: "entrer le email volontaire",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ))),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                    hintText: "entrer le numero de CIN du volontaire",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                    hintText: "Choisir la Strucrure",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                    hintText: "Choisir le materiel",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
