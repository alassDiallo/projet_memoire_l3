import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AjoutStructure extends StatefulWidget {
  @override
  _AjoutStructureState createState() => _AjoutStructureState();
}

class _AjoutStructureState extends State<AjoutStructure> {
  String _nom, _adresse, _region, _telephone;

  final cle = GlobalKey<FormState>();

  void _valider() {
    if (cle.currentState.validate()) {
      cle.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Ajouter une Structure",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                Divider(),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("nom de la Structure"),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "entrer le nom de la structure",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("region"),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField(
                        value: _region,
                        onChanged: (value) {
                          setState(() {
                            _region = value;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "selectionner le region",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        items: [
                          DropdownMenuItem(
                            child: Text("Dakar"),
                            value: "Dakar",
                          ),
                          DropdownMenuItem(
                            child: Text("Thies"),
                            value: "Thies",
                          ),
                          DropdownMenuItem(
                              child: Text("Diourbel"), value: "Diourbel"),
                          DropdownMenuItem(
                              child: Text("Kaolack"), value: "Kaolack"),
                          DropdownMenuItem(
                              child: Text("Fatick"), value: "Fatick"),
                          DropdownMenuItem(
                            child: Text("Kolda"),
                            value: "Kolda",
                          ),
                          DropdownMenuItem(
                            child: Text("Sedhiou"),
                            value: "Sedhiou",
                          ),
                          DropdownMenuItem(
                              child: Text("Matam"), value: "Matam"),
                          DropdownMenuItem(
                              child: Text("Saint-Louis"), value: "Saint-Louis"),
                          DropdownMenuItem(
                              child: Text("Kedougou"), value: "Kedougou"),
                          DropdownMenuItem(
                            child: Text("Ziguinchor"),
                            value: "Zinguichor",
                          ),
                          DropdownMenuItem(
                            child: Text("Kaffrine"),
                            value: "Thies",
                          ),
                          DropdownMenuItem(
                              child: Text("Tambacounda"), value: "Tambacounda"),
                          DropdownMenuItem(
                              child: Text("Louga"), value: "Louga"),
                        ]),
                    /*TextFormField(
                      decoration: InputDecoration(
                          hintText: "choisir la region",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),*/
                    SizedBox(
                      height: 10,
                    ),
                    Text("adresse"),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "entrer l'adresse",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("telephone"),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLength: 9,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "entrer le numero de telephone",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      child: Text("enregistrer"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      minWidth: MediaQuery.of(context).size.width,
                    )
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
