import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialog {
  information(BuildContext context, String title, Widget page) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            //
            actions: [],
          );
        });
  }
}
