import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.more_vert)],
        title: Text("assane diallo"),
      ),
      persistentFooterButtons: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
          focusColor: Colors.red,
        ),
      ],
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bonjour doctor comment vous allez?",
                  style: TextStyle(backgroundColor: Colors.green),
                ),
                Text(
                  "oui Bonjour cva?",
                  style: TextStyle(backgroundColor: Colors.white),
                ),
                Text(
                  "Bonjour doctor comment vous allez?",
                  style: TextStyle(backgroundColor: Colors.green),
                ),
                Text(
                  "oui Bonjour cva?",
                  style: TextStyle(backgroundColor: Colors.white),
                ),
                Text(
                  "Bonjour doctor comment vous allez?",
                  style: TextStyle(backgroundColor: Colors.green),
                ),
                Text(
                  "oui Bonjour cva?",
                  style: TextStyle(backgroundColor: Colors.white),
                  textAlign: TextAlign.right,
                ),
              ],
            )),
      ),
    );
  }
}
