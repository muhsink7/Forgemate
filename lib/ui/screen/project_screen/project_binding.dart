import 'package:forgemate/ui/screen/project_screen/project_controller.dart';
import 'package:get/get.dart';

class ProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectController());
  }
}