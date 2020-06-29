import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required Function delete,
  })  : _delete = delete,
        super(key: key);

  final Transaction transaction;
  final Function _delete;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  /*Color _bg;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple
    ];
    // Random nextInt always begins at 0 and the constructor takes the max
    // the max is excluded
    _bg = availableColors[Random().nextInt(4)];
    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          //backgroundColor: _bg,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${widget.transaction.amount}',
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => widget._delete(widget.transaction.id),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                label: const Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget._delete(widget.transaction.id)),
      ),
    );
  }
}
