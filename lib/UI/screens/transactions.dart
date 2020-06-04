import 'package:FlutterApp/UI/components/categories.dart';
import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/UI/components/top_transactions.dart';
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