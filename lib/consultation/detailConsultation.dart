import 'package:flutter/material.dart';

class Consultation extends StatefulWidget {
  @override
  _ConsultationState createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("images/ophtalmologie.png",
                      width: 100, height: 130),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OPHTALMOLOGIE",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("Dr Assane Diallo"),
                      Container(
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(50),
                            borderRadius: BorderRadius.circular(100)),
                        child: FlatButton(
                          padding: EdgeInsets.all(10),
                          textColor: Colors.white,
                          onPressed: () {},
                          child: Text("Contacter"),
                          color: Colors.blue,
                        ),
                      ),
                      Wrap(children: [
                        Text(
                            "l'ophtalmologie est une sciece \nqui etudiae les anomalid des yeux"),
                      ]),
                    ],
                  ),
                ],
              ),
              Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: FlatButton(
                      padding: EdgeInsets.all(15),
                      textColor: Colors.white,
                      color: Colors.red[400],
                      onPressed: () {},
                      child: Text("Demander un rendez-vous")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
