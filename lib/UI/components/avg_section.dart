import 'package:FlutterApp/UI/components/avg_amount.dart';
import 'package:FlutterApp/UI/components/avg_title.dart';
import 'package:flutter/material.dart';

class AvgSection extends StatelessWidget {
  final double avg;

  AvgSection(this.avg);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Color(0x88000000),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AvgAmount(avg),
            AvgTitle(),
          ],
        ),
      ),
    );
  }
}
