import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inventory_management/components/custom_suffixIcon.dart';
import 'package:inventory_management/components/default_button.dart';
import 'package:inventory_management/components/form_error.dart';
import 'package:inventory_management/components/social_card.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_management/models/user.dart';
import 'package:inventory_management/screens/login/complete_regist/Complete.dart';
import 'package:inventory_management/screens/login/complete_regist/component/CompleteProfileForm.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../constants.dart';

class SignUpForm extends StatefulWidget {

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String confirm_password;
  String route = '/home_screen';
  final List<String> errors = [];

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController retypepasswordController = new TextEditingController();

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(size),
          SizedBox(
            height: 30.0,
          ),
          buildPasswordFormField(size),
          SizedBox(height: 30.0),
          buildPasswordConfirmFormField(size),
          FormError(errors: errors),
          SizedBox(height: 40.0),
          DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  // var route = new MaterialPageRoute(builder:
                  // (BuildContext context) =>
                  // new CompleteProfileForm(
                  //   value: User(
                  //     email: emailController.text,
                  //     password: passwordController.text
                  //   )
                  // )
                  // );
   
                  setState(() {
                    User.email = emailController.text;
                    User.password = passwordController.text;
                    Navigator.pushNamed(context, '/CompleteProfile');
                  });
                  
                  // Navigator.pushNamedAndRemoveUntil(context, '/HomeScreen', (Route<dynamic> route) => false);
                }
              }),
          SizedBox(
            height: size.height * 0.08,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialCard(
                icon: "assets/icons/google-icon.svg",
                press: () {},
              ),
              SocialCard(
                icon: "assets/icons/facebook-2.svg",
                press: () {},
              ),
              SocialCard(
                icon: "assets/icons/twitter.svg",
                press: () {},
              ),
            ],
          ),
          SizedBox(
            height: size.height / 130,
          ),
          Text(
            'By continuing your confirm that you agree \nwith our Term and Condition',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordConfirmFormField(Size size) {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && _password == confirm_password) {
          removeError(error: kMatchPassError);
        }
        confirm_password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((_password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height / 38,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kTextColor2),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kPrimaryColor2),
            gapPadding: 10,
          ),
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          )),
    );
  }

  TextFormField buildPasswordFormField(Size size) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newValue) => _password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        _password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height / 38,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kTextColor2),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kPrimaryColor2),
            gapPadding: 10,
          ),
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          )),
    );
  }

  TextFormField buildEmailFormField(Size size) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height / 38,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kTextColor2),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kPrimaryColor2),
            gapPadding: 10,
          ),
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )),
    );
  }
}
