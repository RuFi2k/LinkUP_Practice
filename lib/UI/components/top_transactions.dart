import 'package:flutter/material.dart';
import 'package:FlutterApp/UI/components/top_transaction.dart';

class TopTransactions extends StatelessWidget{
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Top Cash Transactions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Container(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Transaction(Icons.payment, -40, 'Cash transfer', '\$', [Color(0xFFA151F2), Color(0xFFCB9EFA)]),
                Transaction(Icons.monetization_on, 40, 'Cash received', '\$', [Color(0xFF6459EA), Color(0xFF6ABFE1)]),
                Transaction(Icons.airplanemode_active, -40, 'Money received', '\$', [Color(0xFFFF8690), Color(0xFFFFBE78)]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}