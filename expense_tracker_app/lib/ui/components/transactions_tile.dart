import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/category_model.dart';

import '../../models/transactions_model.dart';

class TransactionsTile extends StatelessWidget {
  final TransactionsModel t;
  const TransactionsTile({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIncome = t.type == CategoryType.income;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color:
        isIncome ? Colors.green.withOpacity(0.05) : Colors.red.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(t.category.icon, style: const TextStyle(fontSize: 22)),
        ),
        title: Text(t.category.name,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle:
        Text(t.description ?? '', style: const TextStyle(color: Colors.grey)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${isIncome ? '+' : '-'} Rs ${t.amount.toStringAsFixed(0)}',
              style: TextStyle(
                  color: isIncome ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat('yyyy-MM-dd').format(t.createdAt),
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
