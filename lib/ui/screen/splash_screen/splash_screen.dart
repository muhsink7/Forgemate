import 'package:flutter/material.dart';
import 'package:forgemate/constants/colour_constants.dart';
import 'package:forgemate/ui/screen/splash_screen/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;


  final SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();

    // Set up animation controller and animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeInAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff041b26),
      body: Center(
        child: FadeTransition(
          opacity: _fadeInAnimation,
          child: Image.asset(
            'assets/logo/logo with slogan.png', // Replace with your image path
            width: 400, // Set width to the screen width
            height: 400, // Adjust height as per your need
            fit: BoxFit.contain, // Adjust the image fit to ensure it's not stretched
          ),
        ),
      ),
    );
  }
}
