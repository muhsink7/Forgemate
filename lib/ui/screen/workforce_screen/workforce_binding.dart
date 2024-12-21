import 'package:forgemate/ui/screen/workforce_screen/workforce_controller.dart';
import 'package:get/get.dart';

class WorkforceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkforceController());
  }
}