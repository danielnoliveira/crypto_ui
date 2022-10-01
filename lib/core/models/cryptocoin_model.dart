import 'package:flutter/widgets.dart';

class CryptoCoinModel {
  String name;
  String shortName;
  double value;
  double appreciation;
  String iconPath;
  Color bgColor;
  CryptoCoinModel({
    required this.name,
    required this.shortName,
    required this.value,
    required this.appreciation,
    required this.iconPath,
    required this.bgColor,
  });

  String getAppreciationString() {
    String leftSymbol = "";
    if (appreciation > 0) {
      leftSymbol = "+";
    }
    if (appreciation < 0) {
      leftSymbol = '-';
    }
    return '$leftSymbol$appreciation%';
  }
}
