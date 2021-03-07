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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset(
            'img/rapport2.png',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(13),
                  child: TextFormField(
                    maxLength: 25,
                    decoration: InputDecoration(
                        labelText: 'Type de materiel',
                        hintText: 'Entrer du texte',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir ce champ ';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.all(11),
                  child: TextFormField(
                    maxLength: 400,
                    decoration: const InputDecoration(
                        labelText: 'Description du probleme',
                        hintText: 'Entrer du texte',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir ce champ ';
                      }
                      return null;
                    },
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: _submit,
                      child: Text('   Envoyer   '),
                      color: Colors.greenAccent,
                      textColor: Colors.yellow,
                      // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      splashColor: Colors.grey,
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
