import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:forgemate/ui/screen/home_screen/home_screen.dart';
import 'package:forgemate/ui/screen/login_screen/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_login/twitter_login.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginWithEmail(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    _saveLogin();
  }

  Future<void> registerWithEmail(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    _saveLogin();
  }

  Future<void> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      _saveLogin();
    }
  }

  Future<void> signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final credential = FacebookAuthProvider.credential(result.accessToken!.token);
      await _auth.signInWithCredential(credential);
      _saveLogin();
    }
  }

  Future<void> signInWithTwitter() async {
    final twitterLogin = TwitterLogin(
      apiKey: 'YOUR_TWITTER_API_KEY',
      apiSecretKey: 'YOUR_TWITTER_SECRET',
      redirectURI: 'YOUR_TWITTER_CALLBACK',
    );
    final result = await twitterLogin.login();
    if (result.status == TwitterLoginStatus.loggedIn) {
      final credential = TwitterAuthProvider.credential(
        accessToken: result.authToken!,
        secret: result.authTokenSecret!,
      );
      await _auth.signInWithCredential(credential);
      _saveLogin();
    }
  }

  void _saveLogin() async {
    await GetStorage.init();
    final box = GetStorage();
    box.write('isLoggedIn', true);
    Get.offAll(() =>  HomeScreen());
  }

  void logout() async {
    await _auth.signOut();
    await GetStorage.init();
    final box = GetStorage();
    box.write('isLoggedIn', true);
    Get.offAll(() => LoginScreen());
  }

  // Phone Auth
  late String _verificationId;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
        _saveLogin();
      },
      verificationFailed: (e) {
        Get.snackbar("Error", e.message ?? "Verification failed");
      },
      codeSent: (verificationId, _) {
        _verificationId = verificationId;
        Get.to(() => OTPVerificationScreen(phoneNumber: phoneNumber));
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  Future<void> verifyOTP(String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    );
    await _auth.signInWithCredential(credential);
    _saveLogin();
  }
}
