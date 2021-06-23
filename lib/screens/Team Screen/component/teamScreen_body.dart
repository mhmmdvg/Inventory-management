import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          createTeamMenu(size),
          SizedBox(height: 20.0),
          joinTeamMenu(size),
        ],
      ),
    );
  }

  DelayedDisplay joinTeamMenu(Size size) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 250),
      child: GestureDetector(
        onTap: (){

        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.0),
            color: Colors.white70,
            boxShadow: [
              BoxShadow(
                color: Colors.indigo[100].withOpacity(0.3),
                spreadRadius: 0.35,
                blurRadius: 2.5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                width: size.width * 0.35,
                height: 150.0,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: size.width * 0.35 / 5 - 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Image.asset(
                          "assets/images/undraw_join_of2w.png",
                          width: size.width * 0.55 / 2,
                          height: size.height * 0.15 / 1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: size.width * 0.50,
                height: 150.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Join Team',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Bergabung dengan team yang sudah ada',
                      style: TextStyle(color: kTextColor2),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  DelayedDisplay createTeamMenu(Size size) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 100),
      child: GestureDetector(
        onTap: (){
          setState(() {
            Navigator.pushNamed(context, '/CreateTeam');
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.0),
            color: Colors.indigo[50],
            boxShadow: [
              BoxShadow(
                color: Colors.indigo[100].withOpacity(0.3),
                spreadRadius: 0.35,
                blurRadius: 2.5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                width: size.width * 0.35,
                height: 150.0,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: size.width * 0.35 / 5 - 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Image.asset(
                          "assets/images/undraw_completed_tasks_vs6q.png",
                          width: size.width * 0.55 / 2,
                          height: size.height * 0.15 / 1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: size.width * 0.50,
                height: 150.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Team',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Buat team kamu untuk melanjutkan ke menu home',
                      style: TextStyle(color: kTextColor2),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
