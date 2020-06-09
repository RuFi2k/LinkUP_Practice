import 'package:flutter/material.dart';

class AvgAmount extends StatelessWidget {
  final double avg;
  AvgAmount(this.avg);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        avg.toStringAsFixed(2),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }
}
