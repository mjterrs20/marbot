import 'package:flutter/material.dart';
import 'package:marbot/pages/splashscreen.dart';
import 'package:marbot/pages/chatbot.dart';
import 'package:marbot/pages/intro.dart';

void main() {
  return runApp( MyApp ());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Marbot',
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/chatbot': (BuildContext context) => ChatbotPage(),
        '/intro': (BuildContext context) => IntroPage(),
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