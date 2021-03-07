import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class CameraG extends StatefulWidget {
  @override
  _CameraGState createState() => _CameraGState();
}

class _CameraGState extends State<CameraG> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.insert_drive_file),
                  onPressed: () {
                    getImage(false);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    getImage(true);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                fichier == null
                    ? Container()
                    : Image.file(
                        fichier,
                        height: 300,
                        width: 300,
                      ),
              ],
            ),
          ),
        ));
  }
}
