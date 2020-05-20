import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/Constants.dart';
import 'dart:async';
import 'package:quiz_app/quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List myColors = [0xff4CAF50, 0xffFFEB3B, 0xff03A9F4, 0xfff44336, 0xff9E9E9E];

  Quiz quiz;
  List<QuizQuestions> questionList;

  int points = 0;
  int c = 0, q = 0;
  bool isQuizover = false;
  bool soundGen = false;

  Future getData() async {
    http.Response response =
        await http.get('http://www.mocky.io/v2/5ebd2f5f31000018005b117f');
    var data = jsonDecode(response.body);
    quiz = Quiz.fromJson(data);
    questionList = quiz.quizQuestions;
  }

  resetQuiz() {
    q = 0;
    c = 0;
    points = 0;
  }

  checkAnswer(String que, String ans) async {
    if (q < questionList.length - 1) {
      for (int i = 0; i < 4; i++) {
        if (ans == questionList[q].answers[i].answers &&
            questionList[q].answers[i].isTrue) {
          points+=10;
          soundGen=true;
        }
      }
      q++;
      c++;
    } else
      setState(() {
        isQuizover = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(myColors[c]),
        elevation: 0.0,
      ),
      body: Container(
        // color: Color(0xffECEFF1),
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press Start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) return Container();

                  if (isQuizover == true) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(points.toString(),
                        style: qstnTxt,),
                        Text('Points',
                        style: ansTxt,
                        ),
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              resetQuiz();
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text(
                            'Play Again',
                            style: btnTxt,
                          ),
                        )
                      ],
                    ));
                  }

                  if (q < questionList.length) {
                    print(q);
                    print(questionList.length);
                    print(isQuizover);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Color(myColors[c]),
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(24.0),
                                child: Text(
                                  questionList[q].questions,
                                  style: qstnTxt,
                                  textAlign: center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      checkAnswer(questionList[q].questions,
                                          questionList[q].answers[0].answers);
                                    });
                                  },
                                  child: Container(
                                    width: w,
                                    height: h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(myColors[c])),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: Center(
                                        child: Text(
                                      '1. ' +
                                          questionList[q].answers[0].answers,
                                      style: ansTxt,
                                      textAlign: center,
                                    )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      checkAnswer(questionList[q].questions,
                                          questionList[q].answers[1].answers);
                                    });
                                  },
                                  child: Container(
                                    width: w,
                                    height: h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(myColors[c])),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: Center(
                                        child: Text(
                                      '2. ' +
                                          questionList[q].answers[1].answers,
                                      style: ansTxt,
                                      textAlign: center,
                                    )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      checkAnswer(questionList[q].questions,
                                          questionList[q].answers[2].answers);
                                    });
                                  },
                                  child: Container(
                                    width: w,
                                    height: h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(myColors[c])),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: Center(
                                        child: Text(
                                      '3. ' +
                                          questionList[q].answers[2].answers,
                                      style: ansTxt,
                                      textAlign: center,
                                    )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      checkAnswer(questionList[q].questions,
                                          questionList[q].answers[3].answers);
                                    });
                                  },
                                  child: Container(
                                    width: w,
                                    height: h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(myColors[c])),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: Center(
                                        child: Text(
                                      '4. ' +
                                          questionList[q].answers[3].answers,
                                      style: ansTxt,
                                      textAlign: center,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
              }
              return null;
            }),
      ),
    );
  }
}
