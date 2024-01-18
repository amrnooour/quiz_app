import 'package:flutter/material.dart';
import 'package:quiz_app/ui/screens/home_page.dart';
import 'package:quiz_app/ui/screens/score_page.dart';
import 'package:quiz_app/ui/screens/start_page.dart';
import 'package:quiz_app/ui/screens/question_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName :(_)=>HomePage(),
        StartPage.routeName :(_)=>StartPage(),
        ScorePage.routeName :(_)=>ScorePage(),
        QuestionPage.routeName :(_)=>QuestionPage()
      },
      initialRoute: HomePage.routeName,
    );
  }
}
