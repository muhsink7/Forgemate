import 'package:forgemate/ui/screen/new_project_screen/new_project_controller.dart';
import 'package:get/get.dart';

class NewProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewProjectController());
  }
}