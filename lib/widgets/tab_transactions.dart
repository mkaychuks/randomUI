import 'package:flutter/material.dart';
import 'package:learn_riverpod/models/transaction.dart';
import 'package:learn_riverpod/widgets/transaction_widget.dart';

class TransactionsTabWidget extends StatelessWidget {
  const TransactionsTabWidget({
    super.key,
    required this.transactions,
  });

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: transactions.length,
      itemBuilder: (context, index) => TransactionsWidget(
        moneyOut: transactions[index].moneyOut,
        name: transactions[index].name,
        category: transactions[index].category,
        price: transactions[index].price,
      ),
    );
  }
}

