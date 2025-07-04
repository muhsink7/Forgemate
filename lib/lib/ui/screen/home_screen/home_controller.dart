

import 'package:get/get.dart';

class HomeController extends GetxController{
  RxInt indexChangeNotifier = 2.obs; // Use RxInt from GetX
  @override
  void onInit() {
    refreshUserDetails();
    update();
    super.onInit();
  }

  void refreshUserDetails() {
    // Call the getUserDetails method to refresh the user details
    // Assuming you have a reference to HomeController
    // homeController.getUserDetails(GetStorage().read('userId'));
  }
  var selectedIndex = 0.obs; // Observable variable for the selected index

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  // final List<Widget> pages = [
  //   Center(child: Text('Home Screen', style: TextStyle(fontSize: 24))),
  //   Center(child: Text('Search Screen', style: TextStyle(fontSize: 24))),
  //   Center(child: Text('Profile Screen', style: TextStyle(fontSize: 24))),
  // ];
  // Widget buildNavBarItem(IconData icon, int index) {
  //   return GestureDetector(
  //     onTap: () {
  //       changeIndex(index); // Update the selected index
  //     },
  //     child: Obx(() {
  //       return Icon(
  //         icon,
  //         color: selectedIndex.value == index
  //             ? Colors.blue
  //             : Colors.grey,
  //         size: 30,
  //       );
  //     }),
  //   );
  // }
}

