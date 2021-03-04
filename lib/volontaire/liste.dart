import "package:flutter/material.dart";
import 'package:gestion_materiel_cmu/couleurs.dart';
import 'package:gestion_materiel_cmu/volontaire/patient.dart';

class Liste extends StatefulWidget {
  @override
  _ListeState createState() => _ListeState();
}

class _ListeState extends State<Liste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Text("SELECTIONNER")],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Liste de mes patients",
              style: TextStyle(fontSize: 28, letterSpacing: 1.1),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "recherche....",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Text("mes patient"),
                SizedBox(width: 10),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: primaryColor, shape: BoxShape.circle),
                    child: Text(
                      "5",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )),
                Spacer(),
                Text("1h")
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Patient();
                }),
          )
        ],
      ),
    );
  }
}
