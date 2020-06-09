import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:FlutterApp/data_layer/models/transaction_record_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class TransactionService {
  //collection reference
  final String userId;
  final uuid = Uuid();
  final CollectionReference transactionCollection =
      Firestore.instance.collection('expencesdb');

  TransactionService({this.userId});

  Future addRecord(
      {@required double amount,
      @required String description,
      @required TransactionCategoriesEnum category}) async {
    return await transactionCollection.document(uuid.v1()).setData({
      'amount': amount,
      'category': CategoryEnumExtensions.EnumToString(category),
      'currency': '\$',
      'description': description,
      'userid': userId,
    });
  }

  Stream<QuerySnapshot> getCategoryRecords(
      {TransactionCategoriesEnum category}) {
    return transactionCollection
        .where('userid', isEqualTo: userId)
        .where('category',
            isEqualTo: CategoryEnumExtensions.EnumToString(category))
        .snapshots();
  }

  Stream<QuerySnapshot> getTopTransactions() {
    return transactionCollection
        .where('userid', isEqualTo: userId)
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
        transactionCollection.where('userid', isEqualTo: userId);
    return allTransactions.snapshots().map(mapTransactions);
  }
}
