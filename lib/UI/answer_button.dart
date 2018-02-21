import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final bool _answer;
  final VoidCallback _onPressed;

  AnswerButton(this._answer, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: _answer == true ? Colors.greenAccent : Colors.redAccent,
      child: new InkWell(
        onTap: () => _onPressed(),
        child: new Center(
          child: new Container(
            decoration: new BoxDecoration(
              border: new Border.all(color: Colors.white, width: 5.0),
            ),
            padding: new EdgeInsets.all(20.0),
            child: new Text(
              _answer == true ? "TRUE" : "FALSE",
              style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40.0, fontStyle: FontStyle.italic)
            ),
          ),
        ),
      )
    );
  }
}