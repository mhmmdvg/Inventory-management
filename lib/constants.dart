import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF303030);
const kPrimaryColor2 = Colors.indigo;
const ksecondaryColor = Color(0xFFB5BFD0);
const kTextColor = Color(0xFF202E2E);
const kTextColor2 = Color(0xFF8B8B8B);
const kTextButtonColor = Colors.white;
const kTextLigntColor = Color(0xFF7286A5);

const double kDefaultPadding = 20.0;

const kAnimationDuration = Duration(milliseconds: 200);

const defaultDuration = Duration(milliseconds: 250);

final kDefaultShadow = BoxShadow(
  offset: Offset(5, 5),
  blurRadius: 10,
  color: Color(0xFFE9E9E9).withOpacity(0.56),
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";