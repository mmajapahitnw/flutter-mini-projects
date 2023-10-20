import 'package:flutter/material.dart';

class expenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;

  const expenseTile({
    super.key,
    required this.name,
    required this.amount,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
