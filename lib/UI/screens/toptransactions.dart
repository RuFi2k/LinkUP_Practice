import 'package:flutter/material.dart';
import 'package:FlutterApp/UI/components/toptransaction.dart';

class TopTransactions extends StatefulWidget{
  TopTransactions({Key key}) : super(key: key);

  _TopTransactions createState() => _TopTransactions();
}

class _TopTransactions extends State<TopTransactions>{
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
          child: Text(
            'Top Cash Transactions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: Container(
            height: 140.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Transaction(Icons.payment, -40.0, 'Cash transfer', '\$', [Color(0xFFA151F2), Color(0xFFCB9EFA)]),
                Transaction(Icons.monetization_on, 40.0, 'Cash received', '\$', [Color(0xFF6459EA), Color(0xFF6ABFE1)]),
                Transaction(Icons.airplanemode_active, -40.0, 'Money received', '\$', [Color(0xFFFF8690), Color(0xFFFFBE78)]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}