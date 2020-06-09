import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:FlutterApp/data_layer/models/transaction_record_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class TransactionService {
  //collection reference
  final String user_id;
  final uuid = Uuid();
  final CollectionReference transactionCollection =
      Firestore.instance.collection('expencesdb');

  TransactionService({this.user_id});

  Future addRecord(
      {@required double amount,
      @required String description,
      @required TransactionCategoriesEnum category}) async {
    return await transactionCollection.document(uuid.v1()).setData({
      'amount': amount,
      'category': CategoryEnumExtensions.EnumToString(category),
      'currency': '\$',
      'description': description,
      'userid': user_id,
    });
  }

  Stream<QuerySnapshot> getCategoryRecords(
      {TransactionCategoriesEnum category}) {
    return transactionCollection
        .where('userid', isEqualTo: user_id)
        .where('category',
            isEqualTo: CategoryEnumExtensions.EnumToString(category))
        .snapshots();
  }

  Stream<QuerySnapshot> getTopTransactions() {
    return transactionCollection
        .where('userid', isEqualTo: user_id)
        .orderBy('amount', descending: true)
        .limit(3)
        .snapshots();
  }

  List<TransactionRecordModel> mapTransactions(QuerySnapshot snapshot) {
    return snapshot.documents
        .map((doc) => TransactionRecordModel(
            doc.data['amount'].toDouble() ?? 0,
            doc.data['description'] ?? '',
            CategoryEnumExtensions.toEnum(doc.data['category']) ??
                TransactionCategoriesEnum.Home))
        .toList();
  }

  Stream<List<TransactionRecordModel>> get Alltransactions {
    var allTransactions =
        transactionCollection.where('userid', isEqualTo: user_id);
    return allTransactions.snapshots().map(mapTransactions);
  }
}
