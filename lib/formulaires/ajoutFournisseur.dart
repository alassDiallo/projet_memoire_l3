import 'package:flutter/material.dart';

class AjoutFournisseur extends StatefulWidget {
  @override
  _AjoutFournisseurState createState() => _AjoutFournisseurState();
}

class _AjoutFournisseurState extends State<AjoutFournisseur> {
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
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Text(
                        "Ajouter un Fournisseur",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
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
                        Text("Information fournisseur"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText:
                                  "entrer les informations du fournisseur",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Adresse"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "entrer l'adresse du fournisseur",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("E-mail fournisseur"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "entrer l'email du fournisseur",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("telephone fournisseur"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 9,
                          decoration: InputDecoration(
                              hintText: "entrer le telephone du fournisseur",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text("enregistrer"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.blue,
                          textColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          minWidth: MediaQuery.of(context).size.width,
                        )
                      ],
                    ))
                  ],
                ))));
  }
}
