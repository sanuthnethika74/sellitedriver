import 'dart:convert';

import 'package:get/get.dart';
import 'package:sellitedriver/models/notifications_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  var notificationsList = [].obs;

  @override
  void onInit() async {
    // get shared pref data

    getAllNotifications();

    super.onInit();
  }

  getAllNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token');

    notificationsList.clear();

    const url = "https://vegestall.onrender.com/api/dashboard/notification";

    final headers = {
      "Authorization": "Bearer $token",
    };

    Map<String, dynamic> notifications;

    try {
      final response = await http.get(Uri.parse("$url"), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        notifications = data['data'];

        // print(notifications['notifications'][0]);

        for (var i = 0; i < notifications['notifications'].length; i++) {
          Notifications notificationsModel = Notifications(
              notifications['notifications'][i]['_id'].toString(),
              notifications['notifications'][i]['userId'].toString(),
              notifications['notifications'][i]['message'].toString(),
              notifications['notifications'][i]['isViewed'].toString(),
              notifications['notifications'][i]['date'].toString());

          notificationsList.add(notificationsModel);
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  markAllAsRead() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token');

    notificationsList.clear();

    const url = "https://vegestall.onrender.com/api/dashboard/markAllAsRead";

    final headers = {
      "Authorization": "Bearer $token",
    };

    try {
      final response = await http.get(Uri.parse("$url"), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data['message']);
        // print(notificationsList.length);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
