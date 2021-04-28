import 'package:flutter/material.dart';
import 'package:opentdb_client/opentdb_client.dart';
import 'package:quizia/components/button.dart';
import 'package:quizia/constants.dart';
import 'package:simple_timer/simple_timer.dart';

void main() {
  runApp(Question());
}

class Question extends StatefulWidget {
  final List<OpentdbQuizItem> quizItem;
  Question({this.quizItem});
  @override
  _QuestionState createState() => _QuestionState(quizItem);
}

class _QuestionState extends State<Question>
    with SingleTickerProviderStateMixin {
  _QuestionState(List<OpentdbQuizItem> quizItem) {
    this.quizItem = quizItem;
  }

  List<OpentdbQuizItem> quizItem;
  TimerController _timerController;
  int i = 0, score = 0, option = 9;
  TimerStyle _timerStyle = TimerStyle.ring;
  void checkAnswer() {
    if (option == quizItem[i].correctAnswerIndex) {
      score++;
    }
    if (i + 1 == ktotalQuestions) {
      print(score);
      Navigator.pop(context);
    } else {
      setState(() {
        i++;
        option = 9;
        _timerController.restart();
      });
    }
  }

  void initState() {
    _timerController = TimerController(this);
    super.initState();
    Future.delayed(
      Duration(milliseconds: 50),
      () {
        _timerController.start();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                          flex: 1,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: SimpleTimer(
                              progressIndicatorColor: secondaryColor,
                              progressTextStyle: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white54,
                              ),
                              duration: const Duration(seconds: 30),
                              controller: _timerController,
                              timerStyle: _timerStyle,
                              strokeWidth: 8,
                              onEnd: () {
                                checkAnswer();
                              },
                            ),
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Question ${i + 1}/10',
                      style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'Jost'),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.white10,
                      indent: 40,
                      endIndent: 40,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      quizItem[i].question,
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      ontap: () {
                        setState(() {
                          option = 0;
                        });
                      },
                      color: option == 0 ? secondaryColor : primaryColor,
                      option: quizItem[i].allAnswers[0],
                    ),
                    MyButton(
                      ontap: () {
                        setState(() {
                          option = 1;
                        });
                      },
                      color: option == 1 ? secondaryColor : primaryColor,
                      option: quizItem[i].allAnswers[1],
                    ),
                    MyButton(
                      ontap: () {
                        setState(() {
                          option = 2;
                        });
                      },
                      color: option == 2 ? secondaryColor : primaryColor,
                      option: quizItem[i].allAnswers[2],
                    ),
                    MyButton(
                      ontap: () {
                        setState(() {
                          option = 3;
                        });
                      },
                      color: option == 3 ? secondaryColor : primaryColor,
                      option: quizItem[i].allAnswers[3],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      onPressed: () {
                        //Navigator.pop(context);
                        checkAnswer();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      color: secondaryColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 55),
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Colors.white,
                            //fontFamily: 'Jost',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
