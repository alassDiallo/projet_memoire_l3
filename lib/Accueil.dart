import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/Animation.dart';

class AccueilApp extends StatefulWidget {
  @override
  _AccueilAppState createState() => _AccueilAppState();
}

class _AccueilAppState extends State<AccueilApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/imga.png"), fit: BoxFit.cover)),
      child: Container(
        width: double.infinity,
        color: Colors.white.withOpacity(.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimation(
              delay: 1,
              child: Text(
                "Bienvenue",
                style: TextStyle(fontSize: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
