import 'dart:ffi';
import 'package:flutter/material.dart';

class AjoutAnalyse extends StatefulWidget {
  @override
  _AjoutAnalyseState createState() => _AjoutAnalyseState();
}

class _AjoutAnalyseState extends State<AjoutAnalyse> {
  final _formKey = GlobalKey<FormState>();
  String _description;

  Double _cout;
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
        title: Text("Analyse "),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          //height: size.height,
          width: double.infinity,
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                elevation: 7,
                color: Colors.blue.withOpacity(0.6),
                child: Container(
                  child: Image.asset("img/analyse.jpg", fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Description',
                              prefixIcon: Icon(Icons.description_rounded),
                              border: OutlineInputBorder()),
                          validator: (input) => input.isEmpty
                              ? ' Veuillez remplir ce champs'
                              : null,
                          onSaved: (input) => _description = input,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Cout',
                              prefixIcon: Icon(Icons.attach_money_sharp),
                              border: OutlineInputBorder()),
                          keyboardType: TextInputType.number,
                          validator: (input) => input.isEmpty
                              ? ' Veuillez remplir ce champs'
                              : null,
                          onSaved: (input) => _cout = input as Double,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Date',
                            hintText: selectedDate.toString(),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.date_range_rounded),
                              onPressed: () => _selectDate(context),
                            ),
                          ),

                          // keyboardType: TextInputType.datetime,
                          onTap: () => _selectDate(context),
                          validator: (input) => input.isEmpty
                              ? ' Veuillez remplir ce champs'
                              : null,
                          onSaved: (input) => _date = input as DateTime,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
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
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Traitement en cours')));
    }
  }
}
