import 'package:flutter/material.dart';

class OpaqueImage extends StatelessWidget {
  final String imageUrl;
  const OpaqueImage({this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(imageUrl,
          width: double.maxFinite, height: double.maxFinite, fit: BoxFit.fill),
      Container(
        color: Colors.blue.withOpacity(0.7),
      )
    ]);
  }
}
