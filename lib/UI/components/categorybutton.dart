import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  CategoryButton({Key key,
                  this.icon,
                  this.text,
                  this.color = const Color(0xFF000000)
                }) : super(key: key);
  final IconData icon;
  final String text;
  final Color color;
  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton>{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 65.0,
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xFFFFFFFF),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 10.0,
            spreadRadius: 1.0,
            color: Color(0x88000000),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              widget.icon,
              color: widget.color,
              size: 30.0
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold
            ))
          ],
        ),
      ),
    );
  }
}