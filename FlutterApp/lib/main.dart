import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Testing my app';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MenuWidget(),
    );
  }
}

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
      body: Column(

        children: <Widget>[
          Container(
            height: 250.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF9C0EEE), Color(0xFF3D02A0)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 65.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFFFFFFFF),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                              color: Color(0x88000000),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                color: Color(0xFF000000),
                              ),
                              Text(
                                'sample text',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold
                              ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFFFFFFFF),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                              color: Color(0x88000000),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                color: Color(0xFF000000),
                              ),
                              Text(
                                'sample text',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold
                              ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFFFFFFFF),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                              color: Color(0x88000000),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                color: Color(0xFF000000),
                              ),
                              Text(
                                'sample text',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold
                              ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 65.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFFFFFFFF),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                              color: Color(0x88000000),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                color: Color(0xFF000000),
                              ),
                              Text(
                                'sample text',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold
                              ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFFFFFFFF),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                              color: Color(0x88000000),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                color: Color(0xFF000000),
                              ),
                              Text(
                                'sample text',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold
                              ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFFFFFFFF),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                              color: Color(0x88000000),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                color: Color(0xFF000000),
                              ),
                              Text(
                                'sample text',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold
                              ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 65.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFFFFFFFF),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                              color: Color(0x88000000),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                color: Color(0xFF000000),
                              ),
                              Text(
                                'sample text',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold
                              ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFFFFFFFF),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                              color: Color(0x88000000),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                color: Color(0xFF000000),
                              ),
                              Text(
                                'sample text',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold
                              ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFFFFFFFF),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                              color: Color(0x88000000),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                color: Color(0xFF000000),
                              ),
                              Text(
                                'sample text',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold
                              ))
                            ],
                          ),
                        ),
                      ),
                    ],
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
