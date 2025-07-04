import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forgemate/router.dart';
import 'package:forgemate/ui/screen/project_details_screen/project_details_controller.dart';
import 'package:get/get.dart';

import 'constants/colour_constants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(ProjectDetailsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: primaryColor,
      debugShowCheckedModeBanner: false,
      title: 'Forgemate',
      initialRoute: RoutePaths.splash,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}