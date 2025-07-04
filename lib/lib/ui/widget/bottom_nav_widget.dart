import 'package:flutter/material.dart';
import 'package:forgemate/constants/colour_constants.dart';
import 'package:get/get.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key,required this.indexChangeNotifier });
  final RxInt indexChangeNotifier; // Use RxInt from GetX


  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return SizedBox(

        // height: Get.height*0.089,
        child: BottomNavigationBar(
          currentIndex: indexChangeNotifier.value, // Use the value from the RxInt
          onTap: (index) {
            indexChangeNotifier.value = index; // Update the value using RxInt
          },
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          selectedItemColor: kWhiteColor,
          unselectedItemColor: kGreyColor,
          selectedIconTheme:  const IconThemeData(color: Color(0xffEABE41)),
          unselectedIconTheme: const IconThemeData(color: kGreyColor),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.insights,color: indexChangeNotifier.value == 0 ? primaryColor : kGreyColor,),
              label: 'Insights',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_sharp,color: indexChangeNotifier.value == 1 ? primaryColor : kGreyColor,),
              label: 'Create Project',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.villa,color: indexChangeNotifier.value == 2 ? primaryColor : kGreyColor,),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.engineering,color: indexChangeNotifier.value == 3 ? primaryColor : kGreyColor,),
              label: 'WorkForce',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payments,color: indexChangeNotifier.value == 4 ? primaryColor : kGreyColor,),
              label: 'Expenses',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.engineering,color: indexChangeNotifier.value == 0 ? primaryColor : kGreyColor,),
            //   // Container(
            //   //   height: 28,
            //   //   child: SvgPicture.asset(
            //   //     'assets/icons/race.svg',
            //   //     color: indexChangeNotifier.value == 0 ? primaryColor : kGreyColor,
            //   //   ),
            //   // ),
            //   label: 'WorkForce',
            // ),
            // BottomNavigationBarItem(
            //   icon: Container(
            //     height: 28,
            //     child: SvgPicture.asset(
            //       'assets/icons/result.svg',
            //       color: indexChangeNotifier.value == 1 ? primaryColor : kGreyColor,
            //     ),
            //   ),
            //   label: 'Results',
            // ),
            // BottomNavigationBarItem(
            //   icon: Container(
            //     height: 28,
            //     child: SvgPicture.asset(
            //       'assets/icons/home.svg',
            //       color: indexChangeNotifier.value == 2 ? primaryColor : kGreyColor,
            //     ),
            //   ),
            //   label: 'Home',
            // ),
            // BottomNavigationBarItem(
            //   icon: Container(
            //     height: 28,
            //     child: SvgPicture.asset(
            //       'assets/icons/rupee.svg',
            //       color: indexChangeNotifier.value == 3 ? primaryColor : kGreyColor,
            //     ),
            //   ),
            //   label: 'Cashier',
            // ),
            // BottomNavigationBarItem(
            //   icon: Container(
            //     height: 28,
            //     child: SvgPicture.asset(
            //       'assets/icons/Menu.svg',
            //       color: indexChangeNotifier.value == 4 ? primaryColor : kGreyColor,
            //     ),
            //   ),
            //   label: 'Menu',
            // ),
          ],
        ),
      );
    });
  }
}
