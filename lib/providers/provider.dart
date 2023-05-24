import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/models/transaction.dart';

final tabProvider = Provider((ref) => tabs);

List<Tab> tabs = const [
  Tab(
    child: Text("This Day"),
  ),
  Tab(
    child: Text("This Week"),
  ),
  Tab(
    child: Text("This month"),
  ),
  Tab(
    child: Text("6 Months"),
  ),
];


final transactionsProvider = Provider<List<Transaction>>((ref) => transactions);
List<Transaction> transactions = [
  Transaction(
    moneyOut: true,
    name: "Jin",
    category: "Work",
    price: 59,
  ),
  Transaction(
    moneyOut: false,
    name: "Google",
    category: "Salary",
    price: 859,
  ),
  Transaction(
    moneyOut: true,
    name: "David",
    category: "Worl",
    price: 479,
  ),
  Transaction(
    moneyOut: false,
    name: "Google",
    category: "Bonus",
    price: 879,
  ),
  Transaction(
    moneyOut: true,
    name: "Jane",
    category: "Vacation",
    price: 10,
  ),
  Transaction(
    moneyOut: false,
    name: "Google",
    category: "Salary",
    price: 859,
  ),
   Transaction(
    moneyOut: true,
    name: "Jane",
    category: "Vacation",
    price: 10,
  ),
];
