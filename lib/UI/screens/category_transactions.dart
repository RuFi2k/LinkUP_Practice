import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/UI/components/transaction_record.dart';
import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:FlutterApp/data_layer/models/transaction_record_model.dart';
import 'package:flutter/material.dart';

class CategoryTransactions extends StatefulWidget {
  final TransactionCategoriesEnum categoryType;
  final List<TransactionRecordModel> transactionList;

  CategoryTransactions(this.categoryType, this.transactionList, {Key key})
      : super(key: key);

  _CategoryTransactions createState() => _CategoryTransactions();
}

class _CategoryTransactions extends State<CategoryTransactions> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Header(
            '${CategoryEnumExtensions.EnumToString(widget.categoryType)} transactions'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: <Widget>[
              for (TransactionRecordModel model in widget.transactionList)
                TransactionRecord(model.amount, model.description),
            ],
          ),
        ),
      ],
    );
  }
}
