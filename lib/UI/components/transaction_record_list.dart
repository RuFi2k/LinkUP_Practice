import 'package:FlutterApp/UI/components/transaction_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionRecordList extends StatefulWidget {
  TransactionRecordList({Key key}) : super(key: key);

  _TransactionRecordList createState() => _TransactionRecordList();
}

class _TransactionRecordList extends State<TransactionRecordList> {
  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<QuerySnapshot>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: <Widget>[
          if (transactions != null)
            for (var doc in transactions.documents)
              TransactionRecord(
                  doc.data['amount'].toDouble(), doc.data['description']),
        ],
      ),
    );
  }
}
