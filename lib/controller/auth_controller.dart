import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:report4/pages/home/home_page.dart';
import 'package:report4/pages/login/login_page.dart';
import 'package:report4/utils/mytheme.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController   {
  static AuthController instance = Get.find();

  bool isLogin = false;

  String? token = "";

  final FirebaseAuth auth = FirebaseAuth.instance;
  late SharedPreferences prefs;
 

  @override
  void onReady() {
    super.onReady();
    initSharedPref();
    prefs =  prefs;
    token = prefs.getString('token');

    ever(token as RxInterface<User?>, (loginRedireact));
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  loginRedireact(User? user) {
    Timer(Duration(seconds: isLogin ? 0 : 2), () {
      if (user == null) {
        isLogin = false;
        update();
        Get.offAll(() => const LoginPage());
      } else {
        isLogin = true;
        update();
        Get.offAll(() => HomePage());
      }
    });
  }

  getErrorSnackBar(String message, _) {
    Get.snackbar("Error", "$message\n$_.$message",
        snackPosition: SnackPosition.TOP,
        backgroundColor: MyTheme.redTextColor,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10));
  }

  getErrorSnackBarNew(String message) {
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: MyTheme.redTextColor,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10));
  }

  getSuccessSnackBar(String message) {
    Get.snackbar("Success", message,
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10));
  }
}
