import 'package:flutter/material.dart';

class GridViews extends StatefulWidget {
  @override
  _GridViewsState createState() => _GridViewsState();
}

class _GridViewsState extends State<GridViews> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, Orientation) {
      return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 50,
          children: List.generate(100, (index) {
            return Image.asset(
              "images/accueil.jpg",
              width: 70,
              height: 70,
            );
          }));
    });
  }
}
