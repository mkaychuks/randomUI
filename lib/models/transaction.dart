class Transaction {
  final bool moneyOut;
  final String name;
  final String category;
  final int price;

  Transaction({
    required this.moneyOut,
    required this.name,
    required this.category,
    required this.price,
  });
}
