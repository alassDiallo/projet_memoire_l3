import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
// import 'package:gestion_materiel_cmu/controllers/listeFournilyseP.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutFournisseur.dart';
import 'package:gestion_materiel_cmu/models/Analyse.dart';
import 'package:gestion_materiel_cmu/models/Fournisseur.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_ajoutAnalyse.dart';
import 'dart:convert' as convert;

class FournisseurJica extends StatefulWidget {
  FournisseurJica({Key key}) : super(key: key);

  @override
  _FournisseurJicaState createState() => _FournisseurJicaState();
}

class _FournisseurJicaState extends State<FournisseurJica> {
  List<Fournisseur> listeFourni = [];

  List<Fournisseur> fournisseurs = [];

  Future<void> getFournisseur() async {
    String url = "auth/fournisseur";
    var donneejs = await Connexion().recuperation(url);
    print(url);
    print(donneejs.body);
    if (donneejs.statusCode == 200) {
      var donnee = convert.jsonDecode(donneejs.body);
      for (var fournisseur in donnee) {
        setState(() {
          fournisseurs.add(Fournisseur(
              nom: fournisseur["nom"],
              adresse: fournisseur["adresse"],
              telephone: fournisseur["telephone"],
              email: fournisseur["email"]

              // idPatient: analyse["idPatient"],
              // 'referenceFournisseur','nom','telephone','email','adresse

              ));
        });
      }
    }
  }

  @override
  void initState() {
    getFournisseur();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // for (var depense in listeFournilys) {
    //   total += depense.prix;
    // }
    // return total;
    //
    //
    Patient patient = ModalRoute.of(context).settings.arguments;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Fournisseur'),
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
                child: Icon(Icons.transfer_within_a_station),
              ),
              SizedBox(
                height: 20,
              ),
              Text(" Fournisseur ".toUpperCase(),
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
              fournisseurs.isEmpty
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
                              label: Text("adresse"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("email"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("telephone"),
                              numeric: true,
                            ),
                          ],
                          rows: fournisseurs
                              .map(
                                (fournisseur) => DataRow(cells: [
                                  DataCell(
                                    Text(fournisseur.nom),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text(fournisseur.adresse),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text(fournisseur.email),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text(fournisseur.telephone),
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AjoutFournisseur()));
          }),
    );
  }
}
