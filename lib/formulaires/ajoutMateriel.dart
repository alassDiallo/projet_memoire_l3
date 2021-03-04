import 'package:flutter/material.dart';

class AjoutMateriel extends StatefulWidget {
  @override
  _AjoutMaterielState createState() => _AjoutMaterielState();
}

class _AjoutMaterielState extends State<AjoutMateriel> {
  String _libelle, _type, _fournisseur;
  double _prix;
  int _quantite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Ajouter Un materiel",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Libelle"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "entrer le libellé du materiel",
                        //contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Type"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "entrer le type de materiel",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Prix"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "entrer le prix",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Quantite"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "entrer la quantite",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Fournisseur"),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    value: _fournisseur,
                    onChanged: (value) {
                      setState(() {
                        _fournisseur = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "selectionner un fournisseur",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    items: [
                      DropdownMenuItem(
                        child: Text("assane diallo"),
                        value: "assane diallo",
                      ),
                      DropdownMenuItem(
                        child: Text("Bassirou Dabo"),
                        value: "Bassirou Dabo",
                      ),
                      DropdownMenuItem(
                        child: Text("Makhan traore"),
                        value: "Makhan traore",
                      ),
                      DropdownMenuItem(
                        child: Text("Yakhouba Cisse"),
                        value: "Yakhouba Cisse",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {},
                    child: Text("enregistrer"),
                    color: Colors.blue,
                    textColor: Colors.white,
                  )
                ],
              ))
            ],
          ),
        )));
  }
}
