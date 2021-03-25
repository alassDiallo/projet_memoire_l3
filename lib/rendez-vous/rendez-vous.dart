import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/rendez-vous.dart';
import 'package:intl/intl.dart';

class Rv extends StatefulWidget {
  RendezV rv;
  Rv({this.rv});
  @override
  _RvState createState() => _RvState();
}

class _RvState extends State<Rv> {
  DateFormat df = DateFormat("dd/MM/yyyy");
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date",
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    SizedBox(height: 10),
                    Text(df.format(DateTime.parse(widget.rv.date)))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Heure",
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    SizedBox(height: 10),
                    Text(widget.rv.heure.toString())
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Medecin",
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    SizedBox(height: 10),
                    Text("Dr. " + widget.rv.nomMedecin)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Specialité",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5))),
                      SizedBox(height: 10),
                      Text(widget.rv.specialite)
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Structure",
                      style: TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                    SizedBox(height: 10),
                    Text(widget.rv.structure)
                  ],
                ),
                SizedBox(width: 10),
                Container(
                  //margin: EdgeInsets.only(left: 10),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.red,
                      onPressed: () {
                        annuler(widget.rv);
                      },
                      child: Text(
                        "Annuler",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  annuler(RendezV v) {
    print(v.idR);
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("annuler le rendez-vous"),
              content: Text("voulez-vous annuler ce rendez-vous ?"),
              actions: [
                FlatButton(
                    onPressed: () {
                      supprimer(v.idR);
                    },
                    child: Text('oui')),
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('non'))
              ],
            ));
  }

  Future supprimer(idR) async {
    var url = "auth/rendezvous/${idR}";
    var donnees = await Connexion().supprimer(url);
    print(donnees);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Vous avez annuler le rendez-vous"),
      backgroundColor: Colors.green,
    ));
  }
}
