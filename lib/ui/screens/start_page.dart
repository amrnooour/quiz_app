import 'package:flutter/material.dart';
import 'package:quiz_app/ui/screens/question_page.dart';
import 'package:quiz_app/ui/screens/score_page.dart';

class StartPage extends StatelessWidget {
  static const routeName= "startPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FloatingActionButton(onPressed: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> ScorePage()));
          },
          child: const Text("Skip"),
          )
        ],
      ),
      body: QuestionPage(),
    );
  }
}
