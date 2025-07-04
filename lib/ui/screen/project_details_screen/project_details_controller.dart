import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProjectDetailsController extends GetxController {

  var selectedStatus = "Nill".obs;

  var images = <File>[].obs;

  final ImagePicker _picker = ImagePicker();

  final List<String> boxNames = [
    "Contractor",
    "Financial",
    "Documents",
    "Progress Tracking"
  ];

  @override
  void onInit() {
    super.onInit();
    update();
    // _loadSampleImages(); // Load sample images when the controller is initialized
  }

  // Method to edit status
  void editStatus() {
    Get.dialog(
      AlertDialog(
        title: const Text("Edit Status"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('On Going'),
              onTap: () {
                selectedStatus.value = 'On Going';
                Get.back(); // Close the dialog
              },
            ),
            ListTile(
              title: const Text('Completed'),
              onTap: () {
                selectedStatus.value = 'Completed';
                Get.back(); // Close the dialog
              },
            ),
            ListTile(
              title: const Text('On Hold'),
              onTap: () {
                selectedStatus.value = 'On Hold';
                Get.back(); // Close the dialog
              },
            ),
          ],
        ),
      ),
    );
  }

  // Load sample images from the assets folder
  // void _loadSampleImages() async {
  //   // List of sample image paths
  //   final sampleImages = [
  //     'assets/logo/logo with slogan.png',
  //     'assets/logo/logo with slogan.png',
  //     'assets/logo/logo with slogan.png',
  //   ];
  //   for (var assetPath in sampleImages) {
  //     final file = await _assetToFile(assetPath);
  //     if (file != null) {
  //       images.add(file);
  //     }
  //   }
  // }

  // Load sample images from the assets folder
  // void _loadSampleImages() async {
  //   // List of sample image paths
  //   final sampleImages = [
  //     'assets/logo/logo with slogan.png',
  //     'assets/logo/logo with slogan.png',
  //     'assets/logo/logo with slogan.png',
  //   ];
  //   for (var assetPath in sampleImages) {
  //     final file = await _assetToFile(assetPath);
  //     if (file != null) {
  //       images.add(file);
  //     }
  //   }
  // }
  // Convert an asset path to a File object
  // Future<File?> _assetToFile(String assetPath) async {
  //   try {
  //     final byteData = await rootBundle.load(assetPath);
  //     final tempFile = File('${(await getTemporaryDirectory()).path}/${assetPath.split('/').last}');
  //     await tempFile.writeAsBytes(byteData.buffer.asUint8List());
  //     return tempFile;
  //   } catch (e) {
  //     print("Error loading asset: $e");
  //     return null;
  //   }
  // }
  // Function to pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      images.add(File(pickedFile.path)); // Add the selected image to the list
    }
  }

  // Function to capture an image from the camera
  Future<void> captureImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      images.add(File(pickedFile.path)); // Add the captured image to the list
    }
  }

  // Function to show a dialog with gallery and camera options
  void showImageSourceDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text("Add Photos"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take a photo"),
              onTap: () {
                Get.back();
                captureImageFromCamera();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Choose from gallery"),
              onTap: () {
                Get.back();
                pickImageFromGallery();
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to view photos
  void showGalleryDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text("Photo Gallery"),
        content: Container(
          height: Get.height*0.75,
          width: Get.width*0.75,
          child: Obx(
                () => images.isEmpty
                ? const Text("No photos available.")
                : SizedBox(
              // height: Get.height*0.3,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: Get.height*0.3,
                    child: Image.file(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Close"),
          ),
          ElevatedButton(
            onPressed: () => showImageSourceDialog(context),
            child: const Text("Add Photo"),
          ),
        ],
      ),
    );
  }
}

// Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// boxShadow: [
// BoxShadow(
// color: Colors.grey.shade500,
// spreadRadius: 2,
// blurRadius: 4,
// offset: const Offset(0, 2), // Shadow position
// ),
// ],
// ),
// child: Column(
// children: [
// Obx(
// () => projectDetailsController.images.isEmpty
// ? Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Icon(
// Icons.photo_library,
// size: 100,
// color: Colors.grey,
// ),
// SizedBox(height: 20),
// Text(
// "No photos added yet",
// style: TextStyle(fontSize: 18, color: Colors.grey),
// ),
// SizedBox(height: 20),
// ElevatedButton(
// onPressed: projectDetailsController.showImageSourceDialog,
// child: Text("Add Photo"),
// ),
// ],
// ),
// )
//     : GridView.builder(
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 3,
// crossAxisSpacing: 4.0,
// mainAxisSpacing: 4.0,
// ),
// itemCount: projectDetailsController.images.length,
// itemBuilder: (context, index) {
// final image = projectDetailsController.images[index];
// if (image is String) {
// // Render asset image
// return Image.asset(
// image,
// fit: BoxFit.cover,
// );
// } else if (image is File) {
// // Render file image
// return Image.file(
// image,
// fit: BoxFit.cover,
// );
// }
// return SizedBox.shrink();
// },
// ),
// )
// //   onPressed: _galleryController.showImageSourceDialog,
// //   child: Icon(Icons.add_a_photo),
// // ),
// ],
// )),