import 'package:FlutterApp/UI/screens/categories.dart';
import 'package:FlutterApp/UI/screens/header.dart';
import 'package:FlutterApp/UI/screens/menu.dart';
import 'package:FlutterApp/UI/screens/toptransactions.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Color(0xFFF4FAFF),
        body: ListView(
          children: <Widget>[
            Header('Transactions'),
            Categories(),
            TopTransactions(),
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
}