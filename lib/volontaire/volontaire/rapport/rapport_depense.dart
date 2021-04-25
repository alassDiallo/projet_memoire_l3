import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'dart:convert' as convert;
import 'package:gestion_materiel_cmu/models/depense.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_ajoutDepense.dart';
import 'package:intl/intl.dart';

class Rapport_Depense extends StatefulWidget {
  @override
  _Rapport_DepenseState createState() => _Rapport_DepenseState();
}

class _Rapport_DepenseState extends State<Rapport_Depense> {
  List<Depense> depenses = [];
  List<Depense> listeDep = [];
  double somme = 0;
  DateFormat df = DateFormat("dd/MM/yyyy");
  final _formKey = GlobalKey<FormState>();
  String _description;
  double _cout;
  // List<Depense> depenses = [];
  Future<void> getDepense() async {
    String url = "auth/depenseVolontaire";
    var donneejs = await Connexion().recuperation(url);
    // String url = Connexion.url + "depenses";
    // var donneejs = await http.get(url);
    print(url);
    print(donneejs.body);
    if (donneejs.statusCode == 200) {
      var donnee = convert.jsonDecode(donneejs.body);
      for (var depense in donnee) {
        setState(() {
          depenses.add(Depense(
            description: depense["description"],
            cout: depense["cout"].toDouble(),
          ));
          somme += depense["cout"].toDouble();
        });
      }
    }
    print(somme);
  }

  @override
  void initState() {
    getDepense();
    super.initState();
  }

  void selctionner(bool b, Depense element) async {
    if (b) {
      setState(() {
        b = true;
        listeDep.add(element);
      });
    } else {
      listeDep.remove(element);
    }
  }

  void supprimer() async {
    setState(() {
      if (listeDep.isNotEmpty) {
        List<Depense> tmp = [];
        tmp.addAll(listeDep);
        for (Depense dep in tmp) {
          depenses.remove(dep);
          listeDep.remove(dep);
        }
      }
    });
  }

  // final listeDepense = Depenselist().depenses;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Dépense'),
        centerTitle: true,
        // actions: [Text("SELECTIONNER")],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  image: DecorationImage(
                      image: AssetImage("images/comptabilite.png"))),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Colors.blue[900].withOpacity(0.6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          somme.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Divider(
                          color: Colors.white,
                          indent: 150,
                          endIndent: 150,
                          thickness: 5,
                        ),
                        Text(
                          "Franc CFA",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          Text(
                            df.format(DateTime.now()),
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                margin: EdgeInsets.all(20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Description',
                            prefixIcon: Icon(Icons.description_rounded),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "le champs est obligatoire";
                            } else {
                              if (value.length < 3) {
                                return "Ce champs doit comporter au moins 3 caractere";
                              }
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              _description = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              _description = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Cout',
                            prefixIcon: Icon(Icons.attach_money_sharp),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "le champs est obligatoire";
                            } else {
                              var n = num.tryParse(value);
                              if (n == null) {
                                return "veuillez entrez un nombre valide";
                              } else if (double.parse(value) < 1)
                                return "veuillez saisir une valeur positive";
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              _cout = double.parse(value);
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              _cout = double.parse(value);
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 50,
                              child: ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  primary: Colors.blue,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text('  Enregistrer  '),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // child: ListView.builder(
              //     itemCount: 4,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         // padding: EdgeInsets.all(),
              margin: EdgeInsets.all(15),
              child: ExpansionTile(
                leading: Icon(Icons.list),
                title: Text(
                  "Historique ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // Rapport_DepenseDepense.map((e) => Text(e['description']),).toList(),

                // Text('Details'),

                children: [
                  // Text(
                  //   'Dépense',
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  // ),
                  Column(
                    children: [
                      depenses.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : DataTable(
                              // dividerThickness: true,
                              //showBottomBorder: true,
                              columns: [
                                DataColumn(
                                  label: Text("Description"),
                                ),
                                DataColumn(
                                  label: Text("Cout"),
                                ),
                                // DataColumn(
                                //   label: Text("date"),
                                //   numeric: false,
                                // ),
                              ],
                              rows: depenses
                                  .map(
                                    (Depense depense) => DataRow(
                                        selected: listeDep.contains(depense),
                                        onSelectChanged: (b) {
                                          selctionner(b, depense);
                                        },
                                        cells: [
                                          DataCell(
                                            Text(depense.description),
                                          ),
                                          DataCell(
                                            Text(depense.cout.toString()),
                                          ),
                                        ]),
                                  )
                                  .toList(),
                            ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                              label: listeDep.length == 0
                                  ? Text(
                                      "0 Selectionné(es)",
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                    )
                                  : Text("${listeDep.length} Selectionné(es)"),
                            ),
                          ),
                          SizedBox(width: 5),
                          Padding(
                              padding: EdgeInsets.all(5),
                              child: OutlinedButton.icon(
                                onPressed: listeDep.isEmpty ? null : supprimer,
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                ),
                                label: Text("Supprimer"),
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Scaffold.of(context)
      //     .showSnackBar(SnackBar(content: Text('Traitement en cours')));
      var url = "auth/depense";
      print(url);
      Map<String, dynamic> depense = {
        "description": _description,
        "cout": _cout.toString(),
      };
      print(depense);
      var donnee = await Connexion().envoideDonnnee(depense, url);
      print(donnee.body);
      CircularProgressIndicator();
      if (donnee.statusCode == 200) {
        var d = convert.jsonDecode(donnee.body);
        if (d['success'] != null) {
          setState(() {
            somme += _cout;
            depenses.add(Depense(cout: _cout, description: _description));
          });

          _formKey.currentState.reset();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(d['success']),
            backgroundColor: Colors.greenAccent,
          ));
        }
      }
    }
  }
}
