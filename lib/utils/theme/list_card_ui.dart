import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/constants/image_strings.dart';

class ListCardUI extends StatelessWidget {
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

  ListCardUI(
      {this.orderId,
      this.clientId,
      this.firstName,
      this.lastName,
      this.email,
      this.mobileNo,
      this.address,
      this.city,
      this.country,
      this.deliveryAddress,
      this.productId,
      this.title,
      this.date});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
                border:
                    Border(right: BorderSide(width: 1.0, color: Colors.blue))),
            child: Image.asset(
              pendingdelevery,
            )),
        title: Column(
          children: [
            Text(
              "Client : $firstName $lastName",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              address!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
        subtitle: Row(
          children: <Widget>[
            const Icon(Icons.attachment_outlined),
            Text(
              orderId!,
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        trailing: const Icon(Icons.keyboard_arrow_right,
            color: Colors.blue, size: 30.0),
        onTap: () {
          Get.offNamed('/vieworder', arguments: {
            'orderId': orderId,
            'clientId': clientId,
            'firstName': firstName,
            'lastName': lastName,
            'email': email,
            'mobileNo': mobileNo,
            'address': address,
            'city': city,
            'country': country,
            'deliveryAddress': deliveryAddress,
            'productId': productId,
            'title': title,
            'date': date,
          });
        },
      ),
    );
  }
}
