import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/Message.dart';
import 'package:gestion_materiel_cmu/models/utilisateur.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'PageMessage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;

class Echange extends StatefulWidget {
  String nom;
  String image;
  String contenu;
  String heure;
  bool lu;
  Utilisateur u;
  Echange({this.u, this.nom, this.contenu, this.image, this.heure, this.lu});
  @override
  _EchangeState createState() => _EchangeState();
}

class _EchangeState extends State<Echange> {
  IO.Socket socket;
  int nv = 0;
  Mess m;
  var user;

  getUser() async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    setState(() {
      user = json.decode(localstorage.getString('user'));
    });
  }

  connection() {
    socket = IO.io("http://192.168.43.100:3000/", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false
    });
    socket.connect();
    socket.onConnect((data) => print("bonjour je suis connecter"));
    print(socket.connected);
    //socket.emit("message", "bonjour serveur");
    socket.on("message", (data) {
      print("-----------message---------------");
      print(data);
      if (data['recipient_id'] == user['email'] &&
          data['idMessagerie'] == widget.u.idMessagerie) {
        setState(() {
          setState(() {
            nv += 1;
            m = Mess(message: data['contenu'], dateenvoi: data['dateEnvoi']);
          });
          // list.add(Mess(message: data, type: MessageType.receiver));
        });
      }
    });
  }

  dernierMessage() async {
    var url = "auth/message/" + widget.u.idMessagerie.toString();
    print(url);
    var donnee = await Connexion().recuperation(url);
    print(donnee.body);
    if (donnee.statusCode == 200) {
      var d = convert.jsonDecode(donnee.body);
      print(d);
      setState(() {
        m = Mess(
            message: d['contenu'],
            dateenvoi: d["created_at"],
            recipientid: d["recipient_id"],
            senderid: d["sender_id"]);
      });
      print(m);
    }
  }

  @override
  void initState() {
    getUser();
    dernierMessage();
    connection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateFormat df = DateFormat("dd/MM/yyyy");
    print(widget.u);
    return Column(
      children: [
        ListTile(
          onTap: () {
            setState(() {
              nv = 0;
            });
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PageMessage(u: widget.u)));
          },
          title: Text(
            widget.u.nom,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(m.message != null ? m.message : ""),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                m.dateenvoi != null
                    ? df.format(DateTime.parse(m.dateenvoi))
                    : "",
                // style: TextStyle(color: widget.lu ? Colors.grey : Colors.red),
              ),
              nv > 0
                  ? Badge(
                      badgeContent: Text(
                        nv.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Text("")
            ],
          ),
          leading: CircleAvatar(
            // backgroundImage: AssetImage(widget.image),
            maxRadius: 30,
          ),
        ),
        Divider(
          indent: 60,
        )
      ],
    );
  }
}
