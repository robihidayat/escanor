
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  _SpashScreanState createState()=> _SpashScreanState();
}
class _SpashScreanState extends State<SplashScreen>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset(
          "assets/img_gojek_logo.png",
          height: 100.0,
          width: 200.0,
        ),
      ),
    );
  }
}
