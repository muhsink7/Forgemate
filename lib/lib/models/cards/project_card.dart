
import 'package:flutter/material.dart';
import 'package:forgemate/constants/colour_constants.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 50.0,
            height: 50.0,
            child: Image(image: AssetImage('assets/logo/logo with slogan.png')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Site 1",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                Text("Client Name",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),),
                Row(
                  mainAxisSize: MainAxisSize.min, // Adjusts the row's size to fit its content
                  children: const [
                    Icon(
                      Icons.location_on, // Your desired icon
                      color: Colors.red,
                      size: 14.0,
                    ),
                    SizedBox(width: 5.0), // Spacing between the icon and text
                    Text("Location",style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0,
                    ),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(Icons.navigate_next_outlined,color: tertiaryColor,size: 24.0,)
        ],
      ),
    );
  }
}
