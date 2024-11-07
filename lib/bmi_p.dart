import 'package:flutter/cupertino.dart';

class BmiProvider extends ChangeNotifier {
  bool isFemale = false;
  bool isMale = false;
  double height = 170;
  double bmi = 0;
  int weight = 60;
  int age = 20;
  String resultText = '';

  void buttonPress(String type) {
    if (type == "male") {
      isMale = true;
      isFemale = false;
    } else if (type == 'female') {
      isMale = false;
      isFemale = true;
    }
    notifyListeners();
  }

  void restType() {
    isMale = false;
    isFemale = false;
    notifyListeners();
  }

  void addValue(String type) {
    if (type == "weight") {
      weight++;
    } else {

    }
    notifyListeners();
  }

  void removeValue(String type) {
    if (type == "weight") {
      weight--;
    } else {

    }
    notifyListeners();
  }
  void addage(String type) {
    if (type == "Age") {
      age++;
    } else {

    }
    notifyListeners();
  }

  void removeage(String type) {
    if (type == "Age") {
      age--;
    } else {

    }
    notifyListeners();
  }

  void changeSlider(double value) {
    height = value;
    notifyListeners();
  }

}
