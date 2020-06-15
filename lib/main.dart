import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Photos.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app',
      home: Photos(),
    );
  }
}

