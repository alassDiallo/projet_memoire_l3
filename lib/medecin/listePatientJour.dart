import 'package:flutter/material.dart';
//import 'package:data_tables/data_tables.dart';
import 'package:gestion_materiel_cmu/medecin/listepatient.dart';

class ListePatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste de mes patients du jour"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListeP(),
        decoration: BoxDecoration(
            //color: Colors.pink.withOpacity(0.5),
            /*image: DecorationImage(
                image: AssetImage(
                  "images/vol.png",
                ),*/
            //fit: BoxFit.cover)
            ),
      ),
    );
  }
}
