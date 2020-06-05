import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final String text;
  final List<OutlineButton> buttons;
  Header(this.text, {this.buttons, Key key}) : super(key: key);

  _Header createState() => _Header();
}

class _Header extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9C0EEE), Color(0xFF3D02A0)],
        ),
        image: DecorationImage(
            image: AssetImage("assets/images/headerBG.png"), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
