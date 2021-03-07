import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';

class AjoutVolontaireFormulaire extends StatefulWidget {
  @override
  _AjoutVolontaireFormulaireState createState() =>
      _AjoutVolontaireFormulaireState();
}

class _AjoutVolontaireFormulaireState extends State<AjoutVolontaireFormulaire> {
  var cle = GlobalKey<FormState>();
  String _nom;
  String _prenom;
  String _lieuDeNaissance;
  DateTime _dateDeNaissance;
  String _adresse;
  String _numeroCIN;
  String _telephone;
  String _email;
  String _sexe;

  int _currenteEtape = 0;

  void _enregistrer() {
    if (cle.currentState.validate()) {
      cle.currentState.save();
      print("enregistrement reussi");
    }
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
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
                            validator: (value) {
                              if (value.isEmpty) {
                                return "veuillez remplir le champs";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "saisir le nom du volontaire",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "saisir le nom du volontaire",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "saisir le prenom du volontaire",
                                hintText: "saiasir le prenom du volontaire"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DateTimeField(
                            decoration: InputDecoration(
                                hintText: "choisir la date de naisssance",
                                suffixIcon: Icon(Icons.date_range),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            format: format,
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
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
                          //           borderRadius: BorderRadius.circular(10)),
                          //       labelText: "choisissez la date de naissance"),
                          //   onTap: _dateD,
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText:
                                    "saisir le lieu de naissance du volontaire",
                                hintText:
                                    "saiasir le lieu de naissance du volontaire"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "saisir l'adresse du volontaire",
                                hintText: "saiasir l'adresse du volontaire"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "saisir le telephone du volontaire",
                                hintText: "saiasir le telephone du volontaire"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText:
                                    "saisir le numero d'identification  du volontaire",
                                hintText:
                                    "saiasir le numero d'identification du volontaire"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "saisir le email du volontaire",
                                hintText: "saiasir le email du volontaire"),
                          ),
                          SizedBox(
                            height: 10,
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

  void continuer() {
    _currenteEtape < 3
        ? setState(() {
            _currenteEtape += 1;
          })
        : null;
  }

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

  Widget etape() {
    return Stepper(
        currentStep: _currenteEtape,
        type: StepperType.horizontal,
        onStepTapped: (int i) {
          setState(() {
            _currenteEtape = i;
          });
        },
        onStepContinue: continuer,
        onStepCancel: () {
          _currenteEtape > 0
              ? setState(() {
                  _currenteEtape -= 1;
                })
              : null;
        },
        steps: etapes);
  }

  List<Step> etapes = [
    Step(content: Text("civilité"), title: Text("civilite")),
    Step(
        title: Text("Indentification et localisation"),
        content: Text("localisation")),
    Step(
        title: Text("Affectation et attribution"),
        content: Text("affectation et attribution"))
  ];
}
