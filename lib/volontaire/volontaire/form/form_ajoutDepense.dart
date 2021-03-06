import 'dart:ffi';
import 'package:gestion_materiel_cmu/models/depense.dart';
import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'dart:async';
import 'dart:convert' as convert;

class AjoutDepense extends StatefulWidget {
  @override
  _AjoutDepenseState createState() => _AjoutDepenseState();
}

class _AjoutDepenseState extends State<AjoutDepense> {
  List<Depense> depenses = [];
  final _formKey = GlobalKey<FormState>();
  String _description;
  double _cout;
  DateTime _date;

  // Depenselist dep = Depenselist();

  DateTime selectedDate = DateTime.now();

  void _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
        // Scaffold(
        // appBar: AppBar(
        //   title: Text(" Dépense "),
        //   centerTitle: true,
        // ),
        // body: SingleChildScrollView(
        //   child:
        // body:
        Container(
      // height: size.height,
      child: Column(
        children: [
          // Divider(
          //   thickness: 2,
          //   indent: 10,
          //   endIndent: 10,
          // ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Description',
                        prefixIcon: Icon(Icons.description_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "le champs est obligatoire";
                        } else {
                          if (value.length < 3) {
                            return "Ce champs doit comporter au moins 3 caractere";
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "le champs est obligatoire";
                        } else if (double.parse(value) < 1) {
                          return "veuillez saisir une valeur positive";
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          _cout = double.parse(value);
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _cout = double.parse(value);
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
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(15.0),
                    //       borderSide: BorderSide(),
                    //     ),
                    //   ),
                    //   // keyboardType: TextInputType.datetime,
                    //   onTap: () => _selectDate(context),
                    //   validator: (input) =>
                    //       input.isEmpty ? ' Veuillez remplir ce champs' : null,
                    //   onSaved: (input) => _date = input as DateTime,
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 50,
                          child: ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              primary: Colors.blue,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
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
    );
    // );
  }

  Future<void> _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Scaffold.of(context)
      //     .showSnackBar(SnackBar(content: Text('Traitement en cours')));
      var url = "auth/depense";
      print(url);
      Map<String, dynamic> depense = {
        "description": _description,
        "cout": _cout.toString(),
      };
      print(depense);
      var donnee = await Connexion().envoideDonnnee(depense, url);
      print(donnee.body);
      CircularProgressIndicator();
      if (donnee.statusCode == 200) {
        print(donnee.body);
        _formKey.currentState.reset();
        if (donnee['success'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(donnee['success']),
            backgroundColor: Colors.greenAccent,
          ));
        }
      }
    }
  }
}
