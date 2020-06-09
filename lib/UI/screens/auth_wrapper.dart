import 'package:FlutterApp/UI/screens/account.dart';
import 'package:FlutterApp/UI/screens/add_transaction.dart';
import 'package:FlutterApp/UI/screens/authentification.dart';
import 'package:FlutterApp/UI/screens/category_transactions.dart';
import 'package:FlutterApp/UI/screens/register.dart';
import 'package:FlutterApp/UI/screens/stats.dart';
import 'package:FlutterApp/UI/screens/transactions.dart';
import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatefulWidget {
  int _currentMenuIndex;
  bool _isRegister = false;

  AuthWrapper(this._currentMenuIndex, {Key key}) : super(key: key);

  _AuthWrapper createState() => _AuthWrapper();
}

class _AuthWrapper extends State<AuthWrapper> {
  TransactionCategoriesEnum _transactionCategory =
      TransactionCategoriesEnum.Home;
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);

    if (user == null) {
      if (widget._isRegister) {
        return Register(toLogin: loginRegisterSwitcher(false));
      }
      return SignIn(toRegister: loginRegisterSwitcher(true));
    } else {
      switch (widget._currentMenuIndex) {
        case 0:
          return TransactionPage(transactionToggle: (category) {
            print(_transactionCategory);
            setState(() {
              _transactionCategory = category;
              widget._currentMenuIndex = 1;
              print(_transactionCategory);
            });
          });
          break;
        case 1:
          return CategoryTransactions(_transactionCategory, user.uid);
          break;
        case 2:
          return AddTransaction();
          break;
        case 3:
          return Account(user);
          break;
        case 4:
          return StatisticPage();
          break;
        default:
          return null;
      }
    }
  }

  VoidCallback loginRegisterSwitcher(bool isRegister) {
    return () {
      setState(() {
        widget._isRegister = isRegister;
      });
    };
  }
}
