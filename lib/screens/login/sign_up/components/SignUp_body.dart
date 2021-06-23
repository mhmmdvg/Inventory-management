import 'package:flutter/material.dart';

import 'SignUp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: <Widget>[
                Text(
                  'Register Account',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Complete your details or continue \nwith social media',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8B8B8B),
                  ),
                ),
                SizedBox(height: size.height * 0.08,),
                SignUpForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
