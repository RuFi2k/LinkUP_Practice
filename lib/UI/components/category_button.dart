import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  VoidCallback onClick;

  CategoryButton(
      {Key key,
      this.icon,
      this.text,
      this.color = const Color(0xFF000000),
      this.category,
      this.onClick})
      : super(key: key);
  final IconData icon;
  final String text;
  final Color color;
  final TransactionCategoriesEnum category;
  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      width: 110.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xFFFFFFFF),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 10,
            spreadRadius: 1,
            color: Color(0x88000000),
          ),
        ],
      ),
      child: FlatButton(
        onPressed: () {
          widget.onClick();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(widget.icon, color: widget.color, size: 30),
              Text(widget.text,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 12))
            ],
          ),
        ),
      ),
    );
  }
}
