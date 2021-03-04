import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/discussion/PageMessage.dart';
import 'package:gestion_materiel_cmu/medecin/Affichage.dart';
import 'package:gestion_materiel_cmu/models/Message.dart';

class Messages extends StatefulWidget {
  Mess sms;
  Messages({this.sms});
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: (widget.sms.type == MessageType.receiver
          ? Alignment.topLeft
          : Alignment.topRight),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: widget.sms.type == MessageType.receiver
                ? Colors.grey.shade500
                : Colors.blueGrey,
          ),
          padding: EdgeInsets.all(16),
          child: Text(widget.sms.message)),
    );
  }
}
