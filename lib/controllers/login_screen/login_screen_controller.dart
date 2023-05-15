import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/utils/keys/form_key_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  //:::::::::::::::::::::::::::::::::::::::password area
  var obscurePWText = true.obs;
  var isLoading = false.obs;

  togglePassword() {
    if (obscurePWText.value == true) {
      obscurePWText.value = false;
    } else {
      obscurePWText.value = true;
    }
  }

  // ::::::::::::::::::::::::::::::::::::::::::Form area

  // GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormKey = FormKeyUtils.createFormKey('login');

  late TextEditingController emailController, passwordController;
  var email = "", password = "";

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }

    return null;
  }

  String? validatePassword(String value) {
    if (value.length <= 5) {
      return "Password must be of 5 chars";
    }

    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    loginToDashboard();
    // print(email);
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future loginToDashboard() async {
    // Get.offNamed("/dashboard");
    isLoading.value = true;

    final url = "https://vegestall.onrender.com/api/auth/login";
    final headers = {
      "Content-Type": "application/json",
    };
    final Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "deviceType": "mobile"
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        // print(response.body);
        final data = json.decode(response.body);

        String message = data['message'];
        String token = data['token'];

        final Map<String, dynamic> userDetails = data['userDetails'];
        final String id = userDetails['_id'];
        final String email = userDetails['email'];
        final String firstName = userDetails['firstName'];
        final String lastName = userDetails['lastName'];
        final String userType = userDetails['userType'].toString();

        SharedPreferences userdata = await SharedPreferences.getInstance();
        await userdata.setString('token', token);
        await userdata.setString('id', id);
        await userdata.setString('email', email);
        await userdata.setString('firstName', firstName);
        await userdata.setString('lastName', lastName);
        await userdata.setString('userType', userType);
        await userdata.setString('phone', "0777568126");
        await userdata.setString(
            'expirationDate', "${DateTime.now().year}/${DateTime.now().month}");
        // await userdata.setString("profileImage",
        //     "https://github.com/AbishekPerera/img/blob/main/avatar.png?raw=true");

        Get.snackbar("Title", "message",
            titleText: Text("Success"),
            messageText: Text(message),
            forwardAnimationCurve: Curves.decelerate,
            duration: const Duration(milliseconds: 3000),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            overlayBlur: 5,
            icon: Icon(Icons.check_circle_outline, color: Colors.green),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(15));

        Get.offNamed("/dashboard");
      } else {
        // print(response.body);

        Get.snackbar("Title", "Body",
            titleText: Text("Login Failed"),
            messageText: Text("Incorrect Email or Password"),
            forwardAnimationCurve: Curves.bounceInOut,
            duration: const Duration(milliseconds: 3000),
            isDismissible: true,
            dismissDirection: DismissDirection.horizontal,
            overlayBlur: 5,
            icon: const Icon(
              Icons.error_outline_outlined,
              color: Colors.red,
            ),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(15));
      }
    } catch (e) {
      print(e);
    }

    isLoading.value = false;
  }

  void logOut() async {
    SharedPreferences userdata = await SharedPreferences.getInstance();
    await userdata.clear();
    Get.offNamed("/login");
  }
}
