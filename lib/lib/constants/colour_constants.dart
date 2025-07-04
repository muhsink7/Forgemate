import 'package:flutter/material.dart';

const Color tertiaryColor = Color(0xff3b476b);
const Color primaryColor = Color(0xff041b26);
const Color kWhiteColor = Colors.white;
const Color kBlackColor = Colors.black;
const Color kGreyColor = Colors.grey;
const Color kBlueGreyColor = Colors.blueGrey;

Color adjustColorBrightness(Color color, double amount) {
  assert(amount >= -1 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final hslModified = hsl.withLightness(
    (hsl.lightness + amount).clamp(0.0, 1.0),
  );
  return hslModified.toColor();
}
