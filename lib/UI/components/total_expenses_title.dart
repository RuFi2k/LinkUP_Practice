import 'package:flutter/material.dart';

class TotalExpensesTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Total Expenses',
        style: TextStyle(
          fontSize: 20,
          color: Color(0xFFC7D6EA),
        ),
      ),
    );
  }
}
