// //import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:gestion_materiel_cmu/Accueil.dart';
// // import 'package:flutter_socket_io/flutter_socket_io.dart';
// import 'package:gestion_materiel_cmu/camera/camera.dart';
// import 'package:gestion_materiel_cmu/consultation/detailConsultation.dart';
// import 'package:gestion_materiel_cmu/essai.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// // import 'package:web_socket_channel/web_socket_channel.dart';
// //import 'package:gestion_materiel_cmu/volontaire/accueil.dart';
// import 'package:flutter_socket_io/flutter_socket_io.dart';
// import 'package:flutter_socket_io/socket_io_manager.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/io.dart';
// import 'Login.dart';
// import 'dart:async';
// import 'patient/accueil.dart';
// import 'badge.dart';
// import 'package:gestion_materiel_cmu/discussion/messagerie.dart';
// import 'dart:convert';

// void main() {
//   //camera = await availableCameras();
//   //WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//             visualDensity: VisualDensity.adaptivePlatformDensity,
//             primarySwatch: Colors.blue),
//         debugShowCheckedModeBanner: false,
//         home: MyHomePage(title: 'Flutter Demo Home Page'));
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool isconnect = false;
//   IO.Socket socket;
//   WebSocketChannel channel;
//   SocketIO socketIO;
//   List<String> messages;
//   double height, width;
//   TextEditingController textController;
//   ScrollController scrollController;

//   conexionS() {
//     //Initializing the message list
//     messages = List<String>();
//     //Initializing the TextEditingController and ScrollController
//     textController = TextEditingController();
//     scrollController = ScrollController();
//     //Creating the socket
//     socketIO =
//         SocketIOManager().createSocketIO("http://10.156.81.236:3000", "/");
//     //Call init before doing anything with socket
//     socketIO.init();
//     //Subscribe to an event to listen to
//     socketIO.subscribe('message', (jsonData) {
//       //Convert the JSON data received into a Map
//       Map<String, dynamic> data = json.decode(jsonData);
//       this.setState(() => messages.add(data['message']));
//       scrollController.animateTo(
//         scrollController.position.maxScrollExtent,
//         duration: Duration(milliseconds: 600),
//         curve: Curves.ease,
//       );
//     });
//     //Connect to the socket
//     socketIO.connect();
//   }

//   connection() {
//     socket = IO.io("http://192.168.43.100/", <String, dynamic>{
//       'transports': ['websocket'],
//     });
//     socket.connect();
//     socket.onConnect((data) => print("bonjour je suis connecter"));
//     print(socket.connected);
//   }

//   //Widget page=Login();
//   @override
//   void initState() {
//     connection();
//     verifConnexion();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: AccueilApp());
//   }

//   void verifConnexion() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     var token = localStorage.getString('token');
//     if (token != null) {
//       setState(() {
//         isconnect = true;
//       });
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/Animation.dart';
import 'package:gestion_materiel_cmu/Login.dart';
import 'package:page_transition/page_transition.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

    _positionController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });

    _scale2Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/accueil.jpg"), fit: BoxFit.fill)),
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Positioned(
                  top: -50,
                  left: 0,
                  child: FadeAnimation(
                      1,
                      Container(
                        width: width,
                        height: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/logosenjica.jpeg'),
                                fit: BoxFit.cover)),
                      )),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/accueil.jpg"),
                            fit: BoxFit.fill)),
                    child: Container(
                      child: Image.network(
                          "http://10.156.81.236:8000/storage/app/public/photo.jpg"),
                      color: Colors.white54,
                    ),
                  ),
                )
              ],
            ),
            // Positioned(
            //   top: -100,
            //   left: 0,
            //   child: FadeAnimation(
            //       1.3,
            //       Container(
            //         width: width,
            //         height: 500,
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //                 image: AssetImage('/images/logosenjica.jpeg'),
            //                 fit: BoxFit.cover)),
            //       )),
            // ),
            // Positioned(
            //   top: -150,
            //   left: 0,
            //   child: FadeAnimation(
            //       1.6,
            //       Container(
            //         width: width,
            //         height: 400,
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //                 image: AssetImage('assets/images/accueilP.jpg'),
            //                 fit: BoxFit.cover)),
            //       )),
            // ),
            Container(
              padding: EdgeInsets.all(20.0),
              //color: Colors.blue[900].withOpacity(.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FadeAnimation(
                      5,
                      Text(
                        "Bienvenue!!!",
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  FadeAnimation(
                      7,
                      Container(
                        //color: Colors.white.withOpacity(.4),
                        child: Text(
                          "Facilité l'accés aux soins pour tous tel est notre objectif",
                          style: TextStyle(
                              color: Colors.white,
                              height: 1.4,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                  SizedBox(
                    height: 120,
                  ),
                  FadeAnimation(
                      8,
                      AnimatedBuilder(
                        animation: _scaleController,
                        builder: (context, child) => Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Center(
                              child: AnimatedBuilder(
                                animation: _widthController,
                                builder: (context, child) => Container(
                                  width: _widthAnimation.value,
                                  height: 80,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue[900].withOpacity(.4)),
                                  child: InkWell(
                                    onTap: () {
                                      _scaleController.forward();
                                    },
                                    child: Stack(children: <Widget>[
                                      AnimatedBuilder(
                                        animation: _positionController,
                                        builder: (context, child) => Positioned(
                                          left: _positionAnimation.value,
                                          child: AnimatedBuilder(
                                            animation: _scale2Controller,
                                            builder: (context, child) =>
                                                Transform.scale(
                                                    scale:
                                                        _scale2Animation.value,
                                                    child: Container(
                                                      width: 60,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              Colors.blue[900]),
                                                      child: hideIcon == false
                                                          ? Icon(
                                                              Icons
                                                                  .arrow_forward,
                                                              color:
                                                                  Colors.white,
                                                            )
                                                          : Container(),
                                                    )),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            )),
                      )),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
