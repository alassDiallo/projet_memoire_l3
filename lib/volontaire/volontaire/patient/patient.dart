import 'package:flutter/material.dart';

class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(" Patient "),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: size.height,
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //   image: AssetImage("img/i3.jpg"),
          //   fit: BoxFit.contain,
          // )),
          //  child: FormPatient(),
        ),
      ),
    );
  }
}
