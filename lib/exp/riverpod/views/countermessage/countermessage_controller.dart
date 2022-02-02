import 'package:flutter/cupertino.dart';

class CounterMessageController extends ChangeNotifier {
  CounterMessageController();

  int counter = 0;
  String message = '';

  void changeMessage(String value) {
    message = value;
    notifyListeners();
  }

  void increment() {
    counter++;
    notifyListeners();
  }
}
