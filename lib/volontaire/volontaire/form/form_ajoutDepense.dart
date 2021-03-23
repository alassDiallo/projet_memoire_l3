import 'dart:ffi';
import 'package:flutter/material.dart';

class AjoutDepense extends StatefulWidget {
  @override
  _AjoutDepenseState createState() => _AjoutDepenseState();
}

class _AjoutDepenseState extends State<AjoutDepense> {
  final _formKey = GlobalKey<FormState>();
  String _description;
  double _prix;
  DateTime _date;

  DateTime selectedDate = DateTime.now();

  void _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Text(
              "Ajouter une Dépense",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(20),
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
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "le champs est obligatoire";
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
                          width: MediaQuery.of(context).size.width - 40,
                          child: RaisedButton(
                            onPressed: _submit,
                            child: Text('  Enregistrer  '),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.blue,
                            textColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            splashColor: Colors.white,
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

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Traitement en cours')));
    }
  }
}
