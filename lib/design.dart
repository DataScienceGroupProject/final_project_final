import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const KTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
    hintStyle: TextStyle(color: Colors.white),
    filled: true,
    fillColor: Color(0xFF5D6978),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF5BC0BE), width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
    // add the following line
    // fillColor: Color(0xFFB2BEB5),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF5BC0BE), width: 4.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);