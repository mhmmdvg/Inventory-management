import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/animations/FadeAnimations.dart';
import 'package:inventory_management/components/no_account_text.dart';
import 'package:inventory_management/components/social_card.dart';
import 'package:inventory_management/screens/login/sign_in/components/sign_form.dart';

class Body extends StatelessWidget {
  // final bool isUser;

  // Body(this.isUser);

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size; 
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.06,),
                    FadeAnimation(1.2,
                      AutoSizeText(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FadeAnimation(1.5,
                      AutoSizeText(
                        'Sign in with your email and password  \nor continue with social media',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8B8B8B)
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.08,),
                    FadeAnimation(1.8, SignForm()),
                    SizedBox(height: size.height * 0.05,),
                    FadeAnimation(1.11,
                     Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialCard(
                            icon: "assets/icons/google-icon.svg",
                            press: (){},
                          ),
                          SocialCard(
                            icon: "assets/icons/facebook-2.svg",
                            press: (){},
                          ),
                           SocialCard(
                            icon: "assets/icons/twitter.svg",
                            press: (){},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height / 200),
                    FadeAnimation(1.0, NoAccountText()),
                  ]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}