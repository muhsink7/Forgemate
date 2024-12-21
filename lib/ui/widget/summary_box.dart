import 'package:flutter/material.dart';

class SummaryBox extends StatelessWidget {
  final String title;
  final String value;

  const SummaryBox({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        Row(
          children: [
            Icon(Icons.currency_rupee, color: Colors.white),
            Text(
              value,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
