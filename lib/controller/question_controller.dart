import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/question.dart';
import 'package:quiz_app/ui/screens/score_page.dart';

class QuestionController extends GetxController with SingleGetTickerProviderMixin{
  late String _userName;
  String get userName => _userName;
  set userName(String name){
    _userName = name;
  }

    late AnimationController _animationController;
    late Animation _animation;
    Animation get animation => _animation;


  late PageController _pageController;
  PageController get pageController => _pageController;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAnswer;
  int get correctAnswer => this._correctAnswer;

  late int _selectedAnswer;
  int get selectedAnswer => this._selectedAnswer;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numberOfCorrectAnswer = 0;
  int get numberOfCorrectAnswer => _numberOfCorrectAnswer;

  List<Question> _questions = questionList
      .map((q) => Question(
    id: q['id'],
    question: q['question'],
    options: q['options'],
    answer: q['correct_answer'],
  ))
      .toList();
  List<Question> get questions => this._questions;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) {
      _numberOfCorrectAnswer++;
    }

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(microseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      (BuildContext context){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>ScorePage()));
      };
    }
  }

  void updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}

