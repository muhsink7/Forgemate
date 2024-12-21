import 'package:flutter/material.dart';
import 'package:forgemate/ui/screen/project_screen/project_controller.dart';
import 'package:get/get.dart';

class ProjectScreen extends GetWidget<ProjectController> {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Forgemate')),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Header Section
            UserAccountsDrawerHeader(
              accountName: Text(
                "John Doe",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text("johndoe@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://via.placeholder.com/150", // Replace with your image URL
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),

            // Menu Items
            Expanded(
              child: ListView(
                children: [
                  _buildDrawerItem(
                    icon: Icons.home,
                    text: 'Home',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  _buildDrawerItem(
                    icon: Icons.settings,
                    text: 'Settings',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  _buildDrawerItem(
                    icon: Icons.info,
                    text: 'About',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  const Divider(),
                  _buildDrawerItem(
                    icon: Icons.logout,
                    text: 'Logout',
                    onTap: () {
                      Navigator.of(context).pop();
                      // Add logout functionality here
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
              ),
            ),
          ),
      Expanded(
        child: ListView.builder(
          itemCount: 10, // Number of items in the ListView
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2), // Shadow position
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    "Item ${index + 1}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Description for item ${index + 1}"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    print("Tapped on Item ${index + 1}");
                  },
                ),
              ),
            );
          },
        ),
      ),
        ],
      ))
    );
  }

  // Helper method to build menu items
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
