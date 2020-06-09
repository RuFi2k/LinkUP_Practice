import 'package:flutter/material.dart';

class TotalAmount extends StatelessWidget {
  double total = 0;

  TotalAmount(this.total);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${generateAmountString()}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
    );
  }

  String generateAmountString() {
    return '${total < 0 ? "-" : "+"}\$${total.abs().toStringAsFixed(2)}';
  }
}
