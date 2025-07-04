import 'package:flutter/material.dart';
import 'package:forgemate/constants/colour_constants.dart';
import 'package:forgemate/ui/screen/new_project_screen/new_project_controller.dart';
import 'package:forgemate/ui/widget/action_button.dart';
import 'package:get/get.dart';

class NewProjectScreen extends GetWidget<NewProjectController> {
  const NewProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Create Project",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),

                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: tertiaryColor,
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Project ID',
                  ),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: const TextSpan(
                        text: 'Project Name ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: tertiaryColor,
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Project Name',
                  ),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: const TextSpan(
                        text: 'Project Type ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3.0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: tertiaryColor,
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Project Type',
                  ),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: const TextSpan(
                        text: 'Project Status ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3.0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: tertiaryColor,
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Project Status',
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // Ensures alignment
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Starting Date ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          Obx(
                                () => TextField(
                              // controller: controller.startDateController,
                              readOnly: true,
                              onTap: () => controller.pickDate(context, controller.startDate),
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                    color: tertiaryColor,
                                    width: 2.0,
                                  ),
                                ),
                                hintText: controller.startDate.value != null
                                    ? controller.startDate.value!
                                    .toLocal()
                                    .toString()
                                    .split(' ')[0]
                                    : 'Select Start Date',
                                hintStyle: const TextStyle(color: tertiaryColor),
                                suffixIcon: const Icon(
                                  Icons.calendar_today,
                                  color: tertiaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "End Date (Optional)",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          Obx(
                                () => TextField(
                              // controller: controller.endDateController,
                              readOnly: true,
                              onTap: () => controller.pickDate(context, controller.endDate),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                    color: tertiaryColor,
                                    width: 2.0,
                                  ),
                                ),
                                hintText: controller.endDate.value != null
                                    ? controller.endDate.value!
                                    .toLocal()
                                    .toString()
                                    .split(' ')[0]
                                    : 'Select End Date',
                                suffixIcon: const Icon(
                                  Icons.calendar_today,
                                  color: tertiaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: const TextSpan(
                        text: 'Client Name ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3.0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: tertiaryColor,
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Client Name',
                  ),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: const TextSpan(
                        text: 'Address ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3.0),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: tertiaryColor,
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Address',
                  ),
                ),
                const SizedBox(height: 25.0),
                ActionButton(text: "Create",onPressed: (){},)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
