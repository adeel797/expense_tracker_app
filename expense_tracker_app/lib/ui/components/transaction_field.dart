import 'package:flutter/material.dart';

class TransactionField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Widget icon;
  final TextInputType? inputType;
  const TransactionField(
      {super.key,
      required this.label,
      required this.controller,
      required this.icon, this.inputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        keyboardType: inputType,
        controller: controller,
        cursorColor: Colors.blueAccent,
        decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconColor: Colors.blueAccent,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.blueAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 1.3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
