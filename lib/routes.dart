import 'package:flutter/widgets.dart';
import 'package:inventory_management/screens/Add%20Product/add_product.dart';
import 'package:inventory_management/screens/Home/home_screen.dart';
import 'package:inventory_management/screens/Team%20Screen/Create%20Team/createTeam.dart';
import 'package:inventory_management/screens/Team%20Screen/teamScreen.dart';
import 'package:inventory_management/screens/login/complete_regist/Complete.dart';
import 'package:inventory_management/screens/login/forgot_password/forgot_password.dart';
import 'package:inventory_management/screens/login/sign_up/SignUp.dart';
import 'package:inventory_management/screens/splash_screen/splash_screen.dart';
import 'screens/login/sign_in/sign_inScreen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  FormAddProduct.routeName: (context) => FormAddProduct(),
  SignUp.routeName: (context) => SignUp(),
  CompleteProfile.routeName: (context) => CompleteProfile(),
  TeamScreen.routeName: (context) => TeamScreen(),
  CreateTeam.routeName: (context) => CreateTeam(),
};
