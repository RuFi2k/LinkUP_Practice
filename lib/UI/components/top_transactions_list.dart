import 'package:FlutterApp/UI/components/top_transaction.dart';
import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopTransactionsList extends StatelessWidget {
  List<List<Color>> topColors = [
    [Color(0xFFA151F2), Color(0xFFCB9EFA)],
    [Color(0xFF6459EA), Color(0xFF6ABFE1)],
    [Color(0xFFFF8690), Color(0xFFFFBE78)]
  ];
  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<QuerySnapshot>(context);
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        if (transactions != null)
          for (var doc in transactions.documents)
            TopTransaction(
                CategoryEnumExtensions.GetEnumIcon(
                    CategoryEnumExtensions.toEnum(doc.data['category'])),
                doc.data['amount'].toDouble(),
                doc.data['description'],
                doc.data['currency'],
                getColor()),
      ],
    );
  }

  List<Color> getColor() {
    return topColors[colorIndex++ % 3];
  }
}
