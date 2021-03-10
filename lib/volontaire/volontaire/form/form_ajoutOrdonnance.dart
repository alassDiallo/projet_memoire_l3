import 'dart:ffi';
import 'package:flutter/material.dart';

//TODO: Alert Dialogue et Scaffold(snack) pour les formulaires

class AjoutOrdonnance extends StatefulWidget {
  @override
  _AjoutOrdonnanceState createState() => _AjoutOrdonnanceState();
}

class _AjoutOrdonnanceState extends State<AjoutOrdonnance> {
  final _formKey = GlobalKey<FormState>();
  String _libelle;
  double _prix;
  DateTime _date;

  DateTime selectedDate = DateTime.now();

  void _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          height: size.height,
          child: Column(children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(130)),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              elevation: 7,
              color: Colors.blue.withOpacity(0.3),
              child: Container(
                child: Image.asset("images/medicament.png", fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Text(
                "Ajouter un medicament",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(15),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Medicament',
                          prefixIcon: Icon(Icons.description_rounded),
                          hintText: 'Medicament',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "le champs est obligatoire";
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
                          labelText: 'Prix',
                          prefixIcon: Icon(Icons.attach_money_sharp),
                          hintText: 'Prix',
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
                      //   validator: (input) =>
                      //       input.isEmpty ? ' Veuillez remplir ce champs' : null,
                      //   onSaved: (input) => _date = input as DateTime,
                      // ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 110,
                            child: RaisedButton(
                              onPressed: _submit,
                              child: Text('  Enregistrer  '),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.greenAccent,
                              textColor: Colors.yellow,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              splashColor: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ]),
        )));
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Traitement en cours')));
    }
  }
}
