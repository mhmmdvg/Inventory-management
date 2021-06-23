import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_management/components/custom_suffixIcon.dart';
import 'package:inventory_management/screens/Team%20Screen/Create%20Team/component/FormCreateTeam.dart';

import '../../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File _image;
  final picker = ImagePicker();

  Future imgFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                teamPicture(size),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                'Create Your Team \nProfile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        FormCreateTeam()
      ],
    );
  }

  Widget teamPicture(Size size) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.0), //or 15.0
            child: Container(
              height: 120.0,
              width: 120.0,
              color: Colors.grey[200],
              child: _image == null
                  ? Text('')
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.file(
                        _image,
                        height: 120,
                        width: 120,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
            ),
          ),
        ),
        Positioned(
            top: size.height * 0.41 / 5 - 20,
            left: size.width * 1.08 / 5 - 20,
            child: InkWell(
              onTap: () {
                setState(() {
                  _showPicker(context);
                });
              },
              child: Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  FlevaIcons.camera_outline,
                  color: Colors.indigo,
                  size: 28.0,
                ),
              ),
            )),
      ],
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
