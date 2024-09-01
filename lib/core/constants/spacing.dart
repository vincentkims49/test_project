import 'package:flutter/material.dart';

class ResponsiveSpacing {
  final double screenWidth;

  ResponsiveSpacing(BuildContext context)
      : screenWidth = MediaQuery.of(context).size.width;

  double get smallSpacing => screenWidth * 0.02;
  double get mediumSpacing => screenWidth * 0.04;
  double get largeSpacing => screenWidth * 0.08;
}
