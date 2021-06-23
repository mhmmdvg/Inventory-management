import 'package:flutter/material.dart';

import 'component/teamScreen_body.dart';

class TeamScreen extends StatelessWidget {
  static String routeName = "/team_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create Your Team'),
      ),
      body: Body(),
    );
  }
}