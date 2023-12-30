import 'package:flutter/material.dart';

// Declare a nullable Color variable named _customColor
Color? _customColor;

// Declare a nullable Color variable named _customButtonColor
Color? _customButtonColor;

// Declare a nullable Color variable named _customDrawerColor
Color? _customDrawerColor;

// Define an extension on ThemeData named CustomThemeData
extension CustomThemeData on ThemeData {
  // Define a getter for _customColor
  // This allows you to access _customColor as if it were a property of ThemeData
  Color? get customColor => _customColor;

  // Define a setter for _customColor
  // This allows you to set _customColor as if it were a property of ThemeData
  set customColor(Color? color) {
    _customColor = color;
  }

  // Define a getter for _customButtonColor
  // This allows you to access _customButtonColor as if it were a property of ThemeData
  Color? get customButtonColor => _customButtonColor;

  // Define a setter for _customButtonColor
  // This allows you to set _customButtonColor as if it were a property of ThemeData
  set customButtonColor(Color? color) {
    _customButtonColor = color;
  }

  // Define a getter for _customDrawerColor
  // This allows you to access _customDrawerColor as if it were a property of ThemeData
  Color? get customDrawerColor => _customDrawerColor;

  // Define a setter for _customDrawerColor
  // This allows you to set _customDrawerColor as if it were a property of ThemeData
  set customDrawerColor(Color? color) {
    _customDrawerColor = color;
  }
}

/*
The CustomThemeData extension is used to add new properties to ThemeData. 
Extensions allow you to add new functionality to existing classes, 
even if you don't have access to the original source code. 
In this case, we're adding three new properties to ThemeData: 
customColor, customButtonColor, and customDrawerColor. 
These properties allow you to customize the colors used in your Flutter app.
*/
