import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/UI/components/transaction_record_list.dart';
import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:FlutterApp/services/transactionDBService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryTransactions extends StatefulWidget {
  final TransactionCategoriesEnum categoryType;
  final String user_id;

  CategoryTransactions(this.categoryType, this.user_id, {Key key})
      : super(key: key);

  _CategoryTransactions createState() => _CategoryTransactions();
}

class _CategoryTransactions extends State<CategoryTransactions> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: TransactionService(userId: widget.user_id)
          .getCategoryRecords(category: widget.categoryType),
      child: ListView(
        children: <Widget>[
          Header(
              '${CategoryEnumExtensions.EnumToString(widget.categoryType)} transactions'),
          TransactionRecordList(),
        ],
      ),
    );
  }
}
