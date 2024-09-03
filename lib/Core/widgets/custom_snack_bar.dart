import 'package:flutter/material.dart';

void customSnackBar({
  required context,
  required String text,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      padding: const EdgeInsets.all(20),
      duration: const Duration(seconds: 2),
      content: Text(text),
    ),
  );
}
