import 'package:FlutterApp/BL/Enums/TransactionCategories.dart';
import 'package:FlutterApp/BL/Models/TransactionRecordModel.dart';
import 'package:FlutterApp/UI/pages/CategoryTransactions.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  CategoryButton({Key key,
                  this.icon,
                  this.text,
                  this.color = const Color(0xFF000000),
                  this.category
                }) : super(key: key);
  final IconData icon;
  final String text;
  final Color color;
  final TransactionCategoriesEnum category;
  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton>{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 65.0,
      width: 110.0,
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
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  CategoryTransactions(widget.category,
                      <TransactionRecordModel>[
                        new TransactionRecordModel(40.0, 'Description'),
                        new TransactionRecordModel(-25.0, 'New Description'),
                      ]),
            )
          );
        },
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
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0
              ))
            ],
          ),
        ),
      ),
    );
  }
}