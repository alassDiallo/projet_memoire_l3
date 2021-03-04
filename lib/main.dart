import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gestion_materiel_cmu/camera/camera.dart';
import 'package:gestion_materiel_cmu/consultation/detailConsultation.dart';
import 'package:gestion_materiel_cmu/volontaire/accueil.dart';
import 'Login.dart';
import 'patient/accueil.dart';
import 'badge.dart';
import 'package:gestion_materiel_cmu/discussion/messagerie.dart';

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
  //Widget page=Login();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Login());
  }
}