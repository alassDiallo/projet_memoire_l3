import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/materiel.dart';
import 'package:gestion_materiel_cmu/pdfService/pdf_saveOpen.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_rapport_maintennance.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'package:pdf/widgets.dart' as pd;

class Rapport_Maintenance extends StatefulWidget {
  Rapport_Maintenance({Key key}) : super(key: key);

  @override
  _Rapport_MaintenanceState createState() => _Rapport_MaintenanceState();
}

class _Rapport_MaintenanceState extends State<Rapport_Maintenance> {
  final _formKey = GlobalKey<FormState>();
  // final image = pd.MemoryImage(
  //   File('images/jica.png').readAsBytesSync(),
  // );
  // final Widget svg =
  //     SvgPicture.asset('images/jica.svg', semanticsLabel: 'Acme Logo');
  String _description, _materiel;
  DateFormat df = DateFormat("dd/MM/yyyy");
  List<Materiel> _materiels = [];
  List<Materiel> listeMat = [];
  Future<void> getMateriels() async {
    var url = "auth/materielsVolontaire";
    var donnee = await Connexion().recuperation(url);
    if (donnee.statusCode == 200) {
      print(donnee.body);
      var materielV = convert.jsonDecode(donnee.body);
      for (var matV in materielV) {
        setState(() {
          _materiels.add(Materiel(
              libelle: matV["libelle"],
              type: matV["type"],
              reference: matV["reference"],
              idMateriel: matV["idMateriel"]));
        });
      }
      print(_materiels.length);
      // print(mat());

    }
  }

  @override
  void initState() {
    getMateriels();
    super.initState();
  }

  void selctionner(bool b, Materiel element) async {
    if (b) {
      setState(() {
        b = true;
        listeMat.add(element);
      });
    } else {
      listeMat.remove(element);
    }
    print(mat());
    print(listeMat.length);
  }

  String mat() {
    String mate = "";
    for (var mat in listeMat) {
      mate += " \n   " + mat.type + " - " + mat.libelle;
    }
    return mate;
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // final pdffile =
      generate();
      generate() != null
          ? showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Colors.white.withOpacity(0.8),
                      // title: Text("Rapport generer"),
                      content: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        child: Center(
                          child: Column(
                            children: [
                              CircleAvatar(
                                child: Icon(
                                  Icons.check_circle,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                radius: 40,
                                backgroundColor: Colors.greenAccent,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Rapport génèrè ",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            // Navigator.pop(context);
                            PdfSaveOpen.openFile("Rapport Maintenance1.pdf");
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            primary: Colors.blueAccent,
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('  Voir  '),
                        ),
                        ElevatedButton(
                          onPressed: () => launch(
                              "mailto:ndiageeks@gmail.com?subject=Rapport&body=How are you%20plugin"),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            primary: Colors.greenAccent,
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('  Envoyer Mail  '),
                        ),
                      ]))
          : showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.white.withOpacity(0.8),
                  content: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Center(
                          child: Column(children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              child: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  size: 18,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            )),
                        CircleAvatar(
                          child: Icon(
                            Icons.error,
                            size: 30,
                            color: Colors.white,
                          ),
                          radius: 40,
                          backgroundColor: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Fichier no generer ",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ])))));

      // PdfSaveOpen.openFile(
      //     'Rapport Maintennance ${df.format(DateTime.now())}.pdf');
    }
  }

  //  Future<File>
  Future generate() async {
    final pdf = pd.Document();

    pdf.addPage(pd.MultiPage(
      margin: pd.EdgeInsets.all(40),
      header: (pd.Context context) {
        // if (context.pageNumber == 1) {
        //   return null;
        // }
        return pd.Container(
            // alignment: pd.Alignment.centerRight,
            margin: const pd.EdgeInsets.only(bottom: 4.0 * PdfPageFormat.mm),
            padding: const pd.EdgeInsets.only(bottom: 4.0 * PdfPageFormat.mm),
            // decoration: const pd.BoxDecoration(
            //     border:
            //        pd.BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: pd.Row(
                mainAxisAlignment: pd.MainAxisAlignment.spaceBetween,
                children: <pd.Widget>[
                  pd.Column(
                      mainAxisAlignment: pd.MainAxisAlignment.start,
                      children: [
                        // pd.Image(
                        //   width: 32,
                        //   height: 32,
                        //   image: Svg('images/jica.svg'),
                        // )
                        // pd.svg,
                        // // pd.Image(image),
                        // pd.SvgImage(
                        //   svg: 'images/jica.svg',
                        // ),

                        pd.Text('Bassirou Dabo'),
                        pd.Text('Structure De Diourbel'),
                      ]),
                  pd.Column(
                      mainAxisAlignment: pd.MainAxisAlignment.start,
                      children: [
                        pd.PdfLogo(),
                        pd.Text(
                          df.format(DateTime.now()),
                        ),
                      ])
                ]));
      },
      footer: (pd.Context context) {
        return pd.Container(
            // alignment: pd.Alignment.centerRight,
            margin: const pd.EdgeInsets.only(top: 2.0 * PdfPageFormat.cm),
            child: pd.Row(
                mainAxisAlignment: pd.MainAxisAlignment.spaceBetween,
                children: <pd.Widget>[
                  pd.Divider(),
                  pd.Text('Rapport de maintenance',
                      // textScaleFactor: 2,
                      style: pd.Theme.of(context)
                          .defaultTextStyle
                          .copyWith(color: PdfColors.grey)),
                  pd.Text(
                      'Page ${context.pageNumber} sur ${context.pagesCount}',
                      style: pd.Theme.of(context)
                          .defaultTextStyle
                          .copyWith(color: PdfColors.grey))
                ]));
        // );
      },
      build: (pd.Context context) => [
        pd.Header(
            level: 0,
            child: pd.Row(
                mainAxisAlignment: pd.MainAxisAlignment.center,
                children: <pd.Widget>[
                  pd.Text('Rapport', textScaleFactor: 2),
                  // pd.PdfLogo()
                ])),

        pd.Header(level: 1, text: 'Materiels concernés'),
        // pd.Paragraph(text: '${mat()} '),
        pd.Padding(padding: const pd.EdgeInsets.all(10)),
        pd.Table.fromTextArray(
          context: context,
          data: <List<String>>[
            <String>['Type - Libellé'],
            <String>['${mat()} '],
          ],
        ),
        pd.Padding(padding: const pd.EdgeInsets.all(10)),

        pd.Header(level: 1, text: 'Description des problemes '),

        pd.Paragraph(text: '${_description}.'),
        // pd.Padding(padding: const pd.EdgeInsets.all(10)),
        // pd.Table.fromTextArray(context: context, data: const <List<String>>[
        //   <String>['Year', 'Ipsum', 'Lorem'],
        //   <String>['2000', 'Ipsum 1.0', 'Lorem 1'],
        //   <String>['2001', 'Ipsum 1.1', 'Lorem 2'],
        //   <String>['2002', 'Ipsum 1.2', 'Lorem 3'],
        // ])
      ],
      // footer: (context) => buildFooter(invoice),
    ));

    // return
    PdfSaveOpen.saveDoc(name: "Rapport Maintenance1.pdf", pdf: pdf);
    //  ${df.format(DateTime.now())}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: ElevatedButton(
            onPressed: () {
              listeMat.isEmpty
                  ? showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                            //elevation: 3,
                            // shape:BorderRadius.circular(10)
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: Colors.white.withOpacity(0.8),
                            // title: Text(
                            //     "Il n'y pas de patient pour ce reference"),
                            content: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Center(
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: CircleAvatar(
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.close,
                                              size: 18,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        )),
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.error,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      radius: 40,
                                      backgroundColor: Colors.red,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Selectionner d'abord ",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "le ou les materiels concerné(s) ",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                  : showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                            //elevation: 3,
                            // shape:BorderRadius.circular(10)
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.white.withOpacity(0.8),

                            content: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                width: MediaQuery.of(context).size.width,
                                // padding: EdgeInsets.only(top: 50),
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                  Icons
                                                      .miscellaneous_services_outlined,
                                                  size: 30),
                                              Icon(Icons.build, size: 30),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.center,
                                                // crossAxisAlignment:
                                                //     CrossAxisAlignment.center,
                                                children: [
                                                  Text("Materiels concernés :"),
                                                  Card(
                                                      // margin: EdgeInsets.all(10),
                                                      elevation: 3,
                                                      color: Colors.grey,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child:
                                                            Text(" " + mat()),
                                                      )

                                                      // Text(materiel.libelle),
                                                      ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: TextFormField(
                                                  maxLength: 500,
                                                  maxLines: 20,
                                                  minLines: 2,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Description du probleme',
                                                    hintText: 'Entrer du texte',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      borderSide: BorderSide(),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return "le champs est obligatoire";
                                                    } else {
                                                      if (value.length < 10) {
                                                        return "doit comporter au moins 10 caractere";
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                )),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  primary: Colors.redAccent,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text('  Annuler  '),
                              ),
                              // Spacer(
                              //   flex: 2,
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  primary: Colors.greenAccent,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text('  Valider  '),
                              ),
                            ],
                          ));
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              primary: Colors.blue[900],
              textStyle: TextStyle(
                color: Colors.white,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.send),
                Text('  Valider  '),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Rapport'),
        centerTitle: true,
        // actions: [Text("SELECTIONNER")],
      ),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 0.0),
                    colors: [Colors.blue[900], Colors.blue[400]])),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: Icon(
                  Icons.miscellaneous_services_outlined,
                  size: 50,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(" Mes Matériels".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontStyle: FontStyle.italic)),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   width: double.infinity,

              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("images/accueil.jpg"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
              ),
              _materiels.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ))
                  : Container(
                      width: double.infinity,
                      child: Card(
                        // color: Colors.transparent,
                        elevation: 7,
                        shadowColor: Colors.blue,
                        margin: EdgeInsets.all(15),
                        child: DataTable(
                          // dividerThickness: true,
                          showBottomBorder: true,
                          columns: [
                            DataColumn(
                              label: Text("Type"),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text("libelle"),
                              numeric: false,
                            ),
                          ],
                          rows: _materiels
                              .map(
                                (materiel) => DataRow(
                                    selected: listeMat.contains(materiel),
                                    onSelectChanged: (b) {
                                      selctionner(b, materiel);
                                    },
                                    cells: [
                                      DataCell(
                                        Text(materiel.type),
                                        onTap: () {
                                          // write your code..
                                        },
                                        // showEditIcon: true,
                                      ),
                                      DataCell(
                                        Text(materiel.libelle),
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
                height: 50,
              ),
            ])),
      ),
    );
  }
}

//
/*

Container(
          width: MediaQuery.of(context).size.width - 80,
          child: ElevatedButton(
            onPressed: () {
              listeMat.isEmpty
                  ? showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                            //elevation: 3,
                            // shape:BorderRadius.circular(10)
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: Colors.white.withOpacity(0.8),
                            // title: Text(
                            //     "Il n'y pas de patient pour ce reference"),
                            content: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: CircleAvatar(
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            size: 18,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      )),
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.error,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    radius: 40,
                                    backgroundColor: Colors.red,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Selectionner d'abord ",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "le ou les materiels concerné(s) ",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                  : showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                            //elevation: 3,
                            // shape:BorderRadius.circular(10)
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.white.withOpacity(0.8),

                            content: Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width,
                              child:
                                  // Column(
                                  //   children: [
                                  Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: TextFormField(
                                        //maxLength: 25,
                                        readOnly: true,
                                        initialValue: mat(),
                                        //  _materiel,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        decoration: InputDecoration(
                                            labelText: 'Type de materiel',
                                            hintText: 'Entrer du texte',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              borderSide: BorderSide(),
                                            )),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: TextFormField(
                                        maxLength: 500,
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          labelText: 'Description du probleme',
                                          hintText: 'Entrer du texte',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            borderSide: BorderSide(),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "le champs est obligatoire";
                                          } else {
                                            if (value.length < 10) {
                                              return "doit comporter au moins 10 caractere";
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  primary: Colors.redAccent,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text('  Annuler  '),
                              ),
                              // Spacer(
                              //   flex: 2,
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  primary: Colors.greenAccent,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text('  Envoyer  '),
                              ),
                            ],
                          ));
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              primary: Colors.blueAccent,
              textStyle: TextStyle(
                color: Colors.white,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text('  Valider  '),
          ),
        ),
*/
