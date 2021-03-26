import 'package:flutter/material.dart';

class FormConsultation extends StatefulWidget {
  FormConsultation({Key key}) : super(key: key);

  @override
  _FormConsultationState createState() => _FormConsultationState();
}

class _FormConsultationState extends State<FormConsultation> {
  final _formKey = GlobalKey<FormState>();
  String _reference;
  String _specialite;

  //   List<Materiel> _Specialites = [];
  // Future<void> getSpecialite() async {
  //   var url = Connexion.url + "prixConsultation";
  //   var donnee = await http.get(url);
  //   if (donnee.statusCode == 200) {
  //     print(donnee.body);
  //     var specialite = convert.jsonDecode(donnee.body);
  //     for (var specia in specialite) {
  //       _Specialites.add(Consulter(
  // date: specia["type"],
  //           idPatient: specia["idPatient"],
  //           idMedecin: specia["idMedecin"]));
  //     }
  //     print(_Specialites.length);
  //   }
  // }

  // List<DropdownMenuItem> listeSp() {
  //   List<DropdownMenuItem> l = [];
  //   for (Consulter materiel in _Specialites) {
  //     l.add(DropdownMenuItem(
  //       child: Text("libelle: ${materiel.libelle}- type:${materiel.type}"),
  //       //  ${materiel.reference}"),
  //       value: materiel.idMateriel,
  //     ));
  //   }
  //   return l;
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                      "Choix spécialité et prix",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 5,
              indent: 10,
              endIndent: 10,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),

                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: 'Entrer la référence CMU du patient',
                      //     prefixIcon: Icon(Icons.code_rounded),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(15.0),
                      //       borderSide: BorderSide(),
                      //     ),
                      //     hintText: 'Reference',
                      //   ),
                      //   validator: (input) => input.isEmpty
                      //       ? ' Veuillez remplir ce champs'
                      //       : null,
                      //   onSaved: (input) => _reference = input,
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      DropdownButtonFormField<String>(
                        items: [
                          DropdownMenuItem<String>(
                            value: "17000",
                            child: Text(
                              "General",
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "7000",
                            child: Text(
                              "Gynécologie",
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "13000",
                            child: Text(
                              "Cardiologie",
                            ),
                          ),
                        ],
                        validator: (value) {
                          if (value == null) {
                            return "le champs est obligatoire";
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            _specialite = value;
                          });
                        },
                        value: _specialite,
                        onChanged: (value) {
                          setState(() {
                            _specialite = value;
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: 'Spécialité',
                            // hintText: 'Entrer du texte',
                            border: OutlineInputBorder()),
                        elevation: 2,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        isDense: true,
                        iconSize: 30.0,
                        iconEnabledColor: Colors.black,
                        dropdownColor: Colors.white,
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      //shape:,

                      Card(
                        color: Colors.green.withOpacity(0.5),
                        // color: coleur.withOpacity(0.4),
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(60),
                                bottomRight: Radius.circular(60))),
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                        child: Container(
                          margin: EdgeInsets.all(30),
                          child: Column(
                            children: [
                              TextFormField(
                                readOnly: true,
                                initialValue: _specialite,
                                decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.monetization_on_outlined),
                                    labelText: 'Prix',
                                    hintText: _specialite,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.monetization_on_outlined),
                                    labelText: 'Total à payer',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),

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
                      ),
                    ]),
              ),
            )
          ],
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Traitement en cours')));
      _formKey.currentState.save();
    }
  }
}
