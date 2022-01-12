import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:marbot/utils/colors.dart';


class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isLogin = false;
  int _slideIndex = 0;
  static const dotLength = 3;
  final pageIndexNotifier = ValueNotifier<int>(0);

//  int defaultScreenWidth = 1080;
//  int defaultScreenHeight = 1920;

  Timer checkTimer;

  final List<String> images = [
    "assets/images/marbot.png",
    "assets/images/haji.png",
    "assets/images/algoritma.png",
  ];

  final IndexController controller = IndexController();

  @override
  void initState() {
    super.initState();

    checkTimer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      if (this._slideIndex > 2) {
        controller.move(0);
        this._slideIndex = 0;
      } else {
        this._slideIndex++;
        controller.move(this._slideIndex);
      }
    });
  }

  @override
  void dispose() {
    checkTimer?.cancel();
    super.dispose();
  }

  Widget dotIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        PageViewIndicator(
          pageIndexNotifier: pageIndexNotifier,
          length: dotLength,
          normalBuilder: (animationController, index) => Circle(
            size: 10.0,
            color: Colors.grey,
          ),
          highlightedBuilder: (animationController, index) => ScaleTransition(
            scale: CurvedAnimation(
              parent: animationController,
              curve: Curves.ease,
            ),
            child: Circle(
              size: 12.0,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  Widget button() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/chatbot');
            },
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Lewati',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Comfortaa',
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget buildSlider() {
    return Column(
      children: <Widget>[
        Expanded(
          child: TransformerPageView(
            pageSnapping: true,
            loop: true,
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemCount: 3,
            onPageChanged: (index) {
              setState(() {
                this._slideIndex = index;
                pageIndexNotifier.value = index;
              });
            },
            transformer: PageTransformerBuilder(
              builder: (Widget child, TransformInfo info) {
                return Container(
                  // child: Text("hai"),
                  child: Image.asset(
                    images[info.index],
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
        ),
        dotIndicator(),
        button()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(backgroundColor: TemaApp.grey, body: buildSlider());
  }
}
