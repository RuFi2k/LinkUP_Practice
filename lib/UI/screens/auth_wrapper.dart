import 'package:FlutterApp/UI/screens/account.dart';
import 'package:FlutterApp/UI/screens/authentification.dart';
import 'package:FlutterApp/UI/screens/category_transactions.dart';
import 'package:FlutterApp/UI/screens/stats.dart';
import 'package:FlutterApp/UI/screens/transactions.dart';
import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:FlutterApp/data_layer/models/task.dart';
import 'package:FlutterApp/data_layer/models/transaction_record_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatefulWidget {
  final int _currentMenuIndex;
  final bool _menuVisible;

  AuthWrapper(this._currentMenuIndex, this._menuVisible, {Key key})
      : super(key: key);

  _AuthWrapper createState() => _AuthWrapper();
}

class _AuthWrapper extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);

    if (user == null)
      return SignIn();
    else {
      switch (widget._currentMenuIndex) {
        case 0:
          return TransactionPage();
          break;
        case 1:
          return CategoryTransactions(
              TransactionCategoriesEnum.Home, <TransactionRecordModel>[
            TransactionRecordModel(100, 'Description'),
            TransactionRecordModel(100, 'Description'),
          ]);
          break;
        case 3:
          return Account(null);
          break;
        case 4:
          return StatisticPage(<Task>[
            Task('Name', Color(0xFF000000), 25),
          ], 100);
          break;
        default:
          return null;
      }
    }
  }
}
