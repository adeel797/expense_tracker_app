import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.blueGrey,
              thickness: 0.8,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'or',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.blueGrey,
              thickness: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
