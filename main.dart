import 'package:flutter/material.dart';
// import 'package:instagram_clone_/controller.dart';
import 'package:instagram/sign_up.dart';
import 'package:instagram/home_page.dart';
import 'package:instagram/login_page.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget firstWidget = await firstScreen();

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: firstWidget));
}

Future<Widget> firstScreen() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString('isSignUp') == 'true') {
    if (prefs.getString('isLogin') == 'true') {
      return HomePage();
    } else {
      return LoginPage();
    }
  } else {
    return SignUpPage();
  }
}
