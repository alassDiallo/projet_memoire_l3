import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/camera/camera.dart';
import 'package:gestion_materiel_cmu/controllers/Connexion.dart';
import 'package:gestion_materiel_cmu/discussion/chart_bubble.dart';
import 'package:gestion_materiel_cmu/discussion/menu_plus.dart';
import 'package:gestion_materiel_cmu/models/Message.dart';
import 'package:gestion_materiel_cmu/models/utilisateur.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appbar_disc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class PageMessage extends StatefulWidget {
  Utilisateur u;
  PageMessage({this.u});
  @override
  _PageMessageState createState() => _PageMessageState();
}

enum MessageType { sender, receiver }

class _PageMessageState extends State<PageMessage> {
  ScrollController scrollController;
  var cle = GlobalKey<FormState>();
  IO.Socket socket;

  var user;

  getUser() async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    setState(() {
      user = json.decode(localstorage.getString('user'));
    });
  }

  connection() {
    socket = IO.io("http://192.168.43.100:3000/", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false
    });
    socket.connect();
    socket.onConnect((data) => print("bonjour je suis connecter"));
    print(socket.connected);
    //socket.emit("message", "bonjour serveur");
    socket.on(
        "message",
        (data) => {
              if (data['recipient_id'] == user['email'])
                setState(() {
                  list.add(Mess(
                      message: data['contenu'], type: MessageType.receiver));
                })
            });
    // scrollController = ScrollController();
    // scrollController.animateTo(
    //   scrollController.position.maxScrollExtent,
    //   duration: Duration(milliseconds: 600),
    //   curve: Curves.ease,
    // );
  }

  String mess = '';
  List<Mess> list = [];
  // Mess(message: "d'accord pour quand ?", type: MessageType.sender),
  // Mess(
  //     message: "bon ces temps si j'ai souvent mal à la téte",
  //     type: MessageType.receiver),
  // Mess(
  //     message: "d'accords je vois tu as pris des medicaments",
  //     type: MessageType.sender),
  // Mess(message: "non pas encore", type: MessageType.receiver),
  // Mess(message: "Bonjour asane comment tu vas", type: MessageType.receiver),
  // Mess(message: "oui cva et toi", type: MessageType.sender),
  // Mess(message: "cva cool lou bess", type: MessageType.receiver),
  // Mess(message: "ah dara sinon et de ton cote", type: MessageType.sender),
  // Mess(message: "ah naz com dab ymgx", type: MessageType.receiver),
  // Mess(message: "naka activité yi nak", type: MessageType.sender),
  // Mess(message: "cva gnogui ci di takkalé rk", type: MessageType.receiver),
  // ];

  Future<void> getMessages() async {
    String url = "auth/messages/" + widget.u.idMessagerie.toString();
    var donnees = await Connexion().recuperation(url);
    print(donnees.body);
    if (donnees.statusCode == 200) {
      var d = json.decode(donnees.body);
      for (var sms in d) {
        var t = user['email'] == sms['sender_id']
            ? MessageType.sender
            : MessageType.receiver;

        print(t);
        setState(() {
          list.add(
            Mess(
                message: sms['contenu'], type: t, dateenvoi: sms['created_at']),
          );
        });
      }
    }
  }

  Future<void> envoiMess(sms) async {
    var donnees = await Connexion().envoideDonnnee("auth/message", sms);
    print(donnees.body);
    if (donnees.statusCode == 200) {
      var d = json.decode(donnees.body);
      print(d);
    }
  }

  void _enregistrer() {
    if (cle.currentState.validate()) {
      cle.currentState.save();
      var message = Mess(message: mess, type: MessageType.sender);

      setState(() {
        list.add(
          Mess(message: mess, type: MessageType.sender),
        );
      });
      cle.currentState.reset();
      Map<String, dynamic> sms = {
        "contenu": mess,
        "idMessagerie": widget.u.idMessagerie,
        "dateEnvoi": DateTime.now().toString(),
        "recipient_id": widget.u.recipientId
      };
      socket.emit("message", sms);
      envoiMess(sms);
    }
  }

  //acceder a la camera ou a la galerie
  File fichier;

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      fichier = image;
    });
  }

  List<Option> option = [
    Option(titre: "photo & video", icon: Icons.image, couleur: Colors.amber),
    Option(
        titre: "document", icon: Icons.insert_drive_file, couleur: Colors.blue),
    Option(titre: "Audio", icon: Icons.voice_chat, couleur: Colors.orange),
    Option(titre: "localisation", icon: Icons.map, couleur: Colors.purple),
  ];

  void _showModal() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 80, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      // child: Text("je suis encore la"),
                      padding: EdgeInsets.only(
                        left: 50,
                        right: 50,
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.image,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          getImage(false);
                                        },
                                      ),
                                      backgroundColor: Colors.pink,
                                      radius: 30,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text("photo & video")
                                  ],
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(Icons.insert_drive_file,
                                          color: Colors.white),
                                      backgroundColor: Colors.blue[600],
                                      radius: 30,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text("document")
                                  ],
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(Icons.voice_chat,
                                          color: Colors.white),
                                      radius: 30,
                                      backgroundColor: Colors.orange,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text("Audio")
                                  ],
                                )
                              ]),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.image,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Colors.pink,
                                      radius: 30,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text("photo & video")
                                  ],
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(Icons.insert_drive_file,
                                          color: Colors.white),
                                      backgroundColor: Colors.blue[600],
                                      radius: 30,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text("document")
                                  ],
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(Icons.voice_chat,
                                          color: Colors.white),
                                      radius: 30,
                                      backgroundColor: Colors.orange,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text("Audio")
                                  ],
                                )
                              ])
                        ],
                      )),
                ],
              ));
        });
  }

  @override
  void initState() {
    getUser();
    connection();
    getMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 90,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BackButton(),
            // IconButton(
            //     icon: Icon(
            //       Icons.arrow_back,
            //       size: 24,
            //     ),
            //     onPressed: () {
            //       Navigator.pop(context);
            //     }),
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
              widget.u.nom,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 2),
            Text("En ligne",
                style: TextStyle(fontSize: 12, color: Colors.green)),
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
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: list.isEmpty
                ? Center(
                    child: Text("Cette conversation est vide "),
                  )
                : ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Messages(sms: list[index]);
                    }),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.blue,
                child: Row(children: [
                  Container(
                    // padding: EdgeInsets.only(left: 10, bottom: 10),
                    //height: 80,
                    width: MediaQuery.of(context).size.width - 50,
                    child: Card(
                        // margin: EdgeInsets.only(left: 4, bottom: 8),
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(30)),
                        child: Form(
                      key: cle,
                      child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        onChanged: (value) {
                          mess = value;
                        },
                        validator: (val) {
                          if (val == "") {
                            return "";
                          }
                        },
                        //expands: true,
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
                                    getImage(true);
                                  },
                                )
                              ],
                            )),
                      ),
                    )),
                    //color: Colors.white,
                  ),
                  Container(
                    // padding: EdgeInsets.only(bottom: 8, left: 2),
                    width: 50,
                    child: FloatingActionButton(
                        elevation: 0,
                        child: Icon(Icons.send),
                        onPressed: _enregistrer),
                  ),
                ]),
              ))
        ],
      ),
    );
  }
}
