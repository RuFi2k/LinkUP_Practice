import 'package:FlutterApp/BL/Enums/TransactionCategories.dart';
import 'package:FlutterApp/BL/Models/TransactionRecordModel.dart';
import 'package:FlutterApp/UI/components/transactionRecord.dart';
import 'package:FlutterApp/UI/screens/header.dart';
import 'package:FlutterApp/UI/screens/menu.dart';
import 'package:flutter/material.dart';

class CategoryTransactions extends StatefulWidget{
  final TransactionCategoriesEnum categoryType;
  final List<TransactionRecordModel> transactionList;

  CategoryTransactions(this.categoryType, this.transactionList, {Key key})
      : super(key: key);

  _CategoryTransactions createState() => _CategoryTransactions();
}

class _CategoryTransactions extends State<CategoryTransactions>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Color(0xFFF4FAFF),
        body: ListView(
          children: <Widget>[
            Header(getTitle()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                children: <Widget>[
                  for(TransactionRecordModel model in widget.transactionList)
                    TransactionRecord(model.amount, model.description),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: MenuWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF7227E5),
          elevation: 100.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
  }

  String getTitle(){
    return widget.categoryType.toString()
        .replaceAll('TransactionCategoriesEnum.', '') + ' transactions';
  }
}