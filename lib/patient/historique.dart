import 'package:flutter/material.dart';

class Historique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mon Historique "),
          centerTitle: true,
        ),
        body: Container(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
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
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5))),
                                SizedBox(height: 10),
                                Text("27/12/2021")
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Heure",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5))),
                                SizedBox(height: 10),
                                Text("12h30")
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Medecin",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5))),
                                SizedBox(height: 10),
                                Text("Dr. Bassirou Dabo")
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
                                      style: TextStyle(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                  SizedBox(height: 10),
                                  Text("optalmologie")
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Structure",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                SizedBox(height: 10),
                                Text("Structure de Dakar")
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
