// import 'dart:ffi';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// List<CameraDescription> camera;

// class AppareilPhoto extends StatefulWidget {
//   @override
//   _AppareilPhotoState createState() => _AppareilPhotoState();
// }

// class _AppareilPhotoState extends State<AppareilPhoto> {
//   CameraController _controller;
//   Future<Void> cameraValue;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(camera[0], ResolutionPreset.high);
//     cameraValue = _controller.initialize();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           FutureBuilder(
//               future: cameraValue,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return CameraPreview(_controller);
//                 } else {
//                   return Center(child: CircularProgressIndicator());
//                 }
//               })
//         ],
//       ),
//     );
//   }
// }
