import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProjectController extends GetxController {

  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  Future<void> pickDate(BuildContext context, Rx<DateTime?> dateField) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: dateField.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      dateField.value = pickedDate;
      update();
    }
  }

}