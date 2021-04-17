import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/models/patient.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_consultation.dart';

class Consultation extends StatefulWidget {
  Consultation({Key key}) : super(key: key);

  @override
  _ConsultationState createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  final _formKey = GlobalKey<FormState>();
  String _reference;
  @override
  Widget build(BuildContext context) {
    Patient patient = ModalRoute.of(context).settings.arguments;
    print("--------------" + patient.nom);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Consultation "),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          //height: size.height,

          child: FormConsultation(p: patient),
        ),
      ),
    );
  }
}
