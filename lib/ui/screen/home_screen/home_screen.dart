import 'package:flutter/material.dart';
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
     InsightsScreen(),
     NewProjectScreen(),
     ProjectScreen(),
     WorkforceScreen(),
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
        body: SafeArea(
          child: Obx(() {
            final index = homeController.indexChangeNotifier.value;
            ever(homeController.indexChangeNotifier, (_) {
              // Trigger the refreshUserDetails method when the index changes
              homeController.refreshUserDetails();
            });
            print('Index Value: $index');
            return _pages[index];
          }),
        ),
        bottomNavigationBar: BottomNavigationWidget(indexChangeNotifier: homeController.indexChangeNotifier)

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