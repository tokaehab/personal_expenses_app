class Transaction {
  // not stateless/fulwidget because it's not a widget that should be rendred
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction(this.id, this.title, this.amount, this.date);
}
