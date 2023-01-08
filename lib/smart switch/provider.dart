import 'package:flutter/material.dart';

import 'enums.dart';
import 'globals.dart';

class HomeModel extends ChangeNotifier {
  final List<double> _sliderValues = [1.0, 1.0, 1.0];
  List get sliderValues => _sliderValues;
  void setSliderValue(index, value) {
    setState(ViewState.Busy);
    _sliderValues[index] = value;
    notifyListeners();
  }

  double getFormula(index, width) =>
      Global.boxWidth +
      sliderValues[index] *
          (width - Global.boxWidth * 2 - Global.sidePadding * 4);

  double getStartWidth(width) =>
      width - Global.sidePadding * 4 - Global.boxWidth;

  final List<double> _widthValues = [0, 0, 0];
  get widthValues => _widthValues;
  void setWidth(index, width) {
    if (switchValues[index]) {
      _widthValues[index] = getFormula(index, width);
    } else {
      _widthValues[index] = width - Global.sidePadding * 4;
    }
    notifyListeners();
  }

  ViewState _state = ViewState.Idle;
  get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  final List<bool> _switchValues = [true, true, true];
  List get switchValues => _switchValues;
  void setSwitchValues(index, value) {
    setState(ViewState.Idle);
    _switchValues[index] = value;
    notifyListeners();
  }
}
