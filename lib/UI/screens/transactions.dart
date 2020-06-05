import 'package:FlutterApp/UI/components/categories.dart';
import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/UI/components/top_transactions.dart';
import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  Function(TransactionCategoriesEnum) transactionToggle;

  TransactionPage({this.transactionToggle});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Header('Transactions'),
        Categories(transactionToggle: transactionToggle),
        TopTransactions(),
      ],
    );
  }
}
