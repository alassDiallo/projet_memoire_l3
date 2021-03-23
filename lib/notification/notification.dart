import 'package:flutter/material.dart';

class NotificationM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("Notification"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "Aujourd'hui",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: ClipRRect(
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        color: Colors.red,
                                        child: Icon(
                                          Icons.notifications,
                                          color: Colors.white,
                                        )),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: Text("Assane diallo"),
                                  subtitle: Text(
                                      "assane vous a envoyer une demande de rendeez-vous"),
                                  trailing: Text("aujourd'hui"),
                                ),
                                Divider(
                                  endIndent: 20,
                                  indent: 50,
                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
