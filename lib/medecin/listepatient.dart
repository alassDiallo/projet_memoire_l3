import 'package:flutter/material.dart';

class ListeP extends StatefulWidget {
  @override
  _ListePState createState() => _ListePState();
}

class _ListePState extends State<ListeP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue.withOpacity(0.5),
      child: SingleChildScrollView(
        child: DataTable(
          headingTextStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          columnSpacing: 20,
          dividerThickness: 3,
          showCheckboxColumn: true,
          showBottomBorder: true,
          sortColumnIndex: 0,
          sortAscending: false,
          columns: [
            DataColumn(label: Text("prenom")),
            DataColumn(label: Text("nom")),
            DataColumn(label: Text("telphone")),
            DataColumn(label: Text("Adresse"))
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text("Bassirou")),
              DataCell(Text("Dabo")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("CYC")),
              DataCell(Text("Cisse")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Makhan")),
              DataCell(Text("Traoré")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Assane")),
              DataCell(Text("Diallo")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Assane")),
              DataCell(Text("Diallo")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Assane")),
              DataCell(Text("Diallo")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Assane")),
              DataCell(Text("Diallo")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Assane")),
              DataCell(Text("Diallo")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Bassirou")),
              DataCell(Text("Dabo")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("CYC")),
              DataCell(Text("Cisse")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Makhan")),
              DataCell(Text("Traoré")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Assane")),
              DataCell(Text("Diallo")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Assane")),
              DataCell(Text("Diallo")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Assane")),
              DataCell(Text("Diallo")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Assane")),
              DataCell(Text("Diallo")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ]),
            DataRow(cells: [
              DataCell(Text("Assane")),
              DataCell(Text("Diallo")),
              DataCell(Text("77777777")),
              DataCell(Text("Dakar")),
            ])
          ],
        ),
      ),
    );
  }
}
