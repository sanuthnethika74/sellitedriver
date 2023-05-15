import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/controllers/detailspage/details_page_controller.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> args = Get.arguments;

  DetailsPageController detailsPageController =
      Get.put(DetailsPageController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed('/dashboard');
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.offNamed('/dashboard');
              },
            ),
            title: Text("View Order Details",
                style: Theme.of(context).textTheme.headline5),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Order Details", style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: const Text(
                      'Order ID:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(args['orderId'].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: const Text(
                      'Client ID:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(args['clientId'].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: const Text(
                      'Name :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                        "${args['firstName'].toString()} ${args['lastName'].toString()}"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: const Text(
                      'Created On:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(args['date'].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: const Text(
                      'Email :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(args['email'].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: const Text(
                      'Mobile :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(args['mobileNo'].toString()),
                  ),
                ),
                SizedBox(height: 16),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: const Text(
                      'Address :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(args['address'].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: const Text(
                      'City :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(args['city'].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: const Text(
                      'Country :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(args['country'].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: const Text(
                      'Delivery Address :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(args['deliveryAddress'].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: const Text(
                      'Product Id :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(args['productId'].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    title: const Text(
                      'Title :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(args['title'].toString()),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            showDialogCompleted(
                                context, args['orderId'].toString());
                          },
                          child: Text('Complete'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {
                            showDialogAddTrack(
                                context, args['orderId'].toString());
                          },
                          child: Text('Add Track Details'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          )),
    );
  }

  void showDialogCompleted(BuildContext context, String orderId) {
    showDialog(
        builder: (context) {
          return AlertDialog(
            title: Text("Complete Order",
                style: Theme.of(context).textTheme.headline2),
            content: Text("Are you sure you want to complete this order?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No")),
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    detailsPageController.completeOrder(OrderId: orderId);
                  },
                  child: Text("Yes")),
            ],
          );
        },
        context: context);
  }

  void showDialogAddTrack(BuildContext context, String orderId) {
    showDialog(
        builder: (context) {
          return AlertDialog(
            title: Text("Add Track Details",
                style: Theme.of(context).textTheme.headline2),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller:
                      detailsPageController.trackDetailmessagecontroller,
                  decoration: const InputDecoration(
                    labelText: "Track Details",
                    hintText: "Enter Track Details",
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    detailsPageController.createTrackDetails(OrderId: orderId);
                  },
                  child: Text("Add")),
            ],
          );
        },
        context: context);
  }
}
