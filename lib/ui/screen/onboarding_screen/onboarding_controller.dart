import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  PageController pageController = PageController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    currentPage;
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 3) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void skipToLogin() {
    print("Navigate to Login Page....");
    Get.offAllNamed('/login');
  }

}
