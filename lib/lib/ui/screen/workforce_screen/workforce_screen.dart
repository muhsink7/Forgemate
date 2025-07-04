import 'package:flutter/material.dart';
import 'package:forgemate/constants/colour_constants.dart';
import 'package:forgemate/ui/screen/workforce_screen/workforce_controller.dart';
import 'package:forgemate/ui/widget/action_button.dart';
import 'package:get/get.dart';

class WorkforceScreen extends GetWidget<WorkforceController> {
  const WorkforceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'WORKFORCE',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              print("Menu tapped");
            },
          ),
        ],
        shadowColor: Colors.grey,
        elevation: 5,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 70), // leave space for buttons
              child: Column(
                children: [
                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search Labour',
                      ),
                    ),
                  ),
                  // ListView Expanded
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.person),
                              title: Text("Labour Name #${index + 1}"),
                              subtitle: Text("Details for Labour #${index + 1}"),
                              trailing: Text("₹ ${1000 + (index * 10)}"),
                            ),
                          ),
                        );
                      },
                    ),
                  )

                ],
              ),
            ),

            // Bottom Buttons Positioned
            Positioned(
              bottom: 10,
              left: 16,
              right: 16,
              child: Row(
                children: [
                  Expanded(
                    child: ActionButton(
                      text: "Add Labour",
                      onPressed: () {
                        print("Add Labour Tapped");
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ActionButton(
                      text: "Remove Labour",
                      onPressed: () {
                        print("Remove Labour Tapped");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
