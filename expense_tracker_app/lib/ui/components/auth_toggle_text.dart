import 'package:flutter/material.dart';

class AuthToggleText extends StatelessWidget {
  final String msg;
  final String title;
  final void Function() onPressed;
  const AuthToggleText({
    super.key,
    required this.msg,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          msg,
          style: const TextStyle(color: Colors.black87),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
