import 'package:flutter/material.dart';
import 'package:FlutterApp/UI/components/categorybutton.dart';

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