import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {

  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  String get question => _question;

  @override
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {

  Animation<double> fontSizeAnimation;
  AnimationController fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    fontSizeAnimationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 500));
    fontSizeAnimation = new CurvedAnimation(curve: Curves.decelerate, parent: fontSizeAnimationController)
      ..addListener(() => this.setState(() {}));
    fontSizeAnimationController.forward();
  }

  @override
  void dispose() {
    fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("updated1");
    if (oldWidget._question != widget._question) {
      fontSizeAnimationController.reset();
      fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Text(
      "Statement ${widget._questionNumber.toString()}: " + widget._question,
      style: new TextStyle(fontSize: fontSizeAnimation.value * 16.0)
    );
  }

}