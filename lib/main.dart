import 'package:flutter/material.dart';
import 'package:FlutterApp/UI/screens/menu.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Testing my app';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MenuWidget(),
    );
  }
}