import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpensesController extends GetxController {

  final List<String> boxNames = [
    "Add Expense",
    "Remove Expense",
    "Labour Expense",
    "Company Expense"
  ];

  void handleBoxTap(BuildContext context, int index)  {
    switch (index) {
      case 0:
        print("Box 1 tapped: Perform action for Cash Flow");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 300,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Custom Dialog", style: TextStyle(fontSize: 24)),
                    TextField(decoration: InputDecoration(hintText: "Enter something")),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Close"),
                    ),
                  ],
                ),
              ),
            );
          },
        );

        break;
      case 1:
        print("Box 2 tapped: Perform action for Revenue");
        break;
      case 2:
        print("Box 3 tapped: Perform action for Expenses");
        break;
      case 3:
        print("Box 4 tapped: Perform action for Savings");
        break;
      default:
        print("Unknown box tapped");
    }
  }
}