
// ignore_for_file: equal_keys_in_map

import 'package:diabe/screens/diet/diet.dart';
import 'package:diabe/screens/profile/profile.dart';
import 'package:diabe/screens/signupdetails/signupdetails.dart';
import 'package:flutter/material.dart';
import '../screens/login/login.dart';
import '../screens/predict/predict.dart';
import '../screens/report/report.dart';
import '../screens/signup/signup.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> _routes = {
    Login.routeName: (context) => const Login(),
    Signup.routeName: (context) => const Signup(),
    signupDetails.routeName:(context) => const signupDetails(),
    ReportScreen.routeName: (context) => const ReportScreen(),
    Predictform.routeName: (context) => const Predictform(),
    Diet.routeName:(context) => const Diet(),
    Profile.routeName:(context) => const Profile(),
    '/login': (context) => const Login(),
    '/signup': (context) => const Signup(),
    'signupdetails':(context) => const signupDetails(),
    '/report': (context) => const ReportScreen(),
    '/predictform':(context) => const Predictform(),
    '/diet':(context) => const Diet(),
    '/profile':(context) => const Profile()
  };
  static Map<String, WidgetBuilder> get routes => _routes;
}