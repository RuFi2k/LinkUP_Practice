import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:FlutterApp/services/transactionDBService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTransactionBody extends StatefulWidget {
  _AddTransactionBody createState() => _AddTransactionBody();
}

class _AddTransactionBody extends State<AddTransactionBody> {
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _description = TextEditingController();
  TransactionCategoriesEnum _category;

  @override
  Widget build(BuildContext context) {
    TransactionService service =
        TransactionService(userId: Provider.of<FirebaseUser>(context).uid);
    return Padding(
      padding: EdgeInsets.all(15),
      child: Form(
        child: Container(
          padding: EdgeInsets.all(10),
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amount,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                controller: _description,
              ),
              DropdownButton(
                isExpanded: true,
                value: _category,
                onChanged: (TransactionCategoriesEnum newVal) {
                  setState(() {
                    _category = newVal;
                  });
                },
                items: TransactionCategoriesEnum.values
                    .map((TransactionCategoriesEnum val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(CategoryEnumExtensions.EnumToString(val)),
                  );
                }).toList(),
              ),
              FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xFF7227E5),
                onPressed: () {
                  if (_amount.text != null &&
                      _description.text != null &&
                      _category != null) {
                    service.addRecord(
                        amount: double.parse(_amount.text),
                        description: _description.text,
                        category: _category);
                  }
                  print('${_amount.text}, ${_description.text}, $_category');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
