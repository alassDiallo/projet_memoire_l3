import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Slide extends StatefulWidget {
  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  @override
  Widget build(BuildContext context) {
    return Carousel(
      showIndicator: false,
      dotColor: Colors.red,
      boxFit: BoxFit.fill,
      images: [
        AssetImage("images/ophtalmologie.png"),
        AssetImage("images/pneumologie.jpeg"),
        AssetImage("images/neurologie.png"),
        // AssetImage("images/vol.png"),
        AssetImage("images/infectiologie.jpg"),
        AssetImage("images/radiotherapie.jpg"),
        AssetImage("images/genecologie.png"),
        // AssetImage("images/discute.jpg"),
      ],
    );
  }
}
