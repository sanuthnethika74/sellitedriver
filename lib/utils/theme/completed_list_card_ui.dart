import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/constants/image_strings.dart';

class CompletedListCardUI extends StatelessWidget {
  // int? requestId;
  // String? refNumber;
  // String? refType;
  // String? approvalText;
  // String? img1;
  // String? img2;
  // String? createdOn;
  // String? requestedBy;
  // String? validatedBy;

  // ListCardUI(
  //     {required this.requestId,
  //     required this.refNumber,
  //     required this.refType,
  //     required this.approvalText,
  //     required this.img1,
  //     required this.img2,
  //     required this.createdOn,
  //     required this.requestedBy,
  //     required this.validatedBy});

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
              donedelevery,
            )),
        title: Text(
          "refNumber",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: const <Widget>[
            Icon(Icons.attachment_outlined),
            Text("refType!", style: TextStyle(color: Colors.blue))
          ],
        ),
        trailing: const Icon(Icons.keyboard_arrow_right,
            color: Colors.blue, size: 30.0),
        onTap: () {
          // Get.offNamed('/viewrequest', arguments: {
          //   'requestId': requestId,
          //   'refNumber': refNumber,
          //   'refType': refType,
          //   'approvalText': approvalText,
          //   'img1': img1,
          //   'img2': img2,
          //   'createdOn': createdOn,
          //   'requestedBy': requestedBy,
          //   'validatedBy': validatedBy,
          //   'title': 'View Request'
          // });
        },
      ),
    );
  }
}
