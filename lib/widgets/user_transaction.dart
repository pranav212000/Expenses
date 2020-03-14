import 'package:expenses/models/transaction.dart';
import 'package:expenses/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'new_transactions.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  List<Transaction> _usertransactions = [
    Transaction(id: 't1', title: 'TITLE', amount: 12.21, date: DateTime.now()),
    Transaction(id: 't2', title: 'TITLE23', amount: 100, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction),
        TransactionList(_usertransactions),
      ],
    );
  }

  void _addTransaction(String title, double amount){
    final newtx = Transaction(id: 'id', title: title, amount: amount, date: DateTime.now());

    setState(() {
      _usertransactions.add(newtx);
    });
  }
}
