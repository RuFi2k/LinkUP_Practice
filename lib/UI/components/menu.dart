import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({Key key, @required this.onSelect}) : super(key: key);
  final void Function(int) onSelect;

  VoidCallback callback;

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  int _selectedIndex = 0;

  @override
  void initState() {
    widget.callback = () {
      widget.onSelect(_selectedIndex);
    };
  }

  void _onItemTapped(int index) {
    int resultIndex = index;
    setState(() {
      _selectedIndex = resultIndex;
      widget.onSelect(resultIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
            color: Color(0x00FFFFFF),
          ),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
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
