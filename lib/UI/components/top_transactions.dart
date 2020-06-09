import 'package:FlutterApp/UI/components/top_transactions_header.dart';
import 'package:FlutterApp/UI/components/top_transactions_list.dart';
import 'package:flutter/material.dart';

class TopTransactions extends StatelessWidget {
  List<List<Color>> topColors = [
    [Color(0xFFA151F2), Color(0xFFCB9EFA)],
    [Color(0xFF6459EA), Color(0xFF6ABFE1)],
    [Color(0xFFFF8690), Color(0xFFFFBE78)]
  ];
  int colorIndex = 0;

  @override
  void initState() {
    colorIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TransactionsHeader(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Container(
            height: 140,
            child: TopTransactionsList(),
          ),
        ),
      ],
    );
  }
}
