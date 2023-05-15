import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/models/pendingOrders_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  SharedPreferences? prefs;
  var isLoading = false.obs;
  var fname = "".obs;
  var lname = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var id = "".obs;
  var profileImage =
      "https://github.com/AbishekPerera/img/blob/main/avatar.png?raw=true".obs;

  var pendingOrdersList = [].obs;

  @override
  void onInit() async {
    // get shared pref data

    prefs = await SharedPreferences.getInstance();
    fname.value = prefs!.getString('firstName')!;
    lname.value = prefs!.getString('lastName')!;
    email.value = prefs!.getString('email')!;
    phone.value = prefs!.getString('phone')!;
    id.value = prefs!.getString('id')!;

    // print(profileImage.value);

    if (prefs!.getString('profileImage') != null) {
      profileImage.value =
          "https://vegestall.onrender.com/${prefs!.getString('profileImage')}";
    }

    // print(profileImage.value);

    isLoading.value = true;
    getAllOrders();
    super.onInit();
  }

  getAllOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token');

    pendingOrdersList.clear();

    const url = "https://vegestall.onrender.com/api/delivery/myPendingOrder";

    const int _page = 1;
    const int _perPage = 100;

    final headers = {
      "Authorization": "Bearer $token",
    };

    Map<String, dynamic> pendingOrders;

    try {
      final response = await http.get(
          Uri.parse("$url?page=$_page&perPage=$_perPage"),
          headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        pendingOrders = data['data'];
        // print(pendingOrders['data'].length);
        // print(pendingOrders['data'][0]['_id']);
        // print(pendingOrders['data'][0]['clientId']['_id']);

        String? orderId;
        String? clientId;
        String? firstName;
        String? lastName;
        String? email;
        String? mobileNo;
        String? address;
        String? city;
        String? country;
        String? deliveryAddress;
        String? productId;
        String? title;
        String? date;

        for (var i = 0; i < pendingOrders['data'].length; i++) {
          orderId = pendingOrders['data'][i]['_id'];
          clientId = pendingOrders['data'][i]['clientId']['_id'];
          firstName = pendingOrders['data'][i]['clientId']['firstName'];
          lastName = pendingOrders['data'][i]['clientId']['lastName'];
          email = pendingOrders['data'][i]['clientId']['email'];
          mobileNo = pendingOrders['data'][i]['clientId']['mobileNo'];
          address =
              pendingOrders['data'][i]['clientId']['userDetail']['address'];
          city = pendingOrders['data'][i]['clientId']['userDetail']['city'];
          country =
              pendingOrders['data'][i]['clientId']['userDetail']['country'];
          deliveryAddress = pendingOrders['data'][i]['clientId']['userDetail']
              ['deliveryAddress'];
          productId = pendingOrders['data'][i]['productId']['_id'];
          title = pendingOrders['data'][i]['productId']['title'];
          date = pendingOrders['data'][i]['date'];

          pendingOrdersList.add(PendingOrders(
              orderId: orderId,
              clientId: clientId,
              firstName: firstName,
              lastName: lastName,
              email: email,
              mobileNo: mobileNo,
              address: address,
              city: city,
              country: country,
              deliveryAddress: deliveryAddress,
              productId: productId,
              title: title,
              date: date));
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }

    isLoading.value = false;
  }
}
