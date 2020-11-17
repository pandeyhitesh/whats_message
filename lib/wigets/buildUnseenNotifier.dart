import 'package:flutter/material.dart';
import 'package:whats_message/design_value.dart';

Widget buildUnseenNotifier(String unseenCount,String isActive, String title){
  return Container(
    height: 20,
    width: 20,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: isActive == title ?categoryTitleColor : categoryTitleInactiveColor,
    ),
    child: Center(
      child: Text(
        unseenCount,
        style: TextStyle(
          fontSize: 10,
          color: themeColor,
        ),
      ),
    ),
  );
}