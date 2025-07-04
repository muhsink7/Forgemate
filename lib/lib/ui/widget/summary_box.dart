import 'package:flutter/material.dart';

class SummaryBox extends StatelessWidget {
  final String title;
  final String value;

  const SummaryBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        Row(
          children: [
            const Icon(Icons.currency_rupee, color: Colors.white),
            Text(
              value,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
