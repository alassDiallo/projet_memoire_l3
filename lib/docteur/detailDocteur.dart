import 'package:flutter/material.dart';

class DetailDocteur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/doctor-5883502_640.png'),
            alignment: Alignment.topLeft,
            fit: BoxFit.fitWidth),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 30),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Image.asset("images/vol.png"),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Dr. Assane Diallo",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        SizedBox(height: 10),
                        Text("Optalmologue"),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10)),
                              //padding: EdgeInsets.all(10),
                              child: IconButton(
                                icon: Icon(Icons.call),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10)),
                                // padding: EdgeInsets.all(10),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.chat,
                                    color: Colors.yellow[700],
                                  ),
                                  onPressed: () {},
                                )),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10)),
                              // padding: EdgeInsets.all(5),
                              child: IconButton(
                                icon: Icon(
                                  Icons.video_call,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              children: [
                Text("A propos du Medecin",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(
                  "Notre choix est porté sur le modèle vu contrôleur (MVC) qui présente beaucoup d’avantages.Ce modèle permet de classer les différentes parties de l’application. Le modèle représente la partie logique de l’application c’est à dire les interactions avec la base de données, les traitements des opérations correspondants",
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
