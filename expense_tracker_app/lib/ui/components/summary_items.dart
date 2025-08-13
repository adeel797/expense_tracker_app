import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  final String title;
  final double amount;
  final Color color;

  const SummaryItem(
      {required this.title,
      required this.amount,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            amount.toStringAsFixed(0),
            style: TextStyle(color: color, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
