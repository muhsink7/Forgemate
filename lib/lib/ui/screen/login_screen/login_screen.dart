import 'package:flutter/material.dart';
import 'package:forgemate/constants/colour_constants.dart';
import 'package:forgemate/controller/auth_controller.dart';
import 'package:forgemate/models/buttons/custom_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: const Text('Login')),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign Up to your Account",style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),),
            TextField(
              controller: emailController,
              decoration:  InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: tertiaryColor,
                    width: 2.0,
                  ),
                ),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration:  InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: tertiaryColor,
                    width: 2.0,
                  ),
                ),
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            CustomButton(onPressed: () {
      AuthController.instance.login(
      emailController.text.trim(),
      passwordController.text.trim(),
      );
      }, title: "Login"),
            // ElevatedButton(
            //   onPressed: () {
            //     AuthController.instance.login(
            //       emailController.text.trim(),
            //       passwordController.text.trim(),
            //     );
            //   },
            //   child: const Text('Login'),
            // ),
            
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      image: const DecorationImage(
                        image: AssetImage("assets/logo/google_signin.png"),
                        fit: BoxFit.contain, // Ensures the image fits within the container
                      ),
                    ),
                  ),
                ),
                InkWell(
                    onTap: (){},
                  borderRadius: BorderRadius.circular(30.0),
                    child: const SizedBox(
                        // height: 50.0,
                        width: 150.0,
                        child: Image(image: AssetImage("assets/logo/google_signin.png",))

                    ),

                ),

                ElevatedButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.g_mobiledata),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),
                ElevatedButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.facebook),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),),
                ElevatedButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.alternate_email),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),)
              ],
            ),
            const SizedBox(height: 20),
            // CustomButton(onPressed: () {
            // AuthController.instance.register(
            // emailController.text.trim(),
            // passwordController.text.trim(),
            // );
            // }, title: "Register"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have any account ?",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // AuthController.instance.register(
                    //   emailController.text.trim(),
                    //   passwordController.text.trim(),
                    // );
                    Get.toNamed('/register');
                  },
                  child: const Text('Register',
                  style: TextStyle(
                    fontSize: 19.0,
                  ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
