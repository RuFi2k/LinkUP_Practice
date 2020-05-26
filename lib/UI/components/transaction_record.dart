import 'package:flutter/material.dart';

class TransactionRecord extends StatefulWidget{
  final double amount;
  final String description;
  TransactionRecord(this.amount, this.description, {Key key}) : super(key: key);

  _TransactionRecord createState() => _TransactionRecord();
}

class _TransactionRecord extends State<TransactionRecord>{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.5),
      child: Container(
        height: 75,
        width: 350,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              getAmount(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              widget.description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getAmount(){
    return '${widget.amount > 0 ? "+" : "-"}\$${widget.amount.abs().toStringAsFixed(2)}';
  }
}