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
        title: const Text('Registration'),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forgemate'),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onTap: (){},
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: primaryColor),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0), // Circular border
                    borderSide: const BorderSide(color: tertiaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(color: primaryColor),
                  ),
                  hintStyle: const TextStyle(color: tertiaryColor)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
                onTap: (){},
                decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: const TextStyle(color: primaryColor),
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Circular border
                      borderSide: const BorderSide(color: tertiaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(color: primaryColor ),
                    ),
                    hintStyle: const TextStyle(color: tertiaryColor)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
                onTap: (){},
                decoration: InputDecoration(
                    labelText: 'Firm Name',
                    labelStyle: const TextStyle(color: primaryColor),
                    hintText: 'Firm Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Circular border
                      borderSide: const BorderSide(color: tertiaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(color: primaryColor),
                    ),
                    hintStyle: const TextStyle(color: tertiaryColor)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
                onTap: (){},
                decoration: InputDecoration(
                    labelText: 'Mobile No:',
                    labelStyle: const TextStyle(color: primaryColor),
                    hintText: 'Mobile No:',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Circular border
                      borderSide: const BorderSide(color: tertiaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(color: primaryColor, ),
                    ),
                    hintStyle: const TextStyle(color: tertiaryColor)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
                onTap: (){},
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: primaryColor),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Circular border
                      borderSide: const BorderSide(color: tertiaryColor, ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(color: primaryColor, ),
                    ),// border: InputBorder.,
                    hintStyle: const TextStyle(color: tertiaryColor)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
                onTap: (){},
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(color: primaryColor),
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0), // Circular border
                      borderSide: const BorderSide(color: tertiaryColor, ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(color: primaryColor, ),
                    ),
                    hintStyle: const TextStyle(color: tertiaryColor)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomButton(onPressed: () {
              Get.offAllNamed('/home');
            }, title: "Register"),
          ],
        ),
      )),
    );
  }
}
