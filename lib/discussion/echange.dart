import 'package:flutter/material.dart';
import 'PageMessage.dart';

class Echange extends StatefulWidget {
  String nom;
  String image;
  String contenu;
  String heure;
  bool lu;
  Echange({this.nom, this.contenu, this.image, this.heure, this.lu});
  @override
  _EchangeState createState() => _EchangeState();
}

class _EchangeState extends State<Echange> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PageMessage()));
          },
          title: Text(widget.nom),
          subtitle: Text(widget.contenu),
          trailing: Text(
            widget.heure,
            style: TextStyle(color: widget.lu ? Colors.grey : Colors.red),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage(widget.image),
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
