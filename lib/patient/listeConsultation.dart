import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/consultation/analyse.dart';
import 'package:gestion_materiel_cmu/consultation/consultations.dart';
import 'package:gestion_materiel_cmu/docteur/detailDocteur.dart';
import 'package:gestion_materiel_cmu/models/consultation.dart';
import 'package:gestion_materiel_cmu/patient/detailConsultation.dart';
import 'package:gestion_materiel_cmu/patient/itemConsultation.dart';
import 'package:gestion_materiel_cmu/patient/slide.dart';

class ListeC extends StatefulWidget {
  @override
  _ListeCState createState() => _ListeCState();
}

class _ListeCState extends State<ListeC> {
  Widget con(int index) {
    Consultation c = list[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        title: Text(
          "Liste Consultation",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 300, child: Slide()),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Consultations",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Consultations()));
                        },
                        child: Text("voir+", style: TextStyle(fontSize: 16))),
                  ],
                )),
            Container(
              height: 330,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ItemConsultation(
                        consultation: list[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Detail(consultation: list[index]))));
                  }),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Analyse et Examen",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("voir+", style: TextStyle(fontSize: 16)),
                  ],
                )),
            Container(
              height: 270,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Analyse();
                  }),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Medecin",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("voir+", style: TextStyle(fontSize: 16)),
                  ],
                )),
            Container(
              height: 270,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _medecin();
                  }),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Specialite",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("voir+", style: TextStyle(fontSize: 16)),
                  ],
                )),
            Container(
              height: 270,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Analyse();
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _medecin() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailDocteur()));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        width: 300,
        //margin: EdgeInsets.only(left: 5),
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Image.asset(
                  "images/vol.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  "Dr. Assane Diallo",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Ophtalmologue",
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
