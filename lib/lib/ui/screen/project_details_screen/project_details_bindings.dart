import 'package:forgemate/ui/screen/project_details_screen/project_details_controller.dart';
import 'package:get/get.dart';

class ProjectDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectDetailsController());
  }
}