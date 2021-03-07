import 'package:flutter/material.dart';

class InfoProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 4, color: Colors.white)),
              child: CircleAvatar(
                  child: Image.asset("images/vol.png"), radius: 80)),
          SizedBox(height: 6),
          Text(
            "S Bassirou Dabo",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 6),
          Text(
            "Structure de Diourbel",
            style: TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}
