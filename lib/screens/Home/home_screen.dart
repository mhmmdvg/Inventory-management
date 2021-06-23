import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inventory_management/components/bottom_navigation.dart';
import 'package:inventory_management/screens/mail/mail.dart';
import 'package:inventory_management/screens/produk/produk_list.dart';
import 'package:octicons_icon/octicons_icon.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'component/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[Body(), ProdukList(), Mail()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
                  width: 0.5, color: Colors.black.withOpacity(0.06))),
        ),
        child: SalomonBottomBar(
          
            margin: EdgeInsets.all(8),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(FlevaIcons.home_outline),
                title: Text("Home"),
                selectedColor: Colors.purple,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Icon(FlevaIcons.shopping_bag_outline),
                title: Text("Inventory"),
                selectedColor: Colors.pink,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: CircleAvatar(
                  radius: 15.0,
                  backgroundImage: NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg?resize=750px:*'),
                ),
                title: Text("Profile"),
                selectedColor: Colors.teal,
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            }),
      ),
    );
  }
}