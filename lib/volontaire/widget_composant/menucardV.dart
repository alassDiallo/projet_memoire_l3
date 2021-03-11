import 'package:flutter/material.dart';

class MenuCardV extends StatelessWidget {
  final String text;
  final Widget icon;
  final Color couleurCard;
  final Color couleurCircle;
  MenuCardV({
    this.text,
    this.icon,
    this.couleurCard,
    this.couleurCircle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        color: couleurCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
        child: Container(
          margin: EdgeInsets.all(30),
          width: MediaQuery.of(context).size.width * 0.4,
          //  height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: icon,
                    radius: 30,
                    backgroundColor: couleurCircle,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: couleurCircle),
              ),
              Divider(
                height: 30,
                color: Colors.white,
                thickness: 2,
                indent: 19,
                endIndent: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
