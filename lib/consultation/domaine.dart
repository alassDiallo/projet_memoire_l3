import 'package:flutter/material.dart';

class Domaine extends StatefulWidget {
  String nom;
  bool isSelected;
  Domaine({this.nom, this.isSelected});
  @override
  _DomaineState createState() => _DomaineState();
}

class _DomaineState extends State<Domaine> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.isSelected ? Colors.blueAccent : Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          widget.nom,
          style:
              TextStyle(color: widget.isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
