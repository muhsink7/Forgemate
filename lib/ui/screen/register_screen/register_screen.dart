import 'package:flutter/material.dart';
import 'package:forgemate/constants/colour_constants.dart';
import 'package:forgemate/models/buttons/custom_button.dart';
import 'package:forgemate/ui/screen/register_screen/register_controller.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Forgemate'),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            onTap: (){},
            decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: primaryColor),
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0), // Circular border
                  borderSide: BorderSide(color: tertiaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: primaryColor),
                ),
                hintStyle: TextStyle(color: tertiaryColor)),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
              onTap: (){},
              decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: primaryColor),
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Circular border
                    borderSide: BorderSide(color: tertiaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(color: primaryColor ),
                  ),
                  hintStyle: TextStyle(color: tertiaryColor)),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
              onTap: (){},
              decoration: InputDecoration(
                  labelText: 'Firm Name',
                  labelStyle: TextStyle(color: primaryColor),
                  hintText: 'Firm Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Circular border
                    borderSide: BorderSide(color: tertiaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  hintStyle: TextStyle(color: tertiaryColor)),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
              onTap: (){},
              decoration: InputDecoration(
                  labelText: 'Mobile No:',
                  labelStyle: TextStyle(color: primaryColor),
                  hintText: 'Mobile No:',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Circular border
                    borderSide: BorderSide(color: tertiaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(color: primaryColor, ),
                  ),
                  hintStyle: TextStyle(color: tertiaryColor)),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
              onTap: (){},
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: primaryColor),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Circular border
                    borderSide: BorderSide(color: tertiaryColor, ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(color: primaryColor, ),
                  ),// border: InputBorder.,
                  hintStyle: TextStyle(color: tertiaryColor)),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
              onTap: (){},
              decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: primaryColor),
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Circular border
                    borderSide: BorderSide(color: tertiaryColor, ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(color: primaryColor, ),
                  ),
                  hintStyle: TextStyle(color: tertiaryColor)),
          ),
          SizedBox(
            height: 20.0,
          ),
          CustomButton(onPressed: () {
            Get.toNamed('/home');
          }, title: "Register"),
        ],
      )),
    );
  }
}
