import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/components/custom_suffixIcon.dart';
import 'package:inventory_management/components/default_button.dart';
import 'package:inventory_management/components/form_error.dart';
import 'package:inventory_management/helper/mysqlhelp.dart';
import 'package:inventory_management/screens/login/forgot_password/forgot_password.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../constants.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  bool remember = false;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        ////==========================Email============================//////
        buildEmailFormField(size),
        SizedBox(
          height: size.height / 35,
        ),
        ////==========================Password============================//////
        buildPasswordFormField(size),
        SizedBox(
          height: size.height / 35,
        ),
        Row(
          children: [
            Checkbox(
                value: remember,
                activeColor: kPrimaryColor2,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                }),
            AutoSizeText("Remember me"),
            Spacer(),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, '/ForgotPassword'),
                  //Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: ForgotPasswordScreen())),
              child: AutoSizeText(
                "Forgot Password",
                style: TextStyle(color: kPrimaryColor2,decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        FormError(errors: errors),
        SizedBox(
          height: size.height / 35,
        ),
        DefaultButton(
          text: "Sign In",
          press: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              Navigator.pushReplacementNamed(context, '/HomeScreen');
            }
          },
        ),
      ]),
    );
  }

  TextFormField buildPasswordFormField(Size size) {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
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
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
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