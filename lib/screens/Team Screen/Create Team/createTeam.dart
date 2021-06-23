import 'dart:convert';
import 'dart:math';

import 'package:edge_alert/edge_alert.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/models/team.dart';
import 'package:inventory_management/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import 'component/CreateTeam_body.dart';
import 'package:http/http.dart' as http;

class CreateTeam extends StatefulWidget {


  static String routeName = "/createTeam_screen";

  @override
  _CreateTeamState createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
   String getRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

   void addTeam() {
    var url = 'http://mhmmdvg.000webhostapp.com/addTeam.php';
    Team.teamID = getRandomString(5);

    http.post(url, body: {
      "team_id": '${Team.teamID}',
      "teamName": '${Team.teamName}',
      "teamNote": '${Team.noteTeam}',
      "email": '${User.email}'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create Team'),
      ),
      body: Body(),
      bottomNavigationBar: bottomButtonBar(context),
    );
  }

  Widget bottomButtonBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Close',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(width: 130.0),
          Container(
            height: 55,
            width: 160,
            padding: EdgeInsets.only(left: kDefaultPadding),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0),
              ),
              color: Colors.indigo,
              splashColor: Colors.indigo,
              child: Text(
                'Save',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onPressed: () {
                if(Team.teamName == null){
                  EdgeAlert.show(context,
                        title: 'Please',
                        icon: FlevaIcons.alert_triangle,
                        backgroundColor: Colors.indigo,
                        description: 'Nama Tim tidak boleh kosong',
                        gravity: EdgeAlert.TOP);
                }else{
                  setState(() {
                     addTeam();
                    _login();
                  });
                 
                }
                
              },
            ),
          ),
        ],
      ),
    );
  }

  void _login() async{
    final url = await http.post('http://mhmmdvg.000webhostapp.com/login.php',

     body: {
      "email": '${User.email}',
      "password": '${User.password}',
    });
    var dataUser = json.decode(url.body);

    

    if(dataUser.length == 0){
      setState((){
        print('Login Failed');
      });
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setBool('isUser', true);

      if(User.email == dataUser[0]['email'] &&  User.password == dataUser[0]['password']){
        Navigator.pushNamedAndRemoveUntil(context, "/HomeScreen",ModalRoute.withName('/'));
      }
    }
  }
}
