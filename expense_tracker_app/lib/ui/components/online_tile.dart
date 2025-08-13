import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/category_model.dart';

class OnlineTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  final double amount;
  final DateTime createdAt;
  final CategoryType type;

  const OnlineTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.amount,
    required this.createdAt,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = type == CategoryType.income;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isIncome
            ? Colors.green.withOpacity(0.05)
            : Colors.red.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            icon,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${isIncome ? '+' : '-'} Rs ${amount.toStringAsFixed(0)}',
              style: TextStyle(
                color: isIncome ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat('yyyy-MM-dd').format(createdAt),
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
