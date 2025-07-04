import 'dart:io';

import 'package:flutter/material.dart';
import 'package:forgemate/ui/screen/project_details_screen/project_details_controller.dart';
import 'package:get/get.dart';

class ProjectDetailsScreen extends GetWidget<ProjectDetailsController> {
  ProjectDetailsScreen({super.key});
  final ProjectDetailsController projectDetailsController =
      ProjectDetailsController();
  final controller = Get.find<ProjectDetailsController>();


  @override
  Widget build(BuildContext context) {
    final List<String> sampleImages = [
      'assets/logo/logo with slogan.png',
      'assets/logo/logo with slogan.png',
      'assets/logo/logo with slogan.png',
    ]; // Default status

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("Project Details")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Center( // Center-align the content
                            child: Text(
                              "Site 1",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                              () => Row(
                            mainAxisSize: MainAxisSize.min, // Ensure compact layout
                            children: [
                              Text(
                                "Status: ",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                projectDetailsController.selectedStatus.value,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 8.0), // Spacing between status text and icon
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  projectDetailsController.editStatus();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ),
                  Text(
                    "Client Name",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "Address",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "Location",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              // Status and Edit Icon
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => controller.showGalleryDialog(context),
                        child: Container(
                            height: Get.height*0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade500,
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2), // Shadow position
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Obx(
                                  () => projectDetailsController.images.isEmpty
                                      ? const Center(
                                          child: Icon(
                                            Icons.add_a_photo,
                                            size: 50,
                                            color: Colors.grey,
                                          ),
                                        )
                                      : GridView.builder(
                                          padding: const EdgeInsets.all(8.0),
                                          shrinkWrap: true,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 4,
                                            mainAxisSpacing: 4,
                                          ),
                                          itemCount: projectDetailsController.images.length,
                                          itemBuilder: (context, index) {
                                            return Image.file(
                                              projectDetailsController.images[index],
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                ),
                                //   onPressed: _galleryController.showImageSourceDialog,
                                //   child: Icon(Icons.add_a_photo),
                                // ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: Get.height * 0.3, // Set grid height
                        child: GridView.count(
                          crossAxisCount: 2, // 2 columns
                          crossAxisSpacing: 8.0, // Horizontal space between boxes
                          mainAxisSpacing: 8.0, // Vertical space between boxes
                          childAspectRatio:
                          Get.width / (Get.width / 3), // Aspect ratio
                          children: List.generate(
                              projectDetailsController.boxNames.length, (index) {
                            return GestureDetector(
                              // onTap: () => projectDetailsController.handleBoxTap(context,index), // Add function call
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[(index + 1) * 200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    projectDetailsController.boxNames[index],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                        ),
                      ),
                      SizedBox(
                        height: 200, // Set height for ListView
                        child: ListView(
                          children: const [
                            ListTile(
                              leading: Text("19/12/24"),
                              title: Text("Expense Name"),
                              subtitle: Text("Description"),
                              trailing: Text("Amount"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                spreadRadius: 2,
                                blurRadius: 4,

                                offset: const Offset(0, 2), // Shadow position
                              ),
                            ],
                          ),
                          child: Image(
                              image: AssetImage(
                                  'assets/logo/logo with slogan.png'))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
