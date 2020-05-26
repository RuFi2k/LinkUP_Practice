import 'file:///C:/Users/RuFi/Desktop/Practice/FlutterApp/lib/UI/components/categories.dart';
import 'file:///C:/Users/RuFi/Desktop/Practice/FlutterApp/lib/UI/components/header.dart';
import 'file:///C:/Users/RuFi/Desktop/Practice/FlutterApp/lib/UI/components/top_transactions.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ListView(
          children: <Widget>[
            Header('Transactions'),
            Categories(),
            TopTransactions(),
          ],
        );
  }
}