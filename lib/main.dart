import 'package:flutter/material.dart';
import 'package:inventory_management/routes.dart';
import 'package:inventory_management/screens/Home/home_screen.dart';
import 'package:inventory_management/screens/Team%20Screen/Create%20Team/createTeam.dart';
import 'package:inventory_management/screens/Team%20Screen/teamScreen.dart';
import 'package:inventory_management/screens/login/complete_regist/Complete.dart';
import 'package:inventory_management/screens/login/forgot_password/forgot_password.dart';
import 'package:inventory_management/screens/login/sign_up/SignUp.dart';
import 'package:inventory_management/screens/splash_screen/splash_screen.dart';
import 'package:inventory_management/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'screens/Add Product/add_product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/SignUp':
            return PageTransition(
                child: SignUp(), type: PageTransitionType.rightToLeft);
            break;
          case '/CompleteProfile':
            return PageTransition(
                child: CompleteProfile(), type: PageTransitionType.rightToLeft);
            break;
          case '/TeamScreen':
            return PageTransition(
              child: TeamScreen(), type: PageTransitionType.rightToLeft);
            break;
          case '/CreateTeam':
            return PageTransition(
              child: CreateTeam(), type: PageTransitionType.rightToLeft);
            break;
          case '/HomeScreen':
            return PageTransition(
                child: HomeScreen(), type: PageTransitionType.fade);
            break;
          case '/ForgotPassword':
            return PageTransition(
                child: ForgotPasswordScreen(),
                type: PageTransitionType.rightToLeft);
            break;
          case '/FormAddProduct':
            return PageTransition(
                child: FormAddProduct(), type: PageTransitionType.topToBottom);
            break;
          default:
            return null;
        }
      },
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
