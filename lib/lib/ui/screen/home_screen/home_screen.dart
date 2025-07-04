import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:forgemate/constants/colour_constants.dart';
import 'package:forgemate/models/bottom%20_nav_items/bottom_nav_items.dart';
import 'package:forgemate/ui/screen/expenses_screen/expenses_controller.dart';
import 'package:forgemate/ui/screen/expenses_screen/expenses_screen.dart';
import 'package:forgemate/ui/screen/home_screen/home_controller.dart';
import 'package:forgemate/ui/screen/insights_screen/insights_controller.dart';
import 'package:forgemate/ui/screen/insights_screen/insights_screen.dart';
import 'package:forgemate/ui/screen/new_project_screen/new_project_controller.dart';
import 'package:forgemate/ui/screen/new_project_screen/new_project_screen.dart';
import 'package:forgemate/ui/screen/project_screen/project_controller.dart';
import 'package:forgemate/ui/screen/project_screen/project_screen.dart';
import 'package:forgemate/ui/screen/workforce_screen/workforce_controller.dart';
import 'package:forgemate/ui/screen/workforce_screen/workforce_screen.dart';
import 'package:forgemate/ui/widget/bottom_nav_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({super.key});
  final HomeController homeController = Get.put(HomeController());

  final _pages = [
    const InsightsScreen(),
    const NewProjectScreen(),
    const ProjectScreen(),
    const WorkforceScreen(),
    ExpensesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(InsightsController());
    Get.put(NewProjectController());
    Get.put(ProjectController());
    Get.put(WorkforceController());
    Get.put(ExpensesController());

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withAlpha((0.4 * 255).toInt()),
                  offset: const Offset(0, 20),
                  blurRadius: 20,
                )
              ],
            ),
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(bottomNavItems.length, (index) {
                  final item = bottomNavItems[index];
                  return GestureDetector(
                    onTap: () {
                      homeController.indexChangeNotifier.value = index;
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          item.iconData,
                          color: homeController.indexChangeNotifier.value == index
                              ? kWhiteColor
                              : kGreyColor,
                          size: 28,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.label,
                          style: TextStyle(
                            color: homeController.indexChangeNotifier.value == index
                                ? kWhiteColor
                                : kGreyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  );
                }),
              );
            }),
          ),
        ),
      ),
      body: Obx(() {
        final index = homeController.indexChangeNotifier.value;
        ever(homeController.indexChangeNotifier, (_) {
          homeController.refreshUserDetails();
        });
        print('Index Value: $index');
        return _pages[
            index]; // Ensure _pages[index] is a ListView or scrollable widget
      }),
    );
  }
}
//     return Scaffold(
//       body: Obx(() => homeController.pages[homeController.selectedIndex.value]),
//       bottomNavigationBar: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           CustomPaint(
//             size: Size(double.infinity, 70),
//             painter: CurvedPainter(),
//             child: Container(
//               height: 70,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   homeController.buildNavBarItem(Icons.home, 0),
//                   homeController.buildNavBarItem(Icons.search, 1),
//                   homeController.buildNavBarItem(Icons.person, 2),
//                 ],
//               ),
//             ),
//           ),
//           // Obx(() {
//           //   return Positioned(
//           //     top: -25,
//           //     left: MediaQuery.of(context).size.width /
//           //         3 * homeController.selectedIndex.value +
//           //         (MediaQuery.of(context).size.width / 6) -
//           //         25,
//           //     child: AnimatedContainer(
//           //       duration: Duration(milliseconds: 300),
//           //       curve: Curves.easeInOut,
//           //       height: 50,
//           //       width: 50,
//           //       decoration: BoxDecoration(
//           //         color: Colors.blue,
//           //         shape: BoxShape.circle,
//           //         boxShadow: [
//           //           BoxShadow(
//           //             color: Colors.black26,
//           //             blurRadius: 5,
//           //             offset: Offset(0, 3),
//           //           )
//           //         ],
//           //       ),
//           //       child: Icon(
//           //         homeController.selectedIndex.value == 0
//           //             ? Icons.home
//           //             : homeController.selectedIndex.value == 1
//           //             ? Icons.search
//           //             : Icons.person,
//           //         color: Colors.white,
//           //       ),
//           //     ),
//           //   );
//           // }),
//         ],
//       ),
//     );
//
//   }
// }
// class CurvedPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = Colors.white;
//
//     Path path = Path();
//     path.moveTo(0, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//
//     double curveHeight = 40;
//     double curveWidth = size.width / 3;
//
//     path.moveTo(0, size.height);
//     path.lineTo((size.width - curveWidth) / 2, size.height);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height - curveHeight,
//       (size.width + curveWidth) / 2,
//       size.height,
//     );
//     path.lineTo(size.width, size.height);
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
