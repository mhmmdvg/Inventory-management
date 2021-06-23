import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatefulWidget {
  
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with SingleTickerProviderStateMixin {
 
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: <Widget>[
        Tab(
          icon: SvgPicture.asset("assets/icons/home-2.svg"),
        ),
        Tab(
          icon: SvgPicture.asset("assets/icons/home-2.svg"),
        ),
        Tab(
          icon: SvgPicture.asset("assets/icons/home-2.svg"),
        ),
        Tab(
          icon: SvgPicture.asset("assets/icons/home-2.svg"),
        ),
      ],
      controller: _tabController,
    );
  }
}