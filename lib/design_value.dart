import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color categoryTitleColor = Colors.white;
Color categoryTitleInactiveColor = Colors.white54;
TextStyle categoryTitleActiveStyle = TextStyle(
  fontSize: 12.0,
  letterSpacing: 1.0,
  color: categoryTitleColor,
  fontWeight: FontWeight.bold,
);
TextStyle categoryTitleInactiveStyle = TextStyle(
  fontSize: 12.0,
  letterSpacing: 1.0,
  color: categoryTitleInactiveColor,
  fontWeight: FontWeight.bold,
);

Color bottomBarColor = Colors.white;

Color themeColor = Color.fromARGB(250, 0, 77, 77);

AppBar appBar = AppBar(
  elevation: 0,
  backgroundColor: themeColor,
  title: Text(
    'WhatsApp',
    style: TextStyle(),
  ),
  actions: <Widget>[
    IconButton(icon: Icon(Icons.search), onPressed: (){}),
    IconButton(icon: Icon(Icons.more_vert), onPressed: (){}),
  ],
);

TextStyle titleStyle = TextStyle(
  fontSize: 16.0,
  letterSpacing: 1.0,
);