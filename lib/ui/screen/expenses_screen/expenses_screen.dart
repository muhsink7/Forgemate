import 'package:flutter/material.dart';
import 'package:forgemate/ui/screen/expenses_screen/expenses_controller.dart';
import 'package:forgemate/ui/widget/action_button.dart';
import 'package:forgemate/ui/widget/summary_box.dart';
import 'package:get/get.dart';

class ExpensesScreen extends GetWidget<ExpensesController> {
  ExpensesScreen({Key? key}) : super(key: key);

  final ExpensesController expensesController = Get.put(ExpensesController());

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Expenses',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu), // Icon at the end
            onPressed: () {
              print("Menu tapped");
            },
          ),
        ],
        shadowColor: Colors.grey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[800],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SummaryBox(title: "Cash in Hand", value: "24713695"),
                      Container(
                        height: 60, // Height of the divider
                        width: 2, // Thickness of the divider
                        color: Colors.white, // Divider color
                      ),
                      SummaryBox(title: "Debt", value: "24713695"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: deviceHeight * 0.2, // Set grid height
                  child: GridView.count(
                    crossAxisCount: 2, // 2 columns
                    crossAxisSpacing: 8.0, // Horizontal space between boxes
                    mainAxisSpacing: 8.0, // Vertical space between boxes
                    childAspectRatio:
                    deviceWidth / (deviceHeight / 3), // Aspect ratio
                    children: List.generate(
                        expensesController.boxNames.length, (index) {
                      return GestureDetector(
                        onTap: () => expensesController.handleBoxTap(context,index), // Add function call
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[(index + 1) * 200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              expensesController.boxNames[index],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActionButton(
                      text: "Add Expenses",
                      onPressed: () {
                        print("Add Expenses Tapped");
                      },
                    ),
                    ActionButton(
                      text: "Remove Expenses",
                      onPressed: () {
                        print("Remove Expenses Tapped");
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                  ),
                ),
              ),
              SizedBox(
                height: 200, // Set height for ListView
                child: ListView(
                  children: [
                    ListTile(
                      leading: Text("19/12/24"),
                      title: Text("Expense Name"),
                      subtitle: Text("Description"),
                      trailing: Text("Amount"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
