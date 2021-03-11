import 'package:flutter/material.dart';

class FormPatient1 extends StatefulWidget {
  Widget page;
  Color couleur;
  FormPatient1({this.page, this.couleur});
  @override
  _FormPatient1State createState() => _FormPatient1State();
}

class _FormPatient1State extends State<FormPatient1> {
  // Widget page;
  // _FormPatient1State(Widget page) {
  //   this.page = page;
  // }
  final _formKey = GlobalKey<FormState>();
  String _reference;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("  "),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              //  width: double.infinity,
              // height: size.height,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //   image: AssetImage("images/i3.jpg"),
              //   fit: BoxFit.contain,
              // )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Text(
                      "Entrer la référence CMU du patient",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Divider(
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                  ),
                  SizedBox(height: 20),
                  Card(
                    color: widget.couleur,
                    // color: coleur.withOpacity(0.4),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(40))),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                    child: Container(
                      margin: EdgeInsets.all(30),
                      child: Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Référence CMU ',
                                    prefixIcon: Icon(Icons.code_rounded),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(),
                                    ),
                                    hintText: 'Reference',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "le champs est obligatoire";
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _reference = value;
                                    });
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      _reference = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 110,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        // Scaffold.of(context).showSnackBar(SnackBar(
                                        //     content: Text('Traitement en cours')));
                                        _formKey.currentState.save();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => widget.page,
                                            ));
                                      }
                                    },
                                    child: Text('Enregistrer'),
                                  ),
                                )
                              ])),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
