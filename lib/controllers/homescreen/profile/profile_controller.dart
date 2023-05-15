import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  SharedPreferences? prefs;
  var fname = "".obs;
  var lname = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var profileImage = "".obs;

  @override
  void onInit() {
    // get shared pref data

    getMyProfileDetails();
    super.onInit();
  }

  getMyProfileDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    const url = "https://vegestall.onrender.com/api/auth/myProfile";

    final headers = {
      "Authorization": "Bearer $token",
    };

    try {
      final response = await http.get(Uri.parse("$url"), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // print(data);

        fname.value = data['data']['firstName'];
        lname.value = data['data']['lastName'];
        email.value = data['data']['email'];
        phone.value = data['data']['mobileNo'];
        profileImage.value = data['data']['profilePic'];

        // print(profileImage.value);

        prefs.setString("profileImage", profileImage.value.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
