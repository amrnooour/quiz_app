import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/ui/utils/app_assets.dart';

import 'home_page.dart';

class ScorePage extends StatelessWidget {
  static const routeName = "scorePage";

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()),
          ),
          child: const Icon(
            Icons.navigate_before,
            color: Colors.black54,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.score),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Text(
                'Your Score ${_controller.userName}',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black54,
                ),
              ),
              Text(
                (_controller.numberOfCorrectAnswer == null)
                    ? '0/${_controller.questions.length}'
                    : '${_controller.numberOfCorrectAnswer}/${_controller.questions.length}',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
