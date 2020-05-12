import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'calculator.dart';

void main() => runApp(MaterialApp(
  home: WelcomeScreen(),
));

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: MyApp(),
      title: Text('Welcome to Calculator',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
      image: Image.asset('assets/images/calculator.png'),
      gradientBackground: LinearGradient(colors: [Colors.cyan, Colors.black], begin: Alignment.topLeft, end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.orange,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}