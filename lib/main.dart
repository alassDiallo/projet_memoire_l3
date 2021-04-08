//import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:gestion_materiel_cmu/camera/camera.dart';
import 'package:gestion_materiel_cmu/consultation/detailConsultation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:web_socket_channel/web_socket_channel.dart';
//import 'package:gestion_materiel_cmu/volontaire/accueil.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'Login.dart';
import 'dart:async';
import 'patient/accueil.dart';
import 'badge.dart';
import 'package:gestion_materiel_cmu/discussion/messagerie.dart';
import 'dart:convert';

void main() {
  //camera = await availableCameras();
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isconnect = false;
  IO.Socket socket;
  WebSocketChannel channel;
  SocketIO socketIO;
  List<String> messages;
  double height, width;
  TextEditingController textController;
  ScrollController scrollController;

  conexionS() {
    //Initializing the message list
    messages = List<String>();
    //Initializing the TextEditingController and ScrollController
    textController = TextEditingController();
    scrollController = ScrollController();
    //Creating the socket
    socketIO =
        SocketIOManager().createSocketIO("http://10.156.81.236:3000", "/");
    //Call init before doing anything with socket
    socketIO.init();
    //Subscribe to an event to listen to
    socketIO.subscribe('message', (jsonData) {
      //Convert the JSON data received into a Map
      Map<String, dynamic> data = json.decode(jsonData);
      this.setState(() => messages.add(data['message']));
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    });
    //Connect to the socket
    socketIO.connect();
  }

  connection() {
    socket = IO.io("http://192.168.43.100/", <String, dynamic>{
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((data) => print("bonjour je suis connecter"));
    print(socket.connected);
  }

  //Widget page=Login();
  @override
  void initState() {
    connection();
    verifConnexion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Login());
  }

  void verifConnexion() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isconnect = true;
      });
    }
  }
}
