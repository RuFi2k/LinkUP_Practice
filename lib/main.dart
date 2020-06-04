import 'package:FlutterApp/UI/components/menu.dart';
import 'package:FlutterApp/UI/screens/auth_wrapper.dart';
import 'package:FlutterApp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _App createState() => _App();
}

class _App extends State<App> {
  int _currentMenuIndex = 0;
  bool menuVisible = true;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'App title',
        home: Scaffold(
          backgroundColor: Color(0xFFF4FAFF),
          body: AuthWrapper(_currentMenuIndex, menuVisible),
//              (() {
//            switch (_currentMenuIndex) {
//              case 0:
//                return TransactionPage();
//                break;
//              case 1:
//                return CategoryTransactions(
//                    TransactionCategoriesEnum.Home, <TransactionRecordModel>[
//                  TransactionRecordModel(100, 'Description'),
//                  TransactionRecordModel(100, 'Description'),
//                ]);
//                break;
//              case 3:
//                return Account(null);
//                break;
//              case 4:
//                return StatisticPage(<Task>[
//                  Task('Name', Color(0xFF000000), 25),
//                ], 100);
//                break;
//              default:
//                return null;
//            }
//          }()),
          bottomNavigationBar: MenuWidget(
            onSelect: (index) {
              setState(() {
                _currentMenuIndex = index;
              });
            },
          ),
          floatingActionButton: (() {
            if (menuVisible) {
              return FloatingActionButton(
                onPressed: () {},
                tooltip: 'Increment',
                child: Icon(Icons.add),
                backgroundColor: Color(0xFF7227E5),
                elevation: 100,
              );
            } else
              return null;
          }()),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
