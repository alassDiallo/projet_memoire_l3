import 'package:flutter/material.dart';

class Tableau extends StatefulWidget {
  @override
  _TableauState createState() => _TableauState();
}

class _TableauState extends State<Tableau> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: DataTable(
        sortColumnIndex: 0,
        sortAscending: true,
        showCheckboxColumn: true,
        columns: [
          DataColumn(label: Text("pays"), numeric: true),
          DataColumn(label: Text("region"), numeric: true),
          DataColumn(label: Text("pays"), numeric: true),
          DataColumn(label: Text("region"), numeric: true),
          DataColumn(label: Text("pays"), numeric: true),
          DataColumn(label: Text("region"), numeric: true)
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text("senegal"), onTap: () {}),
            DataCell(Text("dakar"), onTap: () {}),
            DataCell(Text("senegal"), onTap: () {}),
            DataCell(Text("dakar"), onTap: () {}),
            DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
          ]),
          DataRow(selected: true, cells: [
            DataCell(Text("guinee"), onTap: () {}, showEditIcon: true),
            DataCell(Text("conacri"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
          ]),
          DataRow(selected: true, cells: [
            DataCell(Text("Mali"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Bamako"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
          ]),
          DataRow(selected: true, cells: [
            DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Gambie"), onTap: () {}, showEditIcon: true),
            DataCell(Text("Bandjul"), onTap: () {}, showEditIcon: true),
          ])
        ],
      ),
    );
  }
}
