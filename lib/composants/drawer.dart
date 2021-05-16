import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/Login.dart';
import 'package:gestion_materiel_cmu/chat/Discussion.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;

class Drawers extends StatefulWidget {
  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  var user;

  getUser() async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    setState(() {
      user = json.decode(localstorage.getString("user"));
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[900]),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue[100],
                    child: Text(""),
                    radius: 30,
                    foregroundColor: Colors.red,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Al Hassane Diallo",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("774298343",
                          style: TextStyle(fontSize: 22, color: Colors.white))
                    ],
                  ),
                ],
              )),
            ),
            ListTile(leading: Icon(Icons.person), title: Text("Profil")),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Modifier votre mot de passe"),
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.share),
                title: Text("Partager l'application")),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("se deconnecter"),
              onTap: () {
                _logout();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Aide"),
              onTap: () {
                return Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatPage()));
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
    ;
  }

  void _logout() async {
    var res = await Connexion().deconnexion('auth/logout');
    var body = convert.jsonDecode(res.body);
    print(body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
