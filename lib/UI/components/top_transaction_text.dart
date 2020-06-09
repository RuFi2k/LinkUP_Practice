import 'package:flutter/material.dart';

class TransactionText extends StatelessWidget{
  final double amount;
  final String status;
  final String currency;

  TransactionText(this.amount, this.status, this.currency);

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(getAmount(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
              fontSize: 17,
            )),
        Text(status,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 13,
            )),
      ],
    );
  }

  String getAmount() {
    return '${amount < 0 ? '-' : '+'}'
        '${currency}${amount.abs().toStringAsFixed(2)}';
  }
}