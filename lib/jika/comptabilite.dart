import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;

import 'package:gestion_materiel_cmu/controllers/Connexion.dart';

class Comptabilite extends StatefulWidget {
  double total, achatMat, anaOrd, consul, depV, depI;

  Comptabilite(
      {this.achatMat,
      this.anaOrd,
      this.consul,
      this.depV,
      this.total,
      this.depI});
  @override
  _ComptabiliteState createState() => _ComptabiliteState();
}

class _ComptabiliteState extends State<Comptabilite> {
  //double depI = 2000.00;

  // Future<void> finance() async {
  //   var url = "auth/finance";
  //   var donnee = await Connexion().recuperation(url);
  //   print(donnee.body);
  //   if (donnee.statusCode == 200) {
  //     var d = convert.jsonDecode(donnee.body);
  //     setState(() {
  //       _achatMat = double.parse(d['achatM'].toString());
  //       _anaOrd = double.parse(d['anaOrd'].toString());
  //       _consul = double.parse(d['cons'].toString());
  //       _depV = double.parse(d['depenseV'].toString());
  //       _total = _achatMat + _anaOrd + _consul + _depV + depI;
  //     });
  //   }
  // }

  @override
  void initState() {
    // finance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Comptabilité"),
      ),
      body: Stack(
        children: [
          Container(
              // height: MediaQuery.of(context).size.height,
              width: double.infinity,
              color: Colors.blue[900],
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Votre Comptabilite finance",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 20),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.total.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Divider(
                      indent: 80,
                      endIndent: 80,
                      color: Colors.white,
                    ),
                    Text(
                      "Fcfa",
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: size.height * 0.25,
                          width: size.width * 0.1,
                          child: Card(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                // children: [
                                //   Icon(Icons.money),
                                //   Text("150000"),
                                //   Text("depense")
                                // ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: size.height * 0.2,
                          width: size.width * 0.1,
                          child: Card(
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                // children: [
                                //   Icon(Icons.money),
                                //   Text("150000"),
                                //   Text("depense")
                                // ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: size.height * 0.15,
                          width: size.width * 0.1,
                          child: Card(
                            color: Colors.brown[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                // children: [
                                //   Icon(Icons.money),
                                //   Text("150000"),
                                //   Text("depense")
                                // ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: size.height * 0.25,
                          width: size.width * 0.1,
                          child: Card(
                            color: Colors.greenAccent[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                // children: [
                                //   Icon(Icons.money),
                                //   Text("150000"),
                                //   Text("depense")
                                // ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: size.height * 0.2,
                          width: size.width * 0.1,
                          child: Card(
                            color: Colors.brown[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                // children: [
                                //   Icon(Icons.money),
                                //   Text("150000"),
                                //   Text("depense")
                                // ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: size.height * 0.15,
                          width: size.width * 0.1,
                          child: Card(
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                // children: [
                                //   Icon(Icons.money),
                                //   Text("150000"),
                                //   Text("depense")
                                // ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Depenses",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {},
                            child: Text("voir tout"),
                            color: Colors.brown[100],
                          )
                        ],
                      ),
                      ListTile(
                        title: Text("Achat de Materiel"),
                        subtitle: Text("structures"),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          radius: 30,
                          backgroundColor: Colors.green,
                        ),
                        trailing: Text(
                          widget.achatMat.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        title: Text("Analyse et Ordonnance"),
                        subtitle: Text("structures"),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.file_copy,
                            color: Colors.white,
                          ),
                          radius: 30,
                          backgroundColor: Colors.deepPurple[900],
                        ),
                        trailing: Text(
                          widget.anaOrd.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        title: Text("Consultation"),
                        subtitle: Text("structures"),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.local_hospital,
                            color: Colors.white,
                          ),
                          radius: 30,
                          backgroundColor: Colors.orange,
                        ),
                        trailing: Text(
                          widget.consul.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        title: Text("Depense Volontaire"),
                        subtitle: Text("volontaire"),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.transfer_within_a_station,
                            color: Colors.white,
                          ),
                          radius: 30,
                          backgroundColor: Colors.greenAccent,
                        ),
                        trailing: Text(
                          widget.depV.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        title: Text("Depense Interne"),
                        subtitle: Text("depense"),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.transform_rounded,
                            color: Colors.white,
                          ),
                          radius: 30,
                          backgroundColor: Colors.redAccent,
                        ),
                        trailing: Text(
                          widget.depI.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
