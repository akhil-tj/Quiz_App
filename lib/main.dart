
import 'package:quiz_app/QuizPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/Constants.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.teal,
          title: Text(
            'Quizller',
            style: appBartxt,
          ),
        ),
        body: SafeArea(
          child: Start(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        height: 200,
        // color: Color(0xffECEFF1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage(),));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xff4CAF50),
                  ),
                  child: Center(
                    child: Text(
                      'Start',
                      style: btnTxt,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),       //Exit
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xfff44336),
                  ),
                  child: Center(
                    child: Text(
                      'Exit',
                      style: btnTxt,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
