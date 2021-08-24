import 'package:flutter/material.dart';
import 'package:marbot/pages/splashscreen.dart';
import 'package:marbot/pages/homepage.dart';

void main() {
  return runApp( MyApp ());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'KP',
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/homepage': (BuildContext context) => HomePage(),
      },
      theme: ThemeData(
        primaryColor: Colors.green[600],
        primaryColorLight: Colors.amber[400],
        primaryIconTheme:
            Theme.of(context).primaryIconTheme.copyWith(color: Colors.white),
      ),
    );
  }
}