import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';

class TransactionRecordModel {
  double amount;
  String description;
  TransactionCategoriesEnum category;

  TransactionRecordModel(this.amount, this.description, this.category);
}
