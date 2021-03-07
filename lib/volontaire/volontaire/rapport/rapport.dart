import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/form/form_rapport_maintennance.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport_depense.dart';
import 'package:gestion_materiel_cmu/volontaire/volontaire/rapport/rapport_patient.dart';

class Rapport extends StatefulWidget {
  Rapport({Key key}) : super(key: key);

  @override
  _RapportState createState() => _RapportState();
}

class _RapportState extends State<Rapport> {
  int selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Rapport_Patient(),
    Rapport_Depense(),
    Rapport_Maintenancev(),
  ];
  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(' Rapport '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        //height: size.height,
        child: _widgetOptions.elementAt(selectedIndex),
      )),
      //  body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: const Icon(
              Icons.person,
            ),
            label: 'Patient',
          ),
          new BottomNavigationBarItem(
            icon: const Icon(
              Icons.attach_money_sharp,
            ),
            label: 'Dépense',
          ),
          new BottomNavigationBarItem(
            icon: const Icon(
              Icons.assignment,
              //  color: Colors.taccount_balance,
            ),
            label: 'Maintenance',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (int index) {
          this.onTapHandler(index);
        },
        unselectedItemColor: Colors.blueAccent,
        selectedItemColor: Colors.redAccent[400],
      ),
    );
  }
}
