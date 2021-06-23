import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory_management/screens/login/forgot_password/forgot_password.dart';

import '../constants.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          "Don't have an account? ",
          style: TextStyle(
            color: kTextColor2,
          ),
        ),
      GestureDetector(
        onTap: () =>
                  Navigator.pushNamed(context, '/SignUp'),
              child: AutoSizeText(
              "Sign Up",
              style: TextStyle(
                color: kPrimaryColor2,
              ),
            ),
      ),
      ],
    );
  }
}