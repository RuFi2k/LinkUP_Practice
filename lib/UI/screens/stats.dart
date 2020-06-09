import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/UI/components/stats_body.dart';
import 'package:FlutterApp/data_layer/models/transaction_record_model.dart';
import 'package:FlutterApp/services/transactionDBService.dart';
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
    return StreamProvider<List<TransactionRecordModel>>.value(
      value: TransactionService(user_id: user.uid).Alltransactions,
      child: ListView(
        children: <Widget>[
          Header('Expenses Report'),
          StatisticBody(),
        ],
      ),
    );
  }
}
