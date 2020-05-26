import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:flutter/material.dart';
import 'package:FlutterApp/UI/components/category_button.dart';

class Categories extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CategoryButton(
                  icon: Icons.home,
                  text: 'Home',
                  color: Color(0xFFFCC76F),
                  category: TransactionCategoriesEnum.Home,
                ),
                CategoryButton(
                  icon: Icons.shopping_cart,
                  text: 'Shopping',
                  color: Color(0xFFFF7BAA),
                  category: TransactionCategoriesEnum.Shopping,
                ),
                CategoryButton(
                  icon: Icons.time_to_leave,
                  text: 'Transport',
                  color: Color(0xFF41D9FD),
                  category: TransactionCategoriesEnum.Transport,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CategoryButton(
                  icon: Icons.restaurant,
                  text: 'Food & Drink',
                  color: Color(0xFFFB9F77),
                  category: TransactionCategoriesEnum.Food,
                ),
                CategoryButton(
                  icon: Icons.volume_up,
                  text: 'Campaign',
                  color: Color(0xFF63E5FE),
                  category: TransactionCategoriesEnum.Campaign,
                ),
                CategoryButton(
                  icon: Icons.flag,
                  text: 'Sports',
                  color: Color(0xFFFBBF5D),
                  category: TransactionCategoriesEnum.Sports,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CategoryButton(
                  icon: Icons.mail,
                  text: 'Marketing',
                  color: Color(0xFFFF7CAB),
                  category: TransactionCategoriesEnum.Marketing,
                ),
                CategoryButton(
                  icon: Icons.payment,
                  text: 'Coupon',
                  color: Color(0xFFF98D62),
                  category: TransactionCategoriesEnum.Coupon,
                ),
                CategoryButton(
                  icon: Icons.note,
                  text: 'Taxes & Feeds',
                  color: Color(0xFF2ED4FD),
                  category: TransactionCategoriesEnum.Taxes,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}