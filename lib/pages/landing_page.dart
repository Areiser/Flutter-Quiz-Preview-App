import 'package:flutter/material.dart';

import './quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2) => new QuizPage(),
          transitionsBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2, Widget child) {
            return new FadeTransition(
              child: child,
              opacity: animation1,
            );
          },
          transitionDuration: new Duration(milliseconds: 200)
        )),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Lets Quizzz", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),),
            new Padding(padding: new EdgeInsets.only(top: 10.0),),
            new Text("Tap the screen to start", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
