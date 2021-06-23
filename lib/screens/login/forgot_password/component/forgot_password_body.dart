import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/components/custom_suffixIcon.dart';
import 'package:inventory_management/components/default_button.dart';
import 'package:inventory_management/components/form_error.dart';
import 'package:inventory_management/components/no_account_text.dart';
import 'package:inventory_management/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 20),
          child: Column(
            children: [
            SizedBox(height: size.height * 0.06),
            AutoSizeText(
              "Forgot Password",
              style: TextStyle(
                  fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            AutoSizeText(
              "Please enter your email and we will send \nyou a link to return to your account",
              textAlign: TextAlign.center,
              style: TextStyle(color: kTextColor2),
            ),
            SizedBox(height: size.height * 0.1),
            ForgotPasswordForm(),
          ]),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
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
                  borderSide: BorderSide(color: kTextColor2),
                  gapPadding: 10,
                ),
                suffixIcon: CustomSuffixIcon(
                  svgIcon: "assets/icons/Mail.svg",
                )),
          ),
          SizedBox(height: size.height / 30),
          FormError(errors: errors),
          SizedBox(height: size.height * 0.1),
          DefaultButton(
            text: "Send",
            press: () {
              if(_formKey.currentState.validate()){
                
              }
            },
          ),
          SizedBox(height: size.height * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}
