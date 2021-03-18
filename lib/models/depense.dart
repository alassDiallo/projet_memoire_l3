class Depense {
  int idDepense;
  // String reference;
  String description;
  double cout;
  int idVolontaire;
  Depense({
    this.description,
    this.idDepense,
    this.idVolontaire,
    this.cout,
    // this.reference
  });
}
// To parse this JSON data, do
//
//     final depenseModels = depenseModelsFromJson(jsonString);

// To parse this JSON data, do
//
//     final depense = depenseFromJson(jsonString);

// import 'dart:convert';

// Depense depenseFromJson(String str) => Depense.fromJson(json.decode(str));

// String depenseToJson(Depense data) => json.encode(data.toJson());

// class Depense {
//   Depense({
//     this.idDepense,
//     this.description,
//     this.coup,
//     this.idVolontaire,
//     // this.createdAt,
//     // this.updatedAt,
//   });

//   int idDepense;
//   String description;
//   double coup;
//   int idVolontaire;
//   // dynamic createdAt;
//   // dynamic updatedAt;

//   factory Depense.fromJson(Map<String, dynamic> json) => Depense(
//         idDepense: json["idDepense"],
//         description: json["description"],
//         coup: json["coup"].toDouble(),
//         idVolontaire: json["idVolontaire"],
//         // createdAt: json["created_at"],
//         // updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "idDepense": idDepense,
//         "description": description,
//         "coup": coup,
//         "idVolontaire": idVolontaire,
//         // "created_at": createdAt,
//         // "updated_at": updatedAt,
//       };
// }
