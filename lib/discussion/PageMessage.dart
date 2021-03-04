import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/camera/camera.dart';
import 'package:gestion_materiel_cmu/discussion/chart_bubble.dart';
import 'package:gestion_materiel_cmu/discussion/menu_plus.dart';
import 'package:gestion_materiel_cmu/models/Message.dart';
import 'appbar_disc.dart';

class PageMessage extends StatefulWidget {
  @override
  _PageMessageState createState() => _PageMessageState();
}

enum MessageType { sender, receiver }

class _PageMessageState extends State<PageMessage> {
  String mess = '';
  List<Mess> list = [
    Mess(message: "Bonjour asane comment tu vas", type: MessageType.receiver),
    Mess(message: "oui cva et toi", type: MessageType.sender),
    Mess(message: "cva cool lou bess", type: MessageType.receiver),
    Mess(message: "ah dara sinon et de ton cote", type: MessageType.sender),
    Mess(message: "ah naz com dab ymgx", type: MessageType.receiver),
    Mess(message: "naka activité yi nak", type: MessageType.sender),
    Mess(message: "cva gnogui ci di takkalé rk", type: MessageType.receiver),
    Mess(message: "Bonjour asane comment tu vas", type: MessageType.receiver),
    Mess(message: "oui cva et toi", type: MessageType.sender),
    Mess(message: "cva cool lou bess", type: MessageType.receiver),
    Mess(message: "ah dara sinon et de ton cote", type: MessageType.sender),
    Mess(message: "ah naz com dab ymgx", type: MessageType.receiver),
    Mess(message: "naka activité yi nak", type: MessageType.sender),
    Mess(message: "cva gnogui ci di takkalé rk", type: MessageType.receiver),
  ];

  List<Option> option = [
    Option(titre: "photo & video", icon: Icons.image, couleur: Colors.amber),
    Option(
        titre: "document", icon: Icons.insert_drive_file, couleur: Colors.blue),
    Option(titre: "Audio", icon: Icons.voice_chat, couleur: Colors.orange),
    Option(titre: "localisation", icon: Icons.map, couleur: Colors.purple),
  ];

  void _showModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  Center(
                      child: Container(
                    height: 4,
                    width: 50,
                    color: Colors.grey.shade200,
                  )),
                  Container(
                    padding: EdgeInsets.only(bottom: 100),
                    child: ListView.builder(
                        itemCount: option.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 10, top: 10),
                            child: ListTile(
                              leading: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: option[index].couleur.shade100),
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    option[index].icon,
                                    size: 20,
                                    color: option[index].couleur.shade500,
                                  )),
                              title: Text(option[index].titre),
                            ),
                          );
                        }),
                  ),
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            //SizedBox(width: 6),
            CircleAvatar(
                backgroundImage: AssetImage("images/vol.png"), maxRadius: 20),
          ],
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assane diallo",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 2),
            Text("En ligne",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          Icon(Icons.more_vert)
        ],
        //backgroundColor: Colors.white,
        /* flexibleSpace: SafeArea(
          child: Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                SizedBox(width: 6),
                CircleAvatar(
                    backgroundImage: AssetImage("images/vol.png"),
                    maxRadius: 20),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Assane diallo",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 6),
                      Text("En ligne",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
                Icon(Icons.more_vert)
              ],
            ),
          ),
        ),*/
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Messages(sms: list[index]);
                }),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Container(
                  // padding: EdgeInsets.only(left: 10, bottom: 10),
                  //height: 80,
                  width: MediaQuery.of(context).size.width - 55,
                  child: Card(
                      margin: EdgeInsets.only(left: 4, bottom: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "ecrire un message.......",
                            contentPadding: EdgeInsets.all(5),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.emoji_emotions),
                              onPressed: () {},
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.attach_file),
                                  onPressed: () => _showModal(),
                                ),
                                IconButton(
                                  icon: Icon(Icons.camera_alt),
                                  onPressed: () {
                                    return Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AppareilPhoto()));
                                  },
                                )
                              ],
                            )),
                      )),
                  //color: Colors.white,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8, left: 2),
                  width: 50,
                  child: FloatingActionButton(
                      child: Icon(Icons.send),
                      onPressed: () {
                        setState(() {
                          list.add(
                            Mess(message: mess, type: MessageType.sender),
                          );
                        });
                      }),
                ),
              ]))
          /* Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                height: 80,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _showModal,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.add,
                          size: 21,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                          onChanged: (String c) {
                            setState(() {
                              mess = c;
                            });
                          },
                          onSubmitted: (String a) {},
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              icon: Icon(Icons.insert_emoticon),
                              onPressed: () {
                                print("Bonjour");
                              },
                            ),
                            hintText: "ecrire .........",
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            //border: InputBorder.none,
                          )),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.only(right: 20, bottom: 10),
                          child: FloatingActionButton(
                            child: Icon(Icons.send),
                            onPressed: () {
                              setState(() {
                                list.add(
                                  Mess(message: mess, type: MessageType.sender),
                                );
                              });
                            },
                            elevation: 0,
                          ),
                        ))
                  ],
                ),
              ))*/
        ],
      ),
    );
  }
}
