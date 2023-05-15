import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DetailsPageController extends GetxController {
  late TextEditingController trackDetailmessagecontroller;

  @override
  void onInit() {
    super.onInit();

    trackDetailmessagecontroller = TextEditingController();
  }

  createTrackDetails({required String OrderId}) async {
    // print("createTrackDetails $trackDetailmessagecontroller.text");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final id = prefs.getString('id');
    const url = "https://vegestall.onrender.com/api/trackDetail/create";

    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json"
    };

    final Map<String, dynamic> body = {
      "orderId": OrderId,
      "message": trackDetailmessagecontroller.text,
      "deliveryPersonId": id,
    };

    try {
      final response = await http.post(Uri.parse("$url"),
          headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        Get.snackbar("Title", "message",
            titleText: Text("Success"),
            messageText: Text(data['message']),
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
        Get.snackbar("Title", "Body",
            titleText: Text("Error Occured"),
            messageText: Text("Something went wrong"),
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
  }

  completeOrder({required String OrderId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    String url =
        "https://vegestall.onrender.com/api/trackDetail/completeOrder/$OrderId";

    final headers = {
      "Authorization": "Bearer $token",
    };

    try {
      final response = await http.get(Uri.parse("$url/"), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        Get.snackbar("Title", "message",
            titleText: Text("Success"),
            messageText: Text(data['message']),
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
        Get.snackbar("Title", "Body",
            titleText: Text("Error Occured"),
            messageText: Text("Something went wrong"),
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
  }
}
