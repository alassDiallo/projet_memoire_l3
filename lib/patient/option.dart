import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  String text;
  Icon icon;
  Color couleur;
  Option({this.text, this.couleur, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 10,
        margin: EdgeInsets.only(right: 15, bottom: 20),
        color: couleur,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(alignment: Alignment.bottomRight, child: icon),
            ],
          ),
        ),
      ),
    );
  }
}
