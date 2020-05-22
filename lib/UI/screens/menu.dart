import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterApp/UI/screens/categories.dart';
import 'package:FlutterApp/UI/screens/header.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({Key key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  int _selectedIndex = 0;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4FAFF),
      body: ListView(
        children: <Widget>[
          Header(),
          Categories(),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Top Cash Transactions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                  child: Container(
                    height: 110.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 110.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFA151F2), Color(0xFFCB9EFA)],
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                                color: Color(0x88000000),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.payment,
                                  color: Color(0xFFFFFFFF),
                                  size: 25.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '-\$40.00',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 17.0,
                                      )
                                    ),
                                    Text(
                                        'Cash transfer',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 13.0,
                                        )
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF892CEB),
        unselectedItemColor: Color(0xFFC2D2E8),
        onTap: _onItemTapped,
      ),
    );
  }
}