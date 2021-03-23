import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/models/consultation.dart';
import 'package:gestion_materiel_cmu/patient/ItemConsultation.dart';
import 'package:gestion_materiel_cmu/patient/detailConsultation.dart';

class Consultations extends StatefulWidget {
  @override
  _ConsultationsState createState() => _ConsultationsState();
}

class _ConsultationsState extends State<Consultations> {
  Widget con(int index) {
    Consultation c = list[index];
  }

  List<Consultation> l;

  @override
  void initState() {
    l = list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () {})
          ],
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  l = list
                      .where((element) =>
                          element.nom.toLowerCase().contains(value))
                      .toList();
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black26),
                  hintText: "rechercher...",
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        body: GridView.count(
          padding: EdgeInsets.symmetric(vertical: 20),
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 20,
          children: List.generate(l.length, (index) {
            return ItemConsultation(
                consultation: l[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail(consultation: l[index]))));
          }),
        ));
  }
}
