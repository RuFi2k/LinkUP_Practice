import 'package:FlutterApp/UI/components/menu.dart';
import 'package:FlutterApp/UI/screens/stats.dart';
import 'package:FlutterApp/UI/screens/transactions.dart';
import 'package:FlutterApp/data_layer/models/task.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'App title',
      home: Scaffold(
        backgroundColor: Color(0xFFF4FAFF),
        body: StatisticPage(<Task>[], 1000),
        bottomNavigationBar: MenuWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF7227E5),
          elevation: 100,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}