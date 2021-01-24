
import 'package:flutter/material.dart';


final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'Comfortaa',
);

final FTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Comfortaa',
    fontSize: 15
);

final kBoxDecorationStyle = BoxDecoration(
  //color: Color(0xFFbf1e2e),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final ButtonBoxDecorationStyle = BoxDecoration(
  //color: Color(0xFFbf1e2e),
  borderRadius: BorderRadius.circular(30.0),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFbf1e2e),
      Color(0xFFff887c),
    ],
  ),
);

final defaultColor=Color(0xFF000000);
final redColor=Color(0xFFbf1e2e);

final drawer_text=TextStyle(
  color: redColor,
  fontSize: 16
);
final settings_text=TextStyle(
    color: redColor,
    fontSize: 14
);
final settings_textfield=TextStyle(
    color: Colors.black,
    fontSize: 13
);