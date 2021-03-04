import 'package:flutter/material.dart';

class Patient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                child: Image.asset("images/vol.png"),
                radius: 30,
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Text(
                    "Assane",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("je suis la ")
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    "abonné",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[200]),
                  ),
                  Icon(Icons.star, color: Colors.blue, size: 20)
                ],
              ),
            ],
          ),
        ));
  }
}
