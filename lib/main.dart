import 'package:flutter/material.dart';
import 'package:login_app/Screeen/home_screen.dart';
import 'package:login_app/Screeen/login_screen.dart';
import 'package:login_app/Screeen/register_screen.dart';
import 'package:login_app/Screeen/splesh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isIntroVisited = prefs.getBool("isIntroVisited") ?? false;
  bool? isLogin = prefs.getBool("isLogin") ?? false;
  bool? isRemember = prefs.getBool("isRemember") ?? false;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    initialRoute: (isIntroVisited == false)
        ? "splesh"
        : (isLogin == false)
        ? "register"
        : (isRemember == false)
        ? "login"
        : "/",
    routes: {
      "/": (context) => const Home_page(),
      'register': (context) => const Register_page(),
      'login': (context) => const Login_page(),
      'splesh': (context) => const Splesh_screen(),
    },
  ),
  );
}



