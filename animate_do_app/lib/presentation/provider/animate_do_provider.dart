import 'package:flutter/material.dart';

class AnimateDoProvider extends ChangeNotifier{
  bool twitterIsAnimated = false;
  int number = 0;
  AnimationController? bounceController;

  Future<void> addNumber() async {
    number++;
    if (number >= 2 && bounceController != null){
      bounceController!.forward(from: 0.0);
    }
    notifyListeners();
  }

  Future<void> animateController(AnimationController controller) async {
    bounceController = controller;
    // notifyListeners();
  }

  Future<void> becomeTwitterTrue() async {
    twitterIsAnimated = true;
    notifyListeners();
    print(twitterIsAnimated);

    await Future.delayed(Duration(milliseconds: 1100));
    
    twitterIsAnimated = false;
    // print(twitterIsAnimated);
    notifyListeners();
  }
}