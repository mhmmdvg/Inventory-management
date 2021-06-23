import 'package:flutter/material.dart';
import 'package:inventory_management/animations/FadeAnimations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/sign_inScreen_body.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  // bool isUser = false;


  // @override
  // void initState() {
  //   super.initState();
  //   _initCheck();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FadeAnimation(1.1, Text('Sign In')),
      ),
      body: Body(),
    );
  }

  // void _initCheck() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.getBool('isUser');

  //   if(prefs.getBool('isUser') != null){
  //     setState(() {
  //       isUser = prefs.getBool('isUser');
  //     });
  //   }
  // }
}