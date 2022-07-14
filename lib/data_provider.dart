import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'constants.dart';

class DataProvider extends ChangeNotifier {
  Gender gender;
  int height = 160;
  int weight = 70;
  int age = 39;
  double bmi;

  void setGender(Gender chosenGender) {
    gender = chosenGender;
    notifyListeners();
  }

  void setHeight(double newHeight) {
    height = newHeight.round();
    notifyListeners();
  }

  void increaseWeight() {
    weight++;
    notifyListeners();
  }

  void decreaseWeight() {
    weight--;
    notifyListeners();
  }

  void increaseAge() {
    age++;
    notifyListeners();
  }

  void decreaseAge() {
    age--;
    notifyListeners();
  }

  void calculateBMI() {
    final double heightInMeters = height / 100;
    bmi = weight / pow(heightInMeters, 2);
    notifyListeners();
  }

  String getBMIinterpretation() {
    if (bmi > 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
