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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFA151F2), Color(0xFFCB9EFA)]
                            ),
                          ),
                          child: Text("Hello!"),
                        )
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

class Categories extends StatefulWidget{
  Categories({Key key}) : super(key: key);

  _Categories createState() => _Categories();
}

class _Categories extends State<Categories>{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CategoryButton(
                  icon: Icons.home,
                  text: 'Home',
                  color: Color(0xFFFCC76F)
                ),
                CategoryButton(
                  icon: Icons.shopping_cart,
                  text: 'Shopping',
                  color: Color(0xFFFF7BAA)
                ),
                CategoryButton(
                  icon: Icons.time_to_leave,
                  text: 'Transport',
                  color: Color(0xFF41D9FD)
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CategoryButton(
                  icon: Icons.restaurant,
                  text: 'Food & Drink',
                  color: Color(0xFFFB9F77)
                ),
                CategoryButton(
                  icon: Icons.volume_up,
                  text: 'Campaign',
                  color: Color(0xFF63E5FE)
                ),
                CategoryButton(
                  icon: Icons.flag,
                  text: 'Sports',
                  color: Color(0xFFFBBF5D)
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CategoryButton(
                  icon: Icons.mail,
                  text: 'Marketing',
                  color: Color(0xFFFF7CAB)
                ),
                CategoryButton(
                  icon: Icons.payment,
                  text: 'Coupon',
                  color: Color(0xFFF98D62)
                ),
                CategoryButton(
                  icon: Icons.note,
                  text: 'Taxes & Feeds',
                  color: Color(0xFF2ED4FD)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatefulWidget{
  Header({Key key}) : super(key: key);

  _Header createState() => _Header();
}

class _Header extends State<Header>{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9C0EEE), Color(0xFF3D02A0)],
        ),
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  CategoryButton({Key key,
                  this.icon,
                  this.text,
                  this.color = const Color(0xFF000000)
                }) : super(key: key);
  final IconData icon;
  final String text;
  final Color color;
  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton>{
  @override
  Widget build(BuildContext context){
    return Container(
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
              widget.icon,
              color: widget.color,
              size: 30.0
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold
            ))
          ],
        ),
      ),
    );
  }
}