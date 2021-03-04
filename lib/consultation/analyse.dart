import 'package:flutter/material.dart';

class Analyse extends StatefulWidget {
  @override
  _AnalyseState createState() => _AnalyseState();
}

class _AnalyseState extends State<Analyse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 300,
      //margin: EdgeInsets.only(left: 5),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(
                "images/ophtalmologie.png",
                width: 100,
                height: 100,
              ),
              Text(
                "Radiographie",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlatButton(
                  onPressed: () {},
                  child: Text("rendez-vous"),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
