import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ExpensesController extends GetxController {
  final List<String> boxNames = [
    "Add Expense",
    "Remove Expense",
    "Labour Expense",
    "Company Expense"
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // showAddExpenseDialog();
    update();
  }
  void handleBoxTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        showAddExpenseDialog(context);
        break;
      default:
        print("Tapped box $index");
    }
  }

  void showAddExpenseDialog(BuildContext context) {
    final List<String> siteOptions = List.generate(100, (index) => "Site ${index + 1}")
      ..addAll(['Company Expenses', 'Other']);

    String? selectedSite = siteOptions.first;
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController amountController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Add Expense", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),

                      // Searchable Dropdown
                      DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSearchBox: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              hintText: "Search",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        items: (filter,infiniteScrollProps) =>siteOptions,
                        decoratorProps:  DropDownDecoratorProps(
                          decoration: InputDecoration(
                            labelText: "Select a project",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        selectedItem: selectedSite,
                        onChanged: (value) {
                            // This is the key change
                            selectedSite = value;
                          update();
                        },


                      ),
                      SizedBox(height: 20),
                      Text(
                            selectedSite != null
                                ? 'Selected: $selectedSite'
                                : 'No item selected',
                            style: TextStyle(fontSize: 16),
                          ),


                      const SizedBox(height: 15),

                      TextField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          labelText: "Description",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 15),

                      TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Amount",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Date and Time Picker
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "Date: ${DateFormat('dd/MM/yyyy hh:mm a').format(selectedDate)}",
                              style: const TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(selectedDate),
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    selectedDate = DateTime(
                                      pickedDate.year,
                                      pickedDate.month,
                                      pickedDate.day,
                                      pickedTime.hour,
                                      pickedTime.minute,
                                    );
                                  });
                                }
                              }
                            },
                            child: const Text("Change"),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          // Handle save logic here
                          print("Saved:");
                          print("Site: $selectedSite");
                          print("Desc: ${descriptionController.text}");
                          print("Amount: ${amountController.text}");
                          print("Date: ${DateFormat('dd/MM/yyyy hh:mm a').format(selectedDate)}");

                          Navigator.pop(context);
                        },
                        child: const Text("Add Expense"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
