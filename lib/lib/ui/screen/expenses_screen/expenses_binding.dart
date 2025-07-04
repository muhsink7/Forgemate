import 'package:forgemate/ui/screen/expenses_screen/expenses_controller.dart';
import 'package:get/get.dart';

class ExpensesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpensesController());
  }
}