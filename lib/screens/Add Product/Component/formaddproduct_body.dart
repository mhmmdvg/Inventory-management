import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:inventory_management/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File _image;
  final picker = ImagePicker();

  TextEditingController quantityController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController typeController = new TextEditingController();
  TextEditingController brandController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();

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
  void initState() {
    super.initState();
    quantityController.text = "0";
  }

  void addData() {
    var url = 'http://mhmmdvg.000webhostapp.com/addData.php';

    http.post(url, body: {
      "codeProduct": codeController.text,
      "nameProduct": nameController.text,
      "typeProduct": typeController.text,
      "brandProduct": brandController.text,
      "priceProduct": priceController.text,
      "quantityProduct": quantityController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 21.5),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.black45))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imageProduct(),
                SizedBox(width: 20.0),
                Container(
                  width: 210,
                  child: Column(
                    children: [
                      TextField(
                        controller: codeController,
                        decoration: InputDecoration(
                            hintText: 'Kode Produk', border: InputBorder.none),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.black45,
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'Nama Produk', border: InputBorder.none),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 15.0,
            color: Colors.grey[100],
          ),
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Text(
              'Kategori',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.black26,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: kDefaultPadding, right: kDefaultPadding),
                child: Text(
                  'Tipe Produk',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                width: 210,
                child: TextField(
                  controller: typeController,
                  decoration: InputDecoration(
                      hintText: 'Tipe Produk', border: InputBorder.none),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.black26,
            indent: 20.0,
            endIndent: 20.0,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: kDefaultPadding, right: kDefaultPadding),
                child: Text(
                  'Brand Produk',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                width: 210,
                child: TextField(
                  controller: brandController,
                  decoration: InputDecoration(
                      hintText: 'Brand', border: InputBorder.none),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.black26,
            indent: 20.0,
            endIndent: 20.0,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: kDefaultPadding, right: kDefaultPadding),
                child: Text(
                  'Price',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                width: 210,
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Price', border: InputBorder.none),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.black26,
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      'Note : sebelum save isikan banyak produk/quantity dengan menggunakan fitur dibawah',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.indigo,
              ),
              child: IconButton(
                  icon: Icon(
                    EvaIcons.minus,
                    color: Colors.white,
                  ),
                  tooltip: 'Decrement',
                  onPressed: () {
                    int currentValue = int.parse(quantityController.text);
                    setState(() {
                      currentValue--;
                      quantityController.text =
                          (currentValue > 0 ? currentValue : 0).toString();
                    });
                  }),
            ),
            Container(
              width: 55,
              child: TextField(
                controller: quantityController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(hintText: '0', border: InputBorder.none),
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
              child: IconButton(
                  icon: Icon(
                    EvaIcons.plus,
                    color: Colors.white,
                  ),
                  tooltip: 'Increment',
                  onPressed: () {
                    int currentValue = int.parse(quantityController.text);
                    setState(() {
                      currentValue++;
                      quantityController.text = (currentValue).toString();
                    });
                  }),
            ),
            Container(
              height: 60,
              width: 200,
              padding: EdgeInsets.only(left: kDefaultPadding),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.indigo,
                splashColor: Colors.indigo,
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  if (quantityController.text == "0") {
                    EdgeAlert.show(context,
                        title: 'Please',
                        icon: FlevaIcons.alert_triangle,
                        backgroundColor: Colors.indigo,
                        description: 'Quantity harus lebih dari 0',
                        gravity: EdgeAlert.TOP);
                  } else {
                    addData();
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProduct() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: kDefaultPadding),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0), //or 15.0
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
          bottom: 8.0,
          right: 8.0,
          child: InkWell(
            onTap: () {
              _showPicker(context);
            },
            child: Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                EvaIcons.camera,
                color: Colors.indigo,
                size: 28.0,
              ),
            ),
          ),
        ),
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
