import 'package:gestion_materiel_cmu/models/depense.dart';

import 'Connexion.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

class Depenselist {
  List<Depense> depenses = [];

  Future<void> getDepense() async {
    String url = "auth/depense";
    // var donneejs = await Connexion().recuperation(url);
    // // String url = Connexion.url + "depenses";
    // // var donneejs = await http.get(url);
    // print(url);
    // print(donneejs.body);
    // if (donneejs.statusCode == 200) {
    //   var donnee = convert.jsonDecode(donneejs.body);
    //   for (var depense in donnee) {
    //     depenses.add(Depense(
    //       description: depense["description"],
    //       cout: depense["cout"].toDouble(),
    //     ));
    //   }
    // }
  }
//    Future<void> addDepense(String description, String coup) async {

//   Map<String, dynamic> depenseb = {
//     "description": description,
//     "cout": coup,
//     "idVolontaire": "3",
//   };
//   print(depenseb);
//   var url = Connexion.url + "depenses";
//   var donnee = await http.post(Uri.encodeFull(url), body: depenseb);
//   if (donnee.statusCode == 200) {
//     print(donnee.body);

//   }
// }

  Depenselist() {
    this.getDepense();
    this.depenses;
    // this.addDepense(String description, String coup);
  }
}
// List<dynamic> donnee = convert.jsonDecode(donneejs.body);
//     // for (var depense in donnee) {
//     //   depenses.add(
//     //       // Depense.fromJson(depense)
//     //       Depense(
//     //     description: depense["description"],
//     //     coup: depense["cout"],
//     //   ));
//     // }
//     depenses = donnee
//         .map(
//           (dynamic item) => Depense.fromJson(item),
//         )
//         .toList();
//     return depenses;
//   }
// }
