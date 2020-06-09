import 'package:FlutterApp/UI/components/top_transaction_text.dart';
import 'package:flutter/material.dart';

class TopTransaction extends StatefulWidget {
  final IconData icon;
  final double amount;
  final String status;
  final String currency;
  final List<Color> colors;
  TopTransaction(
      this.icon, this.amount, this.status, this.currency, this.colors,
      {Key key})
      : super(key: key);

  _TopTransaction createState() => _TopTransaction();
}

class _TopTransaction extends State<TopTransaction> {
  Widget build(BuildContext context) {
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
              offset: Offset(2, 2),
              blurRadius: 10,
              spreadRadius: 1,
              color: Color(0x88000000),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                widget.icon,
                color: Color(0xFFFFFFFF),
                size: 30,
              ),
              TransactionText(widget.amount, widget.status, widget.currency)
            ],
          ),
        ),
      ),
    );
  }
}
