import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:marbot/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
        () => Navigator.of(context).pushReplacementNamed('/intro'));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/walppaper.jpeg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ColorizeAnimatedTextKit(
                    text: [
                      "Marbot",
                    ],
                    textStyle: TextStyle(
                        fontSize: 75.0,
                        fontFamily: 'Lateef',
                        fontWeight: FontWeight.normal),
                    colors: [
                      TemaApp.whiteColor,
                      TemaApp.greenColorDark,
                      TemaApp.greenColorDeepDark,
                      TemaApp.gradientRightColor
                    ],
                    textAlign: TextAlign.start,
                    // or Alignment.topLeft
                  ),
                ),
              ],
            ),
            bottomNavigationBar:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text("MelekTech",
                    style: new TextStyle(
                        color: TemaApp.greenColorLight,
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal)),
              ),
            ]))
      ],
    );
  }
}
