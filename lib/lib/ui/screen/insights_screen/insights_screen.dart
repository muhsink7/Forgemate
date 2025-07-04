import 'package:flutter/material.dart';
import 'package:forgemate/constants/colour_constants.dart';
import 'package:forgemate/ui/screen/insights_screen/insights_controller.dart';
import 'package:get/get.dart';

class InsightsScreen extends GetWidget<InsightsController> {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'INSIGHTS',
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
        elevation: 5,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
