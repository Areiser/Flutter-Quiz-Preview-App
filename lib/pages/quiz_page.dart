import 'package:flutter/material.dart';
import './score_page.dart';
import '../misc/quiz.dart';
import '../misc/question.dart';
import '../UI/correct_wrong_overlay.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([new Question("Pizza is a decent meal", true), new Question("Elon Musk is a human", false),
    new Question("Weels are square", false), new Question("Flutter is awesome", true), new Question("Donuts are healty", false)
  ]);
  String questionText;
  int questionNumber;
  bool overlayShouldBeVisible = false;
  bool isCorrect;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionNumber = quiz.questionNumber;
    questionText = currentQuestion.question;
  }

  void handleAnswer(bool answer) {
    isCorrect = answer == currentQuestion.answer;
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Material(
          color: Colors.blueAccent,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Expanded(
                child: new AnswerButton(true, () => handleAnswer(true)),
              ),
              new Container(
                color: Colors.white,
                padding: new EdgeInsets.symmetric(vertical: 20.0),
                child: new Center(
                  child: new QuestionText(questionText, questionNumber),
                ),
              ),
              new Expanded(
                child: new AnswerButton(false, () => handleAnswer(false)),
              ),
            ],
          ),
        ),
        overlayShouldBeVisible ? 
          new CorrectWrongOverlay(isCorrect, () {
            if (questionNumber == quiz.length) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (_) => new ScorePage(quiz.score, quiz.length)), (Route r) => r == null);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }) 
          : new Container()
      ],
    );
  }
}