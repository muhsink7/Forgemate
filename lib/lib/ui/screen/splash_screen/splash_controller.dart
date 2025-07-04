import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _startSplash();
  }

  void _startSplash() async {
    await Future.delayed(const Duration(seconds: 5)); // Delay for 3 seconds
    Get.offAllNamed('/onBoarding'); // Navigate to home screen
  }
}
