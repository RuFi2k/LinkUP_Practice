import 'package:FlutterApp/UI/components/add_transaction_body.dart';
import 'package:FlutterApp/UI/components/header.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  AddTransaction({Key key}) : super(key: key);
  _AddTransaction createState() => _AddTransaction();
}

class _AddTransaction extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[Header('Add transaction'), AddTransactionBody()],
    );
  }
}
