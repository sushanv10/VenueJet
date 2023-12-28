import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Signup successful
    } catch (e) {
      // Handle signup failure
      throw e;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Login successful
    } catch (e) {
      // Handle login failure
      throw e;
    }
  }
}










// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'login_page.dart';
// import 'onboardingscreen.dart';
//
//
//
// class AuthController extends GetxController {
//   //AuthController.instance..
//   static AuthController instance = Get.find();
//
//   //email, password, name...
//   late Rx<User?> _user;
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   @override
//   void OnReady() {
//     super.onReady();
//     _user = Rx<User?>(auth.currentUser);
//     //notify user
//     _user.bindStream(auth.userChanges());
//     ever(_user, _initialScreen);
//   }
//
//   _initialScreen(User? user) {
//     if (user == null) {
//       print("login page");
//       Get.offAll(() => LoginPage());
//     } else {
//       Get.offAll(() => OnboardingScreen());
//     }
//   }
//
//   void register(String email, password) {
//     try {
//       auth.createUserWithEmailAndPassword(email: email, password: password);
//     } catch (e) {
//         Get.snackbar("About User", "User message",
//         backgroundColor: Colors.blueAccent,
//         snackPosition: SnackPosition.BOTTOM,
//           titleText: Text(
//             "Account creation failed",
//               style: TextStyle(
//               color: Colors.white
//             ),
//           ),
//           messageText: Text(
//             e.toString(),
//                 style: TextStyle(
//                     color: Colors.white
//
//             )
//           )
//         );
//
//
//     }
//   }
// }