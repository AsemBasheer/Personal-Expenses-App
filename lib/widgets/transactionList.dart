import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletTx;
  TransactionList(this.transactions, this.deletTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constrains) {
              return Column(children: <Widget>[
                Text(
                  'No transactions yet !',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: constrains.maxHeight*0.7,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ]);
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).primaryColor,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).accentColor,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: Text(
                      DateFormat('dd-MM-yyyy').format(transactions[index].date),
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).accentColor,
                      onPressed: () => deletTx(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
