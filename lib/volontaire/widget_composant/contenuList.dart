import 'package:flutter/material.dart';

//TODO: Faire une classe Globale pour contenu liste

class Contenulist extends StatelessWidget {
  String title;
  String contenu;
  Widget details;
  Contenulist(this.title, this.contenu, this.details);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.request_quote_outlined),
                radius: 15,
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Text(
                    this.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(this.contenu)
                ],
              ),
              Spacer(),
              Column(
                children: [
                  GestureDetector(
                      child: Icon(Icons.navigate_next_rounded,
                          color: Colors.blue, size: 40),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => this.details));
                      }),
                ],
              ),
            ],
          ),
        ));
  }
}
