import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function add;

  NewTransaction(this.add);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController amountcontroller = TextEditingController();
  DateTime _selectedDate;

  void _AddFunction() {
    final _enteredTitle = titlecontroller.text;
    final _enteredAmount = amountcontroller.text;

    if (_enteredTitle.isEmpty ||
        _enteredAmount.isEmpty ||
        _selectedDate == null) return;
    if (double.parse(_enteredAmount) <= 0) return;
    // widget. means you can access var declared inside the widget class in the state class (StatefulWidget)
    widget.add(
      _enteredTitle,
      double.parse(_enteredAmount),
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titlecontroller,
                onSubmitted: (_) => _AddFunction(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountcontroller,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _AddFunction(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    FlatButton(
                      onPressed: _datePicker,
                      textColor: Theme.of(context).primaryColor,
                      child: const Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: const Text(
                  'Add Transaction',
                ),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: () {
                  _AddFunction();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
