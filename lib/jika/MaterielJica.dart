import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
// import 'package:gestion_materiel_cmu/controllers/listeMatlyseP.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutFournisseur.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutMateriel.dart';
import 'package:gestion_materiel_cmu/models/Analyse.dart';
import 'package:gestion_materiel_cmu/models/Fournisseur.dart';
import 'package:gestion_materiel_cmu/models/materiel.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_ajoutAnalyse.dart';
import 'dart:convert' as convert;

class MaterielJica extends StatefulWidget {
  MaterielJica({Key key}) : super(key: key);

  @override
  _MaterielJicaState createState() => _MaterielJicaState();
}

class _MaterielJicaState extends State<MaterielJica> {
  List<Materiel> listeMat = [];

  List<Materiel> materiels = [];

  Future<void> getMateriels() async {
    String url = "auth/materiel";
    var donneejs = await Connexion().recuperation(url);
    print(url);
    print(donneejs.body);
    if (donneejs.statusCode == 200) {
      var donnee = convert.jsonDecode(donneejs.body);
      for (var materiel in donnee) {
        setState(() {
          materiels.add(Materiel(
            libelle: materiel["libelle"],
            type: materiel["type"],
            prix: materiel["prix"].toDouble(),

            // 'referenceFournisseur',
          ));
        });
      }
    }
  }

  @override
  void initState() {
    getMateriels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // for (var depense in listeMatlys) {
    //   total += depense.prix;
    // }
    // return total;
    //
    //
    Patient patient = ModalRoute.of(context).settings.arguments;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Materiel'),
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
                child: Icon(Icons.settings),
              ),
              SizedBox(
                height: 20,
              ),
              Text(" Materiel ".toUpperCase(),
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
              materiels.isEmpty
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
                              label: Text("libelle"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("type"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("prix"),
                              numeric: false,
                            ),
                            // DataColumn(
                            //   label: Text("telephone"),
                            //   numeric: true,
                            // ),
                          ],
                          rows: materiels
                              .map(
                                (materiel) => DataRow(cells: [
                                  DataCell(
                                    Text(materiel.libelle),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text(materiel.type),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text("${materiel.prix}"),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  // DataCell(
                                  //   Text(materiels.telephone),
                                  //   onTap: () {
                                  //     // write your code..
                                  //   },
                                  //   // showEditIcon: true,
                                  // ),
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AjoutMateriel()));
          }),
    );
  }
}
