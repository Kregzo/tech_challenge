import 'package:flutter/material.dart';

class CalViewModal with ChangeNotifier {
  String _display = 'No Data';

  String get display => _display;

  List<String> _history = [];

  List<String> get history => _history;

  String _flag = '';
  // String storedValue = '';
  double _output = 0;
  checkInput(String value) {
    if (value == '=') {
      double temp = double.parse(_display);
      if (_flag == '+') {
        addition(temp);
      }
      if (_flag == '-') {
        subtraction(temp);
      }
      if (_flag == '%') {
        division(temp);
      }
      if (_flag == 'x') {
        multiplication(temp);
      }
      addToHistory(_display);
      clearDisplay();
    } else if (value == '+') {
      _flag = '+';
      updateOutput();
    } else if (value == '-') {
      _flag = '-';
      updateOutput();
    } else if (value == '%') {
      _flag = '%';
      updateOutput();
    } else if (value == 'x') {
      _flag = 'x';
      updateOutput();
    } else if (value == '.') {
      addToDisplay(value);
    } else if (double.parse(value).isFinite) {
      addToDisplay(value);
    }
  }

  addToDisplay(String value) {
    if (_display == 'No Data') {
      clearDisplay();
    }
    _display += value;
    notifyListeners();
  }

  addToHistory(String value) {
    if (_history.length > 4) {
      _history.removeAt(0);
    }
    _history.add(value);
    notifyListeners();
  }

  clearDisplay() {
    _display = '';
    notifyListeners();
  }

  addition(double data) {
    addToHistory('+ $_display');
    _flag = '';
    _display = 'Result: ${_output + data}';
  }

  subtraction(double data) {
    addToHistory('- $_display');
    _flag = '';
    _display = 'Result: ${_output - data}';
  }

  multiplication(double data) {
    addToHistory('x $_display');
    _flag = '';
    _display = 'Result: ${_output * data}';
  }

  division(double data) {
    addToHistory('% $_display');
    _flag = '';
    _display = 'Result: ${_output / data}';
  }

  updateOutput() {
    _output = double.parse(_display);
    addToHistory(_display);
    clearDisplay();
  }
}
