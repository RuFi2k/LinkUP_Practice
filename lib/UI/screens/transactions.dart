import 'package:FlutterApp/UI/components/categories.dart';
import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/UI/components/top_transactions.dart';
import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:FlutterApp/services/transactionDBService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatelessWidget {
  Function(TransactionCategoriesEnum) transactionToggle;

  TransactionPage({this.transactionToggle});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    return StreamProvider<QuerySnapshot>.value(
      value: TransactionService(user_id: user.uid).getTopTransactions(),
      child: ListView(
        children: <Widget>[
          Header('Transactions'),
          Categories(transactionToggle: transactionToggle),
          TopTransactions(),
        ],
      ),
    );
  }
}
