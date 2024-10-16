import 'package:flutter/material.dart';

class AppTheme {
  static Color appPrimaryColor(BuildContext context) {
    return AppColors.primaryColor;
  }

  static Color appBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? AppColors.lightBackgroundColor : AppColors.darkBackgroundColor;
  }

  static Color primaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? AppColors.lightTextColor : AppColors.darkTextColor;
  }

  static Color primaryActionColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? AppColors.lightActionColor : AppColors.darkActionColor;
  }

  static Color greenColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? AppColors.lightGreenColor : AppColors.darkGreenColor;
  }

  static Color blueColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? AppColors.lightBlueColor : AppColors.darkBlueColor;
  }

  static Color yellowColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? AppColors.lightYellowColor : AppColors.darkYellowColor;
  }
}

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 74, 98, 107);

  // Light theme specific colors
  static const Color lightBackgroundColor = Color.fromARGB(255, 34, 34, 34);
  static const Color lightCardColor = Color.fromARGB(255, 125, 125, 125);
  static const Color lightTextColor = Colors.white;
  static const Color lightActionColor = Colors.amber;
  static const Color lightGreenColor = Color.fromARGB(255, 109, 146, 109);
  static const Color lightBlueColor = Color.fromARGB(255, 76, 115, 141);
  static const Color lightYellowColor = Color.fromARGB(255, 194, 166, 8);
  // Dark theme specific colors
  static const Color darkBackgroundColor = Color.fromARGB(255, 34, 34, 34);
  static const Color darkCardColor = Color.fromARGB(255, 125, 125, 125);
  static const Color darkTextColor = Colors.white;
  static const Color darkActionColor = Colors.amber;
  static const Color darkGreenColor = Color.fromARGB(255, 78, 131, 78);
  static const Color darkBlueColor = Color.fromARGB(255, 50, 188, 230);
  static const Color darkYellowColor = Color.fromARGB(255, 201, 138, 0);
}
