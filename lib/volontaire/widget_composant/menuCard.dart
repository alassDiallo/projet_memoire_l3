import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String text;
  final Widget icon;
  final Color couleurCard;
  final Color couleurCircle;
  MenuCard({
    this.text,
    this.icon,
    this.couleurCard,
    this.couleurCircle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      //height: 140,
      child: Card(
        color: couleurCard,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: EdgeInsets.only(left: 17, top: 17, bottom: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      child: icon, radius: 50, backgroundColor: couleurCircle),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                //  crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: couleurCircle)),
                ],
              ),
              Divider(
                height: 30,
                color: Colors.blue,
                thickness: 2,
                indent: 19,
                endIndent: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
