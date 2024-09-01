import 'package:flutter/material.dart';
import 'package:test_project/core/constants/colors.dart';

class AppTextStyles {
  static const String fontName = 'poppins';

  static TextStyle star(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 1.2;
    return TextStyle(
      color: AppColors.errorTextColor,
      fontSize: screenWidth * 0.035,
      fontWeight: FontWeight.w500,
      height: 1.5,
    );
  }

  static TextStyle regular16(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 1.2;
    return TextStyle(
      fontFamily: fontName,
      fontSize: screenWidth * 0.04,
      fontWeight: FontWeight.w600,
      height: 1.5,
    );
  }

  static TextStyle regular14(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 1.2;
    return TextStyle(
      fontFamily: fontName,
      fontSize: screenWidth * 0.035,
      fontWeight: FontWeight.w400,
      height: 1.5,
    );
  }

  static TextStyle regular12(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 1.3;
    return TextStyle(
      fontFamily: fontName,
      fontSize: screenWidth * 0.03,
      fontWeight: FontWeight.w400,
      height: 1.67,
    );
  }

  static TextStyle bold14(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 1.3;
    return TextStyle(
      fontFamily: fontName,
      fontSize: screenWidth * 0.035,
      fontWeight: FontWeight.w500,
      height: 1.5,
    );
  }

  static TextStyle italic12(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 1.3;
    return TextStyle(
      fontFamily: fontName,
      fontSize: screenWidth * 0.03,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      height: 1.67,
    );
  }

  static TextStyle title14(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 1.3;
    return TextStyle(
      fontFamily: fontName,
      fontSize: screenWidth * 0.035,
      fontWeight: FontWeight.w500,
      height: 1.5,
    );
  }
}
