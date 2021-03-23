import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/Login.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert' as convert;

class Drawers extends StatefulWidget {
  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue[100],
                    child: Text("AHD"),
                    radius: 30,
                    foregroundColor: Colors.red,
                  ),
                  Text(
                    "Al Hassane Diallo",
                    style: TextStyle(fontSize: 22),
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
              onTap: () {},
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