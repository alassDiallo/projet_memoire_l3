import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/medecin/Affichage.dart';
import 'package:gestion_materiel_cmu/models/consultation.dart';

class Detail extends StatefulWidget {
  final Consultation consultation;
  Detail({this.consultation, Key key}) : super(key: key);
  @override
  _DetailState createState() => _DetailState(consultation: consultation);
}

class _DetailState extends State<Detail> {
  final Consultation consultation;
  _DetailState({this.consultation}) : super();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail consultation"),
      ),
      backgroundColor: Colors.blue,
      /* floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Message()));
        },
        tooltip: "contacter le medecin",
      ),*/
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: size.height * 0.12, left: size.width * 0.12),
            margin: EdgeInsets.only(top: size.height * 0.3),
            //height: 500,

            child: Column(
              children: [
                Text("Description",
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25, top: 10),
                      child: Text(
                        "Notre choix est porté sur le modèle vu contrôleur (MVC) qui présente beaucoup d’avantages. Ce modèle permet de classer les différentes parties de l’application. Le modèle représente la partie logique de l’application c’est à dire les interactions avec la base de données, les traitements des opérations correspondants",
                        style: TextStyle(height: 1.5),
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Consultation : ",
                              style: Theme.of(context).textTheme.headline6),
                          TextSpan(
                              text: consultation.prix.toString(),
                              style: Theme.of(context).textTheme.headline5)
                        ])),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Dr. " + consultation.nomDocteur)
                  ],
                ),
              ],
            ),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(children: [
              Text(
                consultation.nom.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              Divider(
                color: Colors.white,
              ),
              Image.asset(
                consultation.image,
                width: size.width,
                height: 200,
              )
            ]),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: size.width,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    color: Colors.blue,
                    //textColor: Colors.white,
                    child: Text(
                      "Demande de rendez-vous",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      snack();
                      Navigator.pop(context);
                    },
                  )),
            ),
          )
        ],
      ),
    );
  }

  void snack() {
    SnackBar sn = SnackBar(
        backgroundColor: Colors.green,
        content: Text("Votre demande de rendez-vous a été envoyer"));
    Scaffold.of(context).showSnackBar(sn);
  }
}

/*class Detail extends StatelessWidget {
  final Consultation consultation;

  Detail({this.consultation, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail consultation"),
      ),
      backgroundColor: Colors.blue,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {},
        tooltip: "contacter le medecin",
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: size.height * 0.12, left: size.width * 0.12),
            margin: EdgeInsets.only(top: size.height * 0.3),
            //height: 500,
            child: Column(
              children: [
                Text("Description",
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Divider(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25, top: 10),
                      child: Text(
                        "akalksoksoikzoiiiisssssssssaaaaaaaaaaaaaaaaaaaaasssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
                        style: TextStyle(height: 1.5),
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Consultation : ",
                              style: Theme.of(context).textTheme.headline6),
                          TextSpan(
                              text: consultation.prix.toString(),
                              style: Theme.of(context).textTheme.headline5)
                        ])),
                      ],
                    ),
                    Text("Dr. " + consultation.nomDocteur)
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(children: [
              Text(
                consultation.nom.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              Divider(
                color: Colors.white,
              ),
              Image.asset(
                consultation.image,
                width: size.width,
                height: 200,
              )
            ]),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.7,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    color: Colors.blue,
                    //textColor: Colors.white,
                    child: Text(
                      "Demande de rendez-vous",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                    
                      Navigator.pop(context);
                    },
                  )),
            ),
          )
        ],
      ),
      
    );
    
    
  }
  void ans {
      SnackBar sn = SnackBar(
          //backgroundColor: Colors.green,
          content: Text("Votre demande de rendez-vous a été envoyer"));
      Scaffold.of(context).showSnackBar(sn);
    }
  
}*/
