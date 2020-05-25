import 'package:flutter/material.dart';

class Header extends StatefulWidget{
  final String text;
  final List<OutlineButton> buttons;
  Header(this.text, {this.buttons, Key key}) : super(key: key);

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
        image: DecorationImage(
          image: AssetImage("assets/images/headerBG.png"),
          fit: BoxFit.cover
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        'Expenses',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    width: 115.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Color(0xFFB36DE7), width: 1.0)
                    ),
                  ),
                  Container(
                    child: Text(
                      'Income',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 17.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}