import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutStructure.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutVolontaire.dart';
import 'package:gestion_materiel_cmu/models/Structure.dart';
import 'dart:convert' as convert;

import 'package:gestion_materiel_cmu/models/volontaire.dart';

class VolontaireJica extends StatefulWidget {
  VolontaireJica({Key key}) : super(key: key);

  @override
  _VolontaireJicaState createState() => _VolontaireJicaState();
}

class _VolontaireJicaState extends State<VolontaireJica> {
  List<Volontaire> listeVolont = [];

  List<Volontaire> volontaires = [];

  Future<void> getVolontaire() async {
    String url = "auth/volontaire";
    var donneejs = await Connexion().recuperation(url);
    print(url);
    print(donneejs.body);
    if (donneejs.statusCode == 200) {
      var donnee = convert.jsonDecode(donneejs.body);
      for (var volontaire in donnee) {
        setState(() {
          volontaires.add(Volontaire(
            nom: volontaire["nom"],
            prenom: volontaire["prenom"],
            lieuDeNaissance: volontaire["lieuDeNaissance"],
            // dateDeNaissance: volontaire["dateDeNaissance"],
            email: volontaire["email"],
            numeroCIN: volontaire["numeroCIN"],
            telephone: volontaire["telephone"],
            adresse: volontaire["adresse"],

            // 'referenceFournisseur',
          ));
        });
      }
    }
  }

  @override
  void initState() {
    getVolontaire();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Volontaire'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 35,
                child: Icon(Icons.person_add_outlined),
              ),
              SizedBox(
                height: 20,
              ),
              Text(" Volontaire ".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontStyle: FontStyle.italic)),
              SizedBox(
                height: 10,
              ),

              Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
              ),
              volontaires.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Card(
                        // color: Colors.transparent,
                        elevation: 5,
                        shadowColor: Colors.blue,
                        margin: EdgeInsets.all(10),
                        child: DataTable(
                          //  dividerThickness: true,
                          showBottomBorder: true,
                          columns: [
                            DataColumn(
                              label: Text("nom"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("prenom"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("email"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("NumeroCNI"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("telephone"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("adresse"),
                              numeric: true,
                            ),
                          ],
                          rows: volontaires
                              .map(
                                (volontaire) => DataRow(cells: [
                                  DataCell(
                                    Text(volontaire.nom),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text(volontaire.prenom),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text(volontaire.email),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text(volontaire.numeroCIN),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text(volontaire.telephone),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text(volontaire.adresse),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                ]),
                              )
                              .toList(),
                        ),
                      ),
                    ),

              // Divider(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.library_add_sharp,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AjoutVolontaireFormulaire()));
          }),
    );
  }
}
