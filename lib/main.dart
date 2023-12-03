import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CommonWidget/image.dart';
import 'HomeScreen/Homepage.dart';
import 'LOGIN/Login_page.dart';
import 'LOGIN/sing_page.dart';
import 'Scheme/scheme.dart';

void main() async {
  runApp(MyApp());
  HttpOverrides.global = MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Playfair Display"),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        id: '',
      ),
    );
  }
}

int? globalUserId;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      checkLoginStatus();
    });
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? user_id = prefs.getInt('id');
    await Future.delayed(
        const Duration(seconds: 6)); // Display splash screen for 3 seconds
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => user_id != null
            ? HomePage(
                code: '',
                name: '',
              )
            : WelcomeScreen(
                id: '',
              ),
      ),
    );
    if (user_id != null) {
      globalUserId = user_id; // Assign the value to the global variable
      print("User ID: $globalUserId");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/Splash2.png",
          scale: 0.1,
        ),
      ),
    );
  }
}
