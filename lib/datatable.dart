import 'package:flutter/material.dart';

class Tableau extends StatefulWidget {
  @override
  _TableauState createState() => _TableauState();
}

class _TableauState extends State<Tableau> {
  List<User> list = [
    User(nom: "diallo", prenom: "assane"),
    User(nom: "balde", prenom: "demba"),
    User(nom: "fatou", prenom: "cisse"),
    User(nom: "astou", prenom: "ndiaye"),
    User(nom: "dmakhan", prenom: "traore"),
  ];
  bool ascend = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    print(ascend);
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: DataTable(
        sortColumnIndex: index,
        sortAscending: ascend,
        showCheckboxColumn: true,
        columns: [
          DataColumn(
              label: Text("prenom"),
              numeric: false,
              onSort: (i, sort) {
                setState(() {
                  ascend = !ascend;
                });
                print(ascend);
                trie(i, ascend);
              }),
          DataColumn(label: Text("nom"), numeric: false),
          // DataColumn(label: Text("pays"), numeric: true),
          // DataColumn(label: Text("region"), numeric: true),
          // DataColumn(label: Text("pays"), numeric: true),
          // DataColumn(label: Text("region"), numeric: true)
        ],
        rows: list
            .map((e) => DataRow(
                cells: [DataCell(Text(e.prenom)), DataCell(Text(e.nom))]))
            .toList()

        // DataRow(cells: [
        //   DataCell(Text("senegal"), onTap: () {}),
        //   DataCell(Text("dakar"), onTap: () {}),
        //   DataCell(Text("senegal"), onTap: () {}),
        //   DataCell(Text("dakar"), onTap: () {}),
        //   DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
        // ]),
        // DataRow(selected: true, cells: [
        //   DataCell(Text("guinee"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("conacri"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
        // ]),
        // DataRow(selected: true, cells: [
        //   DataCell(Text("Mali"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Bamako"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
        // ]),
        // DataRow(selected: true, cells: [
        //   DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
        //   DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
        // ])
        ,
      ),
    );
  }

  void trie(int index, bool ascend) {
    if (index == 0) {
      if (ascend) {
        list.sort((a, b) => a.prenom.compareTo(b.prenom));
      } else {
        list.sort((a, b) => b.prenom.compareTo(a.prenom));
      }
    }
  }
}

class User {
  String nom;
  String prenom;
  User({this.nom, this.prenom});
}
