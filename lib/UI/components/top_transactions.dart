import 'package:FlutterApp/UI/components/top_transaction.dart';
import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopTransactions extends StatelessWidget {
  List<List<Color>> topColors = [
    [Color(0xFFA151F2), Color(0xFFCB9EFA)],
    [Color(0xFF6459EA), Color(0xFF6ABFE1)],
    [Color(0xFFFF8690), Color(0xFFFFBE78)]
  ];
  int colorIndex = 0;

  @override
  void initState() {
    colorIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<QuerySnapshot>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Top Cash Transactions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Container(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                for (var doc in transactions.documents)
                  TopTransaction(
                      CategoryEnumExtensions.GetEnumIcon(
                          CategoryEnumExtensions.toEnum(doc.data['category'])),
                      doc.data['amount'].toDouble(),
                      doc.data['description'],
                      doc.data['currency'],
                      getColor()),
//                  TopTransaction(Icons.payment, -40, 'Cash transfer', '\$',
//                      [Color(0xFFA151F2), Color(0xFFCB9EFA)]),
//                  TopTransaction(Icons.monetization_on, 40, 'Cash received',
//                      '\$', [Color(0xFF6459EA), Color(0xFF6ABFE1)]),
//                  TopTransaction(
//                      Icons.airplanemode_active,
//                      -40,
//                      'Money received',
//                      '\$',
//                      [Color(0xFFFF8690), Color(0xFFFFBE78)]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Color> getColor() {
    return topColors[colorIndex++ % 3];
  }
}
