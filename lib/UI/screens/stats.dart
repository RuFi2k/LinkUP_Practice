import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/UI/components/stats_body.dart';
import 'package:FlutterApp/services/transactionDBService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticPage extends StatefulWidget {
  StatisticPage({Key key}) : super(key: key);

  _StatisticPage createState() => _StatisticPage();
}

class _StatisticPage extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return StreamProvider<QuerySnapshot>.value(
      value: TransactionService(user_id: user.uid).getAlltransactions(),
      child: ListView(
        children: <Widget>[
          Header('Expenses Report'),
          StatisticBody(),
        ],
      ),
    );
  }
}
