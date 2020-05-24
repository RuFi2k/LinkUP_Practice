import 'package:flutter/material.dart';

class Transaction extends StatefulWidget{
  final IconData icon;
  final double amount;
  final String status;
  final String currency;
  final List<Color> colors;
  Transaction(this.icon, this.amount, this.status, this.currency, this.colors, {Key key}) : super(key: key);

  _Transaction createState() => _Transaction();
}

class _Transaction extends State<Transaction>{
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 125.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [widget.colors[0], widget.colors[1]],
          ),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 10.0,
              spreadRadius: 1.0,
              color: Color(0x88000000),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                widget.icon,
                color: Color(0xFFFFFFFF),
                size: 30.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      '${widget.amount < 0 ? '-' : '+'}${widget.currency}${widget.amount.abs().toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                        fontSize: 17.0,
                      )
                  ),
                  Text(
                      widget.status,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 13.0,
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}