import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/jika/accueiljica.dart';
import 'package:gestion_materiel_cmu/models/Structure.dart';
//import 'package:gestion_materiel_cmu/volontaire/accueil.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/accueil.dart';
import 'medecin/accueil.dart';
import 'dart:async';
import 'package:gestion_materiel_cmu/patient/accueil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var cle = GlobalKey<FormState>();
  String _login = '';
  String _motDePass = '';
  DateTime _dateDeNaissance;

  void _connexion() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AccueilPatient();
    }));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cle = GlobalKey<FormState>();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            // height: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Authentification",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "images/accueil.jpg",
                        height: size.height * 0.35,
                        width: size.width * 0.9,
                      ),
                    ),
                    Container(
                        child: Form(
                      key: cle,
                      child: Column(children: [
                        Container(
                          width: size.width * 0.8,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: TextFormField(
                              onChanged: (String log) {},
                              onSaved: (String log) {},
                              decoration: InputDecoration(
                                  hintText: "entez votre login",
                                  icon: Icon(Icons.person),
                                  border: InputBorder.none)),
                        ),
                        Container(
                          width: size.width * 0.8,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: TextFormField(
                              obscureText: true,
                              onSaved: (String mp) {},
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.visibility),
                                  hintText: "entez votre mot de passe",
                                  fillColor: Colors.blue,
                                  icon: Icon(Icons.lock),
                                  border: InputBorder.none)),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(29),
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                color: Colors.blue,
                                //textColor: Colors.white,
                                child: Text(
                                  "Se connecter",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: _connexion,
                              )),
                        )
                      ]),
                    )),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    GestureDetector(
                        onTap: () {
                          print("clicquer");
                        },
                        child: Text(
                          "mot de passe oublié ?",
                          style: TextStyle(color: Colors.blue),
                        )),
                    FlatButton(
                      child: Text("Volontaire"),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Volontaire()));
                      },
                    ),
                    FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccueilMedecin()));
                        },
                        child: Text("Medecin")),
                    FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          //  getStructure();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccueilJica()));
                        },
                        child: Text("JICA")),
                  ],
                )
              ],
            )),
      ),
    ));
  }

  List<Structure> st = [];
  Future getStructure() async {
    String url = "http://192.168.43.100:8000/api/a";

    var data = await http.get(url);
    var donne = convert.jsonDecode(data.body);
    print(donne);
  }
}
