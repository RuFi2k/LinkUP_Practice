import 'package:flutter/material.dart';

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
    return BottomNavigationBar(
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
            icon: Icon(Icons.add, color: Color(0x00FFFFFF),),
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
      );
  }
}