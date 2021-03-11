import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/Structure.dart';
import 'package:gestion_materiel_cmu/models/materiel.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';

class AjoutVolontaireFormulaire extends StatefulWidget {
  @override
  _AjoutVolontaireFormulaireState createState() =>
      _AjoutVolontaireFormulaireState();
}

class _AjoutVolontaireFormulaireState extends State<AjoutVolontaireFormulaire> {
  var cle = GlobalKey<FormState>();
  List<Structure> _structures = [];
  List<Materiel> _materiels = [];
  Future<void> _getStrMat() async {
    var url1 = Connexion.url + "materiel";
    var url2 = Connexion.url + "structure";
    var donnee = await http.get(url1);
    var donnee2 = await http.get(url2);
    if (donnee.statusCode == 200) {
      var st = convert.jsonDecode(donnee.body);
      for (var str in st) {
        _materiels.add(Materiel(
            libelle: str["libelle"],
            idMateriel: str["idMateriel"],
            reference: str["reference"]));
      }
    }
    if (donnee2.statusCode == 200) {
      var st = convert.jsonDecode(donnee2.body);
      for (var str in st) {
        _structures.add(Structure(
            nom: str["nomStructure"], idStructure: str["idStructure"]));
      }
    }
    print(_structures.length);
    print(_materiels.length);
  }

  String _nom;
  String _prenom;
  String _lieuDeNaissance;
  DateTime _dateDeNaissance;
  String _adresse;
  String _numeroCIN;
  String _telephone;
  String _email;
  String _sexe;
  int _materiel, _structure;

  int _currenteEtape = 0;

  Future<void> _enregistrer() async {
    if (cle.currentState.validate()) {
      cle.currentState.save();
      Map<String, dynamic> volontaire = {
        "nom": _nom,
        "prenom": _prenom,
        "dateDeNaissance": _dateDeNaissance.toString(),
        "lieuDeNaissance": _lieuDeNaissance,
        "adresse": _adresse,
        "telephone": _telephone,
        "email": _email,
        "sexe": _sexe,
        "cin": _numeroCIN,
        "structure": _structure.toString(),
        "materiel": _materiel.toString()
      };
      print(volontaire);
      var url = Connexion.url + "volontaire";
      var donnee = await http.post(Uri.encodeFull(url), body: volontaire);
      if (donnee.statusCode == 200) {
        print(donnee.body);
        cle.currentState.reset();
        reussite();
      }
    }
  }

  List<DropdownMenuItem> listeS() {
    List<DropdownMenuItem> l = [];
    for (Structure st in _structures) {
      l.add(DropdownMenuItem(
        child: Text(st.nom),
        value: st.idStructure,
      ));
    }
    return l;
  }

  List<DropdownMenuItem> listeM() {
    List<DropdownMenuItem> l = [];
    for (Materiel st in _materiels) {
      l.add(DropdownMenuItem(
        child: Text('${st.libelle}-${st.reference}'),
        value: st.idMateriel,
      ));
    }
    return l;
  }

  @override
  void initState() {
    _getStrMat();
    super.initState();
  }

  final format = DateFormat("MM-dd-yyyy");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Ajouter un volontaire",
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Ajouter un volontaire",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  Form(
                      key: cle,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            onChanged: (String nom) {
                              setState(() {
                                _nom = nom;
                              });
                            },
                            onSaved: (String nom) {
                              setState(() {
                                _nom = nom;
                              });
                            },
                            autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "veuillez remplir le champs";
                              } else if (value.length < 2) {
                                return "le nom doit avoir aumoins 2 caractére";
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 18),
                              hintStyle: TextStyle(fontSize: 12),
                              labelText: "nom volontaire",
                              labelStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: "saisir le nom du volontaire",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _prenom = value;
                              });
                            },
                            onSaved: (value) {
                              _prenom = value;
                            },
                            autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "veuillez renseigner le champs";
                              } else {
                                if (value.length < 2) {
                                  return "le prenom doit comporter aumoins 2 caractere";
                                }
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "prenom volontaire",
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "saiasir le prenom du volontaire"),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          DateTimeField(
                            validator: (value) {
                              if (value == null) {
                                return "veuillez choisir la date de naissance";
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                _dateDeNaissance = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                _dateDeNaissance = value;
                              });
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                hintStyle: TextStyle(fontSize: 12),
                                labelText: "date de naissance du volontaire",
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "choisir la date de naisssance",
                                suffixIcon: Icon(Icons.date_range),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            format: format,
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now().subtract(
                                      Duration(seconds: 3600 * 24 * 365 * 60)),
                                  initialDate: DateTime.now().subtract(
                                      Duration(seconds: 3600 * 24 * 365 * 18)),
                                  lastDate: DateTime.now().subtract(
                                      Duration(seconds: 3600 * 24 * 365 * 18)));
                            },
                          ),
                          // DateTimeFormField(
                          //   initialValue: DateTime.now(),
                          //   formatter: format,
                          //   label: "date de naissance",
                          //   validator: (DateTime dateTime) {
                          //     if (dateTime == null) {
                          //       return "Date Time Required";
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (DateTime dateTime) =>
                          //       _dateDeNaissance = dateTime,
                          // ),
                          // TextFormField(
                          //   onChanged: (value) {
                          //     setState(() {
                          //       _dateDeNaissance = DateTime.parse(value);
                          //     });
                          //   },
                          //   decoration: InputDecoration(
                          //       border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(30)),
                          //       labelText: "choisissez la date de naissance"),
                          //   onTap: _dateD,
                          // ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _lieuDeNaissance = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                _lieuDeNaissance = value;
                              });
                            },
                            autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "veullez renseigner le champs";
                              } else {
                                if (value.length < 2) {
                                  return "le lieu de naissance doit avoir aumoins 2 caractere";
                                }
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "lieu de naissance du volontaire",
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText:
                                    "saiasir le lieu de naissance du volontaire"),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          DropdownButtonFormField(
                              onSaved: (value) {
                                setState(() {
                                  _sexe = value;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "veullez renseigner le champs";
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Sexe",
                                hintText: "choisir le sexe",
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _sexe = value;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  child: Text("homme"),
                                  value: "homme",
                                ),
                                DropdownMenuItem(
                                  child: Text("femme"),
                                  value: "femme",
                                )
                              ]),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              setState(() {
                                _adresse = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                _adresse = value;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "veullez renseigner le champs";
                              } else {
                                if (value.length < 2) {
                                  return "l'adresse doit avoir aumoins 2 caractere";
                                }
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Adresse du volontaire",
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "saiasir l'adresse du volontaire"),
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _telephone = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                _telephone = value;
                              });
                            },
                            autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "veullez renseigner le champs";
                              } else {
                                if (value.length < 9) {
                                  return "le telephone comporte 9 chiffre";
                                }
                              }
                            },
                            maxLength: 9,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                hintStyle: TextStyle(fontSize: 12),
                                labelText: "telephone du volontaire",
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "saiasir le telephone du volontaire"),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _numeroCIN = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                _numeroCIN = value;
                              });
                            },
                            autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "veullez renseigner le champs";
                              } else {
                                if (value.length < 9) {
                                  return "le numero de CIN/Passe-Port doit contenir aumoins 9 caracteres";
                                }
                              }
                            },
                            keyboardType: TextInputType.text,
                            maxLength: 12,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText:
                                    "numero CIN/Passe-Port du volontaire",
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText:
                                    "saiasir le numero de CIN/passe-Port du volontaire"),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                            autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "veullez renseigner le champs";
                              } else {
                                if (value.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Entrer une adresse email valide';
                                }
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                hintStyle: TextStyle(fontSize: 12),
                                labelText: "email du volontaire",
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "saiasir le email du volontaire"),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          DropdownButtonFormField(
                              onSaved: (value) {
                                setState(() {
                                  _structure = value;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "veuillez choisir une structure";
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "choisir la structure",
                                labelText: "Structure",
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _structure = value;
                                });
                              },
                              items: _structures.isNotEmpty ? listeS() : null
                              // [
                              //   DropdownMenuItem(
                              //     child: Text("structure de dakar"),
                              //     value: 5,
                              //   ),
                              //   DropdownMenuItem(
                              //     child: Text("structure de thies"),
                              //     value: 2,
                              //   ),
                              //   DropdownMenuItem(
                              //     child: Text("structure de Matam"),
                              //     value: 3,
                              //   ),
                              //   DropdownMenuItem(
                              //     child: Text("structure de Louga"),
                              //     value: 4,
                              //   ),
                              // ]
                              ),
                          SizedBox(
                            height: 30,
                          ),
                          DropdownButtonFormField(
                              onSaved: (value) {
                                setState(() {
                                  _materiel = value;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "veillez choisir un materiel";
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "choisir le materiel",
                                labelText: "Materiel",
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _materiel = value;
                                });
                              },
                              items: _materiels.isNotEmpty ? listeM() : null
                              // [
                              //   DropdownMenuItem(
                              //     child: Text("ordinateur-0000"),
                              //     value: 1,
                              //   ),
                              //   DropdownMenuItem(
                              //     child: Text("ordinateur-0001"),
                              //     value: 2,
                              //   ),
                              //   DropdownMenuItem(
                              //     child: Text("ordinateur-0002"),
                              //     value: 3,
                              //   ),
                              //   DropdownMenuItem(
                              //     child: Text("ordinateur-0003"),
                              //     value: 4,
                              //   ),
                              //   DropdownMenuItem(
                              //     child: Text("ordinateur-0004"),
                              //     value: 5,
                              //   ),
                              // ]
                              ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                  FlatButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    textColor: Colors.white,
                    onPressed: _enregistrer,
                    child: Text("enregistrer"),
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  // void continuer() {
  //   _currenteEtape < 3
  //       ? setState(() {
  //           _currenteEtape += 1;
  //         })
  //       : null;
  // }

  Future<Null> _dateD() async {
    print(DateTime.now().year - 20);
    DateTime dt = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        currentDate: DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime.now());
    if (dt != null) {
      setState(() {
        _dateDeNaissance = dt;
      });
    }
  }

  Future reussite() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: Icon(
                      Icons.check,
                      size: 50,
                    ),
                    backgroundColor: Colors.greenAccent,
                  ),
                  Text("Enregistrement du volontaire reussi"),
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Terminer"),
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 40,
                      ))
                ],
              ),
            ),
          );
        });
  }

//   Widget etape() {
//     return Stepper(
//         currentStep: _currenteEtape,
//         type: StepperType.horizontal,
//         onStepTapped: (int i) {
//           setState(() {
//             _currenteEtape = i;
//           });
//         },
//         onStepContinue: continuer,
//         onStepCancel: () {
//           _currenteEtape > 0
//               ? setState(() {
//                   _currenteEtape -= 1;
//                 })
//               : null;
//         },
//         steps: etapes);
//   }

//   List<Step> etapes = [
//     Step(content: Text("civilité"), title: Text("civilite")),
//     Step(
//         title: Text("Indentification et localisation"),
//         content: Text("localisation")),
//     Step(
//         title: Text("Affectation et attribution"),
//         content: Text("affectation et attribution"))
//   ];
}
