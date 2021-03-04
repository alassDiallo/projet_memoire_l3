import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/consultation/domaine.dart';

class Consultation extends StatefulWidget {
  @override
  _ConsultationState createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  List<String> consultation = [
    "ophtamologie",
    "radiologie",
    "neurologie",
    "pneumologie",
    "pediatrie",
    "general"
  ];
  String selectedcon = "radiologie";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text("Trouver votre consultation",
                    style: TextStyle(fontSize: 20))),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.grey.shade300,
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Consultation",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: consultation.length,
                  itemBuilder: (context, index) {
                    return Domaine(
                      nom: consultation[index],
                      isSelected: (selectedcon == consultation[index]),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
