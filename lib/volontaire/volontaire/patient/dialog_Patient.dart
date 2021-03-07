import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/patient/patient.dart';

class DialogPatient extends StatefulWidget {
  // Widget page;
  // DialogPatient({
  //   this.page,
  // });
  @override
  _DialogPatientState createState() => _DialogPatientState();
}

class _DialogPatientState extends State<DialogPatient> {
  final _formKey = GlobalKey<FormState>();
  String _reference;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          // height: height - 200,
          // width: width - 50,
          child: AlertDialog(
              backgroundColor: Colors.white.withOpacity(0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              title: Text(
                ' Reference CMU du patient',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21.0),
              ),
              content: Column(children: <Widget>[
                // Image.asset(
                //   "img/chargement.gif",
                //   fit: BoxFit.scaleDown,
                //   //height: 125.0,
                //   width: 125.0,
                // ),
                SizedBox(height: 10.0),
                Patient(),
              ]))),
    );
  }
}
