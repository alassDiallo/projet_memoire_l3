import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/jika/accueiljica.dart';
import 'dart:convert';
//import 'package:gestion_materiel_cmu/volontaire/accueil.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/accueil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'medecin/accueil.dart';
import 'dart:async';
import 'package:gestion_materiel_cmu/patient/accueil.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String err = '';
  bool connecter = false;
  final cle = GlobalKey<FormState>();
  String _login;
  String _motDePass;
  bool _obscureText = true;

  Future<void> _connexion() async {
    if (cle.currentState.validate()) {
      cle.currentState.save();
      setState(() {
        connecter = true;
      });
      var donnee = {'email': _login, 'password': _motDePass};
      // var url = Connexion.url + "auth/login";
      var r = await Connexion().envoideDonnnee(donnee, "auth/login");
      print(r.body);
      var d = json.decode(r.body);
      print(d);
      if (d['success']) {
        setState(() {
          err = '';
        });
        print(d['token']);
        print(d['user']['profil']);
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(d['token']));
        localStorage.setString('user', json.encode(d['user']));
        localStorage.setString('utilisateur', json.encode(d['utilisateur']));
        print(localStorage.getString('utilisateur'));
        if (d['user']['profil'] == "patient") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AccueilPatient();
          }));
        } else if (d['user']['profil'] == "medecin") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AccueilMedecin()));
        } else if (d['user']['profil'] == "admin") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AccueilJica()));
        } else if (d['user']['profil'] == "volontaire") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Volontaire()));
        }
      } else {
        setState(() {
          err = 'login ou mot de passe inccorrect';
        });
      }
    }
  }

  @override
  void initState() {
    verif();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                color: Colors.white,
                // height: size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text("Authentification",
                        //     style: TextStyle(
                        //         fontSize: 30,
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.bold)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "images/connexion.jpg",
                            // height: size.height * 0.35,
                            // width: size.width * 0.9,
                          ),
                        ),
                        Container(
                            child: Form(
                          key: cle,
                          child: Column(children: [
                            Text(err, style: TextStyle(color: Colors.red)),
                            Container(
                              width: size.width * 0.8,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: BoxDecoration(
                                // border: Border(
                                //   top: BorderSide(color: Colors.red),
                                //   left: BorderSide(color: Colors.red),
                                //   right: BorderSide(color: Colors.red),
                                //   bottom: BorderSide(color: Colors.red),
                                // ),
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: TextFormField(
                                  onChanged: (String log) {
                                    setState(() {
                                      _login = log;
                                    });
                                  },
                                  onSaved: (String log) {
                                    setState(() {
                                      _login = log;
                                    });
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "veullez renseigner le champs";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: "entrez votre login",
                                      icon: Icon(Icons.email),
                                      border: InputBorder.none)),
                            ),
                            Container(
                              width: size.width * 0.8,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: TextFormField(
                                  obscureText: _obscureText,
                                  onSaved: (String mp) {
                                    setState(() {
                                      _motDePass = mp;
                                    });
                                  },
                                  onChanged: (mp) {
                                    setState(() {
                                      _motDePass = mp;
                                    });
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "veuillez renseigner le champs";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                          child: _obscureText
                                              ? Icon(Icons.visibility)
                                              : Icon(Icons.visibility_off)),
                                      hintText: "entrez votre mot de passe",
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
                      ],
                    )
                  ],
                )),
          ),
        ));
  }

  void verif() async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    var token = localstorage.getString('token');
    print(token);

    if (token != null) {
      var user = json.decode(localstorage.getString('user'));
      if (user['profil'] == "patient") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AccueilPatient();
        }));
      } else if (user['profil'] == "medecin") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AccueilMedecin()));
      } else if (user['profil'] == "admin") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AccueilJica()));
      } else if (user['profil'] == "volontaire") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Volontaire()));
      }
    }
  }
}

void ess() {
  //  FlatButton(
  //                     child: Text("Volontaire"),
  //                     color: Colors.blue,
  //                     onPressed: () {
  //                       Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) => Volontaire()));
  //                     },
  //                   ),
  //                   FlatButton(
  //                       color: Colors.blue,
  //                       onPressed: () {
  //                         Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: (context) => AccueilMedecin()));
  //                       },
  //                       child: Text("Medecin")),
  //                   FlatButton(
  //                       color: Colors.blue,
  //                       onPressed: () {
  //                         //  getStructure();
  //                         Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: (context) => AccueilJica()));
  //                       },
  //                       child: Text("JICA")),
  //  if (r.statusCode == 200) {
  //     var d = convert.jsonDecode(r.body);
  //     print("connecter");
  //     // if (d['success']) {
  //     //   SharedPreferences localstorage = await SharedPreferences.getInstance();
  //     //   print(d['user']);
  //     // localstorage.setString("token", d['token']);
  //     // localstorage.setString("user", d['user']);
  //     // if (d['user']['profill'] == "patient") {
  //     //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     //     return AccueilPatient();
  //     //   }));
  //     // } else if (d['user']['profill'] == "medecin") {
  //     //   Navigator.push(context,
  //     //       MaterialPageRoute(builder: (context) => AccueilMedecin()));
  //     // } else if (d['user']['profill'] == "admin") {
  //     //   Navigator.push(
  //     //       context, MaterialPageRoute(builder: (context) => AccueilJica()));
  //     // } else if (d['user']['profil'] == "volontaire") {
  //     //   Navigator.push(
  //     //       context, MaterialPageRoute(builder: (context) => Volontaire()));
  //     // }
  //     // } else {
  //     //   setState(() {
  //     //     err = d['error'];
  //     //   });
  //     // }
  //   }
  // } else {
  //   setState(() {
  //     connecter = false;
  //   });
  // }
//  }
}
