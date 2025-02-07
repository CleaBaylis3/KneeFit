import 'package:flutter/material.dart';

// Define your custom text styles
class TextStyles {
  static const TextStyle maintitle = TextStyle(
    fontFamily: 'Jost',  // Replace with your desired font
    fontSize: 40,
    fontWeight: FontWeight.w800,
    color: Color.fromARGB(255, 255, 255, 255),
    letterSpacing: 1.0,
    shadows: [
      Shadow(
        blurRadius: 10.0,
        color: Color.fromRGBO(0, 0, 0, 0.3),
        offset: Offset(2.0, 2.0),
      ),
    ],
  );

  static const TextStyle title = TextStyle(
    fontFamily: 'Jost',  // Replace with your desired font
    fontSize: 35,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 255, 255, 255),
    letterSpacing: 1.0,
    shadows: [
      Shadow(
        blurRadius: 10.0,
        color: Color.fromRGBO(0, 0, 0, 0.3),
        offset: Offset(2.0, 2.0),
      ),
    ],
  );

  static const TextStyle button = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 255, 255, 255), // Soft grey color for description
    letterSpacing: 1.0,
  );

  static const TextStyle subheading = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 0, 0, 0),
    letterSpacing: 1.0,
  );

  static const TextStyle calendardate = TextStyle(
    fontFamily: 'Rubik',  // Replace with your desired font
    fontSize: 20,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  static const TextStyle calendartitle = TextStyle(
    fontFamily: 'Rubik',  // Replace with your desired font
    fontSize: 15,
    color: Color.fromARGB(255, 0, 0, 0),
  );

    static const TextStyle calendarprevdate = TextStyle(
    fontFamily: 'Rubik',  // Replace with your desired font
    fontSize: 12,
    color: Color.fromARGB(255, 135, 135, 135),
  );


  static const TextStyle exercise = TextStyle(
    fontFamily: 'Rubik',  // Replace with your desired font
    fontSize: 20,
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: FontWeight.w600,
  );

}
