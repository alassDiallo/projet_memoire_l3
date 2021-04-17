import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/formulaires/ajoutStructure.dart';
import 'package:gestion_materiel_cmu/models/Structure.dart';
import 'dart:convert' as convert;

class StructureJica extends StatefulWidget {
  StructureJica({Key key}) : super(key: key);

  @override
  _StructureJicaState createState() => _StructureJicaState();
}

class _StructureJicaState extends State<StructureJica> {
  List<Structure> listeStruc = [];

  List<Structure> structures = [];

  Future<void> getStructure() async {
    String url = "auth/structure";
    var donneejs = await Connexion().recuperation(url);
    print(url);
    print(donneejs.body);
    if (donneejs.statusCode == 200) {
      var donnee = convert.jsonDecode(donneejs.body);
      for (var structure in donnee) {
        setState(() {
          structures.add(Structure(
            nom: structure["nomStructure"],
            telephone: structure["telephoneStructure"],
            region: structure["region"],
            adresse: structure["adresse"],

            // 'referenceFournisseur',
          ));
        });
      }
    }
  }

  @override
  void initState() {
    getStructure();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Structures'),
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
                child: Icon(Icons.home_work),
              ),
              SizedBox(
                height: 20,
              ),
              Text(" Structures ".toUpperCase(),
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
              structures.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      ///scrollDirection: Axis.horizontal,
                      child: Card(
                        // color: Colors.transparent,
                        elevation: 5,
                        shadowColor: Colors.blue,
                        //margin: EdgeInsets.all(10),
                        child: DataTable(
                          //  dividerThickness: true,
                          showBottomBorder: true,
                          columns: [
                            DataColumn(
                              label: Text("nom"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("telephone"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("region"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("adresse"),
                              numeric: true,
                            ),
                          ],
                          rows: structures
                              .map(
                                (structure) => DataRow(cells: [
                                  DataCell(
                                    Text(structure.nom),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text(structure.telephone),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text(structure.region),
                                    onTap: () {
                                      // write your code..
                                    },
                                    // showEditIcon: true,
                                  ),
                                  DataCell(
                                    Text(structure.adresse),
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
                MaterialPageRoute(builder: (context) => AjoutStructure()));
          }),
    );
  }
}
