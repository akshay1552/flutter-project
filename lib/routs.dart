import 'package:flutter/widgets.dart';
import 'package:codelab/screens/splash/forget_password/forget_password_screen.dart';
import 'package:codelab/screens/splash/login_success/login_success_screen.dart';
import 'package:codelab/screens/splash/sign_in/sign_in_screen.dart';
import 'package:codelab/screens/splash/sign_up/sign_up_screen.dart';
import 'package:codelab/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
};
