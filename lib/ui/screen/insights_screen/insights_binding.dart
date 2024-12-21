import 'package:forgemate/ui/screen/insights_screen/insights_controller.dart';
import 'package:get/get.dart';

class InsightsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InsightsController());
  }
}