import 'dart:math';
import 'package:flutter/material.dart';

class CorrectWrongOverlay extends StatefulWidget {

  final VoidCallback _onTap;
  final bool _isCorrect;

  CorrectWrongOverlay(this._isCorrect, this._onTap);

  @override
  State createState() => new CorrectWrongOverlayState(_isCorrect, _onTap);
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

  final VoidCallback _onTap;
  final bool _isCorrect;

  Animation<double> iconAnimation;
  AnimationController iconAnimationController;

  CorrectWrongOverlayState(this._isCorrect, this._onTap);

  @override
  void initState() {
    super.initState();
    iconAnimationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 2000));
    iconAnimation = new CurvedAnimation(curve: Curves.elasticOut, parent: iconAnimationController)
      ..addListener(() => this.setState(() {}));
    iconAnimationController.forward();
  }

  @override
  void dispose() {
    iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => _onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: new Transform.rotate(
                angle: 2 * PI * iconAnimation.value,
                child: new Icon(_isCorrect ? Icons.done : Icons.clear, size: iconAnimation.value * 80.0,),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0),),
            new Text(_isCorrect ? "Correct!" : "Wrong!", style: new TextStyle(color: Colors.white, fontSize: 30.0)),
          ],
        ),
      )
    );
  }
}