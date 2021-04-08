import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'package:http/http.dart' as http;

class AjoutAnalyse extends StatefulWidget {
  Patient patient;
  AjoutAnalyse({this.patient});
  @override
  _AjoutAnalyseState createState() => _AjoutAnalyseState();
}

class _AjoutAnalyseState extends State<AjoutAnalyse> {
  final _formKey = GlobalKey<FormState>();
  String _libelle;
  double _prix;
  // DateTime _date;

  // DateTime selectedDate = DateTime.now();

  // void _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2025),
  //   );
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }
  Future<void> _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Map<String, dynamic> analyse = {
        "libelle": _libelle,
        "prix": _prix.toString(),
        "idPatient": widget.patient.idPatient,
      };
      print(analyse);
      var url = "auth/analyses";
      print(url);
      var donnee = await Connexion().envoideDonnnee(analyse, url);

      // var url = Connexion.url + "analyses";
      //  print(url);
      // var donnee = await http.post(Uri.encodeFull(url), body: analyse);
      print(donnee.statusCode);
      if (donnee.statusCode == 200) {
        //convert.jsonDecode(donnee.body);

        print(donnee.body);
        _formKey.currentState.reset();
        if (donnee['success'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(donnee['success']),
            backgroundColor: Colors.greenAccent,
          ));
        }
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Analyse "),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          //height: size.height,
          width: double.infinity,
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                elevation: 0,
                color: Colors.blue.withOpacity(0.6),
                child: Container(
                  child: Image.asset("images/analyse.jpg", fit: BoxFit.cover),
                ),
              ),
              Card(
                color: Colors.blueAccent.withOpacity(0.1),
                // color: coleur.withOpacity(0.4),
                elevation: 7,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                margin: EdgeInsets.fromLTRB(0, 1, 0, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Text(
                        "Ajouter un Analyse",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 5,
                indent: 15,
                endIndent: 15,
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(15),
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Libelle',
                            prefixIcon: Icon(Icons.description_rounded),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "le champs est obligatoire";
                            } else {
                              if (value.length < 3)
                                return "Ce champs doit comporter au moins 3 caractere";
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              _libelle = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              _libelle = value;
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return "le champs est obligatoire";
                            } else if (double.parse(value) < 1) {
                              return "veuillez saisir une valeur positive";
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              _prix = double.parse(value);
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              _prix = double.parse(value);
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // TextFormField(
                        //   readOnly: true,
                        //   decoration: InputDecoration(
                        //     labelText: 'Date',
                        //     hintText: selectedDate.toString(),
                        //     prefixIcon: IconButton(
                        //       icon: Icon(Icons.date_range_rounded),
                        //       onPressed: () => _selectDate(context),
                        //     ),
                        //   ),

                        //   // keyboardType: TextInputType.datetime,
                        //   onTap: () => _selectDate(context),
                        //   validator: (input) => input.isEmpty
                        //       ? ' Veuillez remplir ce champs'
                        //       : null,
                        //   onSaved: (input) => _date = input as DateTime,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  primary: Colors.blue,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
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
            ],
          ),
        ),
      ),
    );
  }
}
