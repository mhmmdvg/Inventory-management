import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory_management/components/search_box.dart';
import 'date_piechart_home.dart';
import 'homeScreen_AppBar.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: [
          SlivAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            SearchBox(),
            DateWithPieChart(),
          ])),
        ],
      ),
    );
  }
}
