import 'package:flutter/material.dart';
import 'Affichage.dart';

class Discussion extends StatefulWidget {
  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Mes Discusions"),
        ),
        body: Center(
          child: Container(
              child: ListView(
            children: [
              ListTile(
                  leading: CircleAvatar(
                    child: Text("AHD"),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Message()));
                  },
                  title: Text("Assane diallo"),
                  subtitle: Text("voici mon message")),
              Divider(
                indent: 60,
              ),
              ListTile(
                  leading: CircleAvatar(
                    child: Text("AHD"),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  onTap: () {},
                  title: Text("Assane diallo"),
                  subtitle: Text("voici mon message")),
              Divider(
                indent: 60,
              ),
              ListTile(
                  leading: CircleAvatar(
                    child: Text("AHD"),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  onTap: () {},
                  title: Text("Assane diallo"),
                  subtitle: Text("voici mon message")),
              Divider(
                indent: 60,
              ),
              ListTile(
                  leading: CircleAvatar(
                    child: Text("AHD"),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  onTap: () {},
                  title: Text("Assane diallo"),
                  subtitle: Text("voici mon message")),
              Divider(
                indent: 60,
              ),
              ListTile(
                  leading: CircleAvatar(
                    child: Text("AHD"),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  onTap: () {},
                  title: Text("Assane diallo"),
                  subtitle: Text("voici mon message")),
              Divider(
                indent: 60,
              ),
              ListTile(
                  leading: CircleAvatar(
                    child: Text("AHD"),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  onTap: () {},
                  title: Text("Assane diallo"),
                  subtitle: Text("voici mon message")),
              Divider(
                indent: 60,
              ),
              ListTile(
                  leading: CircleAvatar(
                    child: Text("AHD"),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  onTap: () {},
                  title: Text("Assane diallo"),
                  subtitle: Text("voici mon message")),
              Divider(
                indent: 60,
              ),
              ListTile(
                  leading: CircleAvatar(
                    child: Text("AHD"),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  onTap: () {},
                  title: Text("Assane diallo"),
                  subtitle: Text("voici mon message")),
              Divider(
                indent: 60,
              ),
              ListTile(
                  leading: CircleAvatar(
                    child: Text("AHD"),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  onTap: () {},
                  title: Text("Assane diallo"),
                  subtitle: Text("voici mon message")),
              Divider(
                indent: 60,
              ),
              ListTile(
                  leading: CircleAvatar(
                    child: Text("AHD"),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  onTap: () {},
                  title: Text("Assane diallo"),
                  subtitle: Text("voici mon message")),
              Divider(
                indent: 60,
              ),
            ],
          )),
        ));
  }
}
