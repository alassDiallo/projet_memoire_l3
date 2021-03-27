import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TODO: Validation Complete

class Rapport_Maintenancev extends StatefulWidget {
  Rapport_Maintenancev({Key key}) : super(key: key);

  @override
  _Rapport_MaintenancevState createState() => _Rapport_MaintenancevState();
}

class _Rapport_MaintenancevState extends State<Rapport_Maintenancev> {
  final _formKey = GlobalKey<FormState>();
  String _description, _type;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   child: Image.asset(
        //     'images/rapport2.png',
        //     fit: BoxFit.fill,
        //   ),
        // ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Text(
            "Envoyer un Rapport de maintennance",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
        ),
        SizedBox(height: 20),
        Draggable(
            child: Column(
              children: [
                Text("ordinateur"),
                Text("telephone"),
              ],
            ),
            feedback: Text('bonjour')),
        Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    maxLength: 25,
                    decoration: InputDecoration(
                        labelText: 'Type de materiel',
                        hintText: 'Entrer du texte',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(),
                        )),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "le champs est obligatoire";
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        _type = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _type = value;
                      });
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    maxLength: 400,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: 'Description du probleme',
                      hintText: 'Entrer du texte',
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
                // SizedBox(
                //   height: 10,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: _submit,
                        child: Text('   Envoyer   '),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        splashColor: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
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
