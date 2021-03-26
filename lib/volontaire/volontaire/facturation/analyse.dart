import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/ListeAnalyseP.dart';
import 'package:gestion_materiel_cmu/models/Analyse.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_ajoutAnalyse.dart';

class Analyse extends StatefulWidget {
  Analyse({Key key}) : super(key: key);

  @override
  _AnalyseState createState() => _AnalyseState();
}

class _AnalyseState extends State<Analyse> {
  double total;
  List<AnalyseM> listeAnalys = [];
  AnalyselistP ana = AnalyselistP();

  @override
  void initState() {
    super.initState();
    listeAnalys = ana.analyses;
    for (var analyse in listeAnalys) {
      total = total + analyse.prix;
    }
  }

  @override
  Widget build(BuildContext context) {
    // for (var depense in listeAnalys) {
    //   total += depense.prix;
    // }
    // return total;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Analyse'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          // //height: size.height,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("images/accueil.jpg"),
          //     fit: BoxFit.,
          //   ),
          // ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                //height: size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/accueil.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
              ),
              Card(
                // color: Colors.transparent,
                elevation: 7,
                shadowColor: Colors.blue,
                margin: EdgeInsets.all(15),
                child: DataTable(
                  // dividerThickness: true,
                  showBottomBorder: true,
                  columns: [
                    DataColumn(
                      label: Text("Description"),
                      numeric: false,
                    ),
                    DataColumn(
                      label: Text("Cout"),
                      numeric: true,
                    ),
                  ],
                  rows: listeAnalys
                      .map(
                        (analyse) => DataRow(cells: [
                          DataCell(
                            Text(analyse.libelle),
                            onTap: () {
                              // write your code..
                            },
                            // showEditIcon: true,
                          ),
                          DataCell(
                            Text(analyse.prix.toString()),
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
              // Divider(),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.monetization_on_outlined),
                      labelText: 'Total à payer',
                      hintText: total.toString(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(),
                      )),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.all(10),
              //   child: Column(
              //     children: [
              //       // Icon(Icons.monetization_on_outlined),
              //       Row(
              //         children: [
              //           Text("Total à payer :"),
              //           Column(
              //             children: [
              //               Text(
              //                 total.toString(),
              //               ),
              //               Divider(
              //                 height: 10,
              //                 thickness: 2,
              //                 indent: 10,
              //                 endIndent: 3,
              //               )
              //             ],
              //           )
              //         ],
              //       ),
              //        ],  ),

              // TextField(
              //   readOnly: true,
              //   decoration: InputDecoration(
              //     // prefixIcon: Icon(Icons.monetization_on_outlined),
              //     labelText: 'Total à payer',
              //     hintText: total.toString(),
              //     contentPadding: EdgeInsets.only(left: 12),
              //     // border: OutlineInputBorder(
              //     //   //   // borderRadius: BorderRadius.horizontal(),
              //     //   borderSide: BorderSide(),
              //     // )
              //   ),
              // ),  ),

              Container(
                width: MediaQuery.of(context).size.width - 80,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    primary: Colors.blueAccent,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('  Valider  '),
                ),
                // RaisedButton(
                //   child: Text('Valider'),
                //   onPressed: () {},
                //   color: Colors.blueAccent,
                //   textColor: Colors.white,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                //   splashColor: Colors.grey,
                // ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.library_add_sharp),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AjoutAnalyse()));
          }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
    );
  }
}
