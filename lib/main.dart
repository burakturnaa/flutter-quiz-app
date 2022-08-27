import 'package:flutter/material.dart';
import './constants.dart';
import './questionList.dart';

void main() => runApp(KnowledgeTest());

class KnowledgeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> choices = [];
  QuestionList questionList_1 = QuestionList();

  void buttonClick(bool answer) {
    if (questionList_1.lastQuestion()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Congratulations! "),
            content: new Text("You answered all questions"),
            actions: [
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState((){
                    questionList_1.resetList();
                    choices = [];
                  });
                },
                child: new Text("Close"),
              )
            ],
          );
        },
      );


    } else {
      setState(() {
        questionList_1.getQuestionAnswer() == answer
            ? choices.add(kSuccessIcon)
            : choices.add(kFailedIcon);
        questionList_1.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionList_1.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          // direction: Axis.vertical,
          alignment: WrapAlignment.center,
          spacing: 3,
          runSpacing: 3,
          children: choices,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            buttonClick(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            bool correctAnswer =
                                questionList_1.getQuestionAnswer();
                            buttonClick(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
