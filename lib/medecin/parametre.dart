import 'package:flutter/material.dart';

class Parametre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: size.height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Image.asset("images/vol.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Assane Diallo",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "OPHTALMOLOGUE",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("modifier mon mot de passse"),
              trailing: Icon(
                Icons.chevron_right,
              ),
            ),
            Divider(),
            ListTile(
              title: Text("modifier mon numero de telephone"),
              trailing: Icon(
                Icons.chevron_right,
              ),
            ),
            Divider(),
            ListTile(
              title: Text("modifier mon adresse email"),
              trailing: Icon(
                Icons.chevron_right,
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
