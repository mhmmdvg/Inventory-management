import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory_management/constants.dart';

import 'Component/formaddproduct_body.dart';

class FormAddProduct extends StatefulWidget {
  static String routeName = "/addproduct_screen";

  @override
  _FormAddProductState createState() => _FormAddProductState();
}

class _FormAddProductState extends State<FormAddProduct> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Product',
        ),
      ),
      body: Body(),
      
    );
  }
}
