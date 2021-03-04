import 'package:flutter/material.dart';

class Rv extends StatefulWidget {
  @override
  _RvState createState() => _RvState();
}

class _RvState extends State<Rv> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                    Text("12 Mars 2021")
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Heure",
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    SizedBox(height: 10),
                    Text("12h30")
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Medecin",
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    SizedBox(height: 10),
                    Text("Dr Assane Diallo")
                  ],
                )
              ],
            ),
            Divider(),
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
                      Text("Cardiologue")
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
                    Text("Structure de Dakar")
                  ],
                ),
                SizedBox(width: 10),
                Container(
                  //margin: EdgeInsets.only(left: 10),
                  child: FlatButton(
                      color: Colors.red,
                      onPressed: () {},
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
}
