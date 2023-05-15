import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/controllers/notifications/notification_controller.dart';
import 'package:sellitedriver/ui/drawer/drawer2.dart';

class Notifications extends StatelessWidget {
  NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Notifications',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        notificationController.markAllAsRead();
                      },
                      child: Text('Mark all as Read'))
                ],
              ),
            ),
            Obx(
              () => notificationController.notificationsList.length == 0
                  ? Center(
                      child: Text('No notifications'),
                    )
                  : Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount:
                              notificationController.notificationsList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.0,
                                      top: 8.0,
                                      bottom: 0.0,
                                      right: 8.0),
                                  child: Text('New notification'),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      '${notificationController.notificationsList[index].message}'),
                                ),
                                trailing: Column(
                                  children: [
                                    Text(
                                        '${notificationController.notificationsList[index].date.substring(11, 16)}'),
                                    Text(
                                        '${notificationController.notificationsList[index].date.substring(0, 10)}'),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
            )
          ],
        ));
  }
}
