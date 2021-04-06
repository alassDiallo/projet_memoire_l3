import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/models/consultation.dart';

class ItemConsultation extends StatelessWidget {
  final Consultation consultation;
  final Function press;
  ItemConsultation({Key key, this.consultation, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(consultation.image, width: 100, height: 130),
                  Expanded(
                    child: Text(
                      consultation.nom,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Image.asset(consultation.image, width: 100, height: 130),
                  //     SizedBox(width: 10),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           consultation.nom,
                  //           style: TextStyle(
                  //               fontSize: 20, fontWeight: FontWeight.bold),
                  //         ),
                  SizedBox(
                    height: 6,
                  ),
                  // Row(
                  //   children: [
                  //     Text("Prix consultation : "),
                  //     Text(consultation.prix.toString(),
                  //         style: TextStyle(fontWeight: FontWeight.bold))
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 6,
                  // ),
                  // Text("Dr." + consultation.nomDocteur),
                  // Container(
                  //   padding: EdgeInsets.only(bottom: 10, top: 10),
                  //   child: Row(
                  //     children: [
                  //       IconButton(
                  //         icon: Icon(Icons.call),
                  //         onPressed: () {},
                  //       ),
                  //       IconButton(
                  //         icon: Icon(Icons.message),
                  //         onPressed: () {},
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // Wrap(children: [
                  //   Text(
                  //       "l'ophtalmologie est une sciece \nqui etudiae les anomalid des yeux"),
                  // ]),
                ],
              ),
              //]),

              //   Divider(),
              //   Container(
              //     // width: MediaQuery.of(context).size.width,
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(40),
              //       child: FlatButton(
              //           padding: EdgeInsets.all(15),
              //           textColor: Colors.white,
              //           color: Colors.red[400],
              //           onPressed: () {},
              //           child: Text("Demander un rendez-vous")),
              //     ),
              //   )
              // ],
              //     ),
              //   ),
              // ),
            ),
          ),
        ));
  }
}
