import 'package:flutter/material.dart';
import 'dart:async';

import 'package:gestion_materiel_cmu/Accueil.dart';
import 'package:gestion_materiel_cmu/Login.dart';

class AccueilA extends StatefulWidget {
  @override
  _AccueilAState createState() => _AccueilAState();
}

class _AccueilAState extends State<AccueilA> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7bdfa9),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logosenjica.jpeg"),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
