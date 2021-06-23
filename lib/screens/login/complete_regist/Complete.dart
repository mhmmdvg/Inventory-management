import 'package:flutter/material.dart';

import 'component/CompleteProfile_body.dart';

class CompleteProfile extends StatelessWidget {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}