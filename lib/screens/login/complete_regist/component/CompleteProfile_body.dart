import 'package:flutter/material.dart';
import 'package:inventory_management/constants.dart';
import 'package:inventory_management/models/user.dart';
import 'package:inventory_management/screens/login/complete_regist/Complete.dart';

import 'CompleteProfileForm.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Text('Complete profile',
                    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                Text(
                  'Complete your details or continue \nwith social media',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8B8B8B),
                  ),
                ),
                SizedBox(height: size.height * 0.08,),
                CompleteProfileForm(),
                SizedBox(height : 30.0),
                Text(
                  "By continuing your confirm that you agree \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
