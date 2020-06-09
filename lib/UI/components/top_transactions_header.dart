import 'package:flutter/material.dart';

class TransactionsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Top Cash Transactions',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    );
  }
}
