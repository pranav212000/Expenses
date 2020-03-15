import 'package:expenses/widgets/chart.dart';
import 'package:expenses/widgets/new_transactions.dart';
import 'package:expenses/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontFamily: 'Quicksand', fontSize: 18)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(fontFamily: 'OpenSans', fontSize: 20, fontWeight: FontWeight.bold)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  List<Transaction> _transactions = [
    Transaction(id: 't1', title: 'TITLE', amount: 12.21, date: DateTime.now()),
    Transaction(id: 't2', title: 'TITLE23', amount: 100, date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions{
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    } ).toList();
  }



  void _addTransaction(String title, double amount) {
    final newtx = Transaction(
        id: 'id', title: title, amount: amount, date: DateTime.now());

    setState(() {
      _transactions.add(newtx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context))
        ],
        title: Text('Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                color: Colors.blue,
                child: Container(
                  alignment: Alignment.center,
                  child: Text('as'),
                  width: double.infinity,
                  height: 60,
                ),
              ),
              Chart(_recentTransactions),
              TransactionList(_transactions),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context)),
    );
  }
}
