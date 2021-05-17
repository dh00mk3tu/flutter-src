import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SetImage extends StatefulWidget {
  @override
  _SetImageState createState() => _SetImageState();
}

File image, retImage;

class _SetImageState extends State<SetImage> {
  
  // File image;
  final picker = ImagePicker();
  Future _openGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if(pickedFile != null) {
        image = File(pickedFile.path);
        retImage = image;
        Navigator.pop(context);
      }
      else {
        return Text("No image Selected!");
      }
    });
  }

  Future _openCamera() async {
    final clickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if(clickedFile != null) {
        image = File(clickedFile.path);
        retImage = image;
        Navigator.pop(context);
      }
      else {
        return Text("No image Selected!");
      }
    });
  }
  
  Future<void> _openPicker(BuildContext context){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Select an option"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Gallery"),
                      ),
                      
                    onPressed: () {
                    _openGallery();
                  }
                  ),
             
                ),
                SizedBox(
                  height: 5
                ),
                GestureDetector(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Camera"),
                      ),
                      
                    onPressed: () {
                    _openCamera();
                  }
                  ),
             
                ),
                ElevatedButton(
                  child: Text("Cancel!"),
                  onPressed: () {
                    Navigator.pop(context);
                  }
                )
              ],
            ),
          )
        );
      }
    );
  }
  
  returnPath() {
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Hey why don't you set a beautiful picture of yourself as Profile Picture?",
                style: TextStyle(
                  fontSize: 12,
                  
                ),
                
              ),
              Card(
                child: image == null ? Icon(Icons.person_outlined): Image.file(image),
              ),
              ElevatedButton(
                child: Text("Select an image"),
                onPressed: () {
                  _openPicker(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget drawerImage() {
  if (retImage != null){
    return new Image.file(retImage);
  }
  else {
    return Icon(Icons.person_outlined);
  }
}