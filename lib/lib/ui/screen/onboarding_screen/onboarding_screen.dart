import 'package:flutter/material.dart';
import 'package:forgemate/ui/screen/onboarding_screen/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController onboardingController = Get.put(OnboardingController());

   OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: GetBuilder<OnboardingController>(
              builder: (controller) {
                return Stack(
        children: [
          PageView(
            controller: onboardingController.pageController,
            onPageChanged: onboardingController.onPageChanged,
            children: [
              buildOnboardingPage('assets/logo/logo with slogan.png', 'Welcome to our app!'),
              buildOnboardingPage('assets/logo/logo with slogan.png', 'Organize your tasks easily.'),
              buildOnboardingPage('assets/logo/logo with slogan.png', 'Track your progress effectively.'),
              buildOnboardingPageWithButton('assets/logo/logo with slogan.png', 'Get started now!'),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: onboardingController.skipToLogin,
                  child: const Text("Skip"),
                ),
                Row(
                  children: List.generate(
                    4, // 4 pages
                        (index) => buildDot(index),
                  ),
                ),
                Obx(()=>TextButton(
                  onPressed: onboardingController.currentPage.value == 3
                      ? onboardingController.skipToLogin
                      : onboardingController.nextPage,
                  child: Text(
                    onboardingController.currentPage.value == 3 ? "Start" : "Next",
                  ),),),
              ],
            ),
          ),
        ],
      );}))
    );
  }

  Widget buildOnboardingPage(String imagePath, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300),
        const SizedBox(height: 20),
        Text(
          description,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildOnboardingPageWithButton(String imagePath, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300),
        const SizedBox(height: 20),
        Text(
          description,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        // ElevatedButton(
        //   onPressed: onboardingController.skipToLogin,
        //   child: const Text('Start'),
        // ),
      ],
    );
  }

  Widget buildDot(int index) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(right: 8),
        height: 10,
        width: onboardingController.currentPage.value == index ? 20 : 10,
        decoration: BoxDecoration(
          color: onboardingController.currentPage.value == index ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      );
    });
  }
}
