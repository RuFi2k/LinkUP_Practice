import 'package:flutter/material.dart';

class Header extends StatefulWidget{
  Header({Key key}) : super(key: key);

  _Header createState() => _Header();
}

class _Header extends State<Header>{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9C0EEE), Color(0xFF3D02A0)],
        ),
      ),
    );
  }
}