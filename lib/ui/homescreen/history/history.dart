import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/constants/colors.dart';
import 'package:sellitedriver/constants/image_strings.dart';
import 'package:sellitedriver/controllers/homescreen/history/history_controller.dart';
import 'package:sellitedriver/utils/theme/completed_list_card_ui.dart';

class History extends StatelessWidget {
  final HistoryController historyController = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Get.isDarkMode ? cDarkAccentColor : cAccentColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Completed Oreders",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // dashboardController.getApprovelRequests();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: cWhiteColor,
                        backgroundImage: AssetImage(refresh),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),

        // package List

        // Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: Text("Orders", style: Theme.of(context).textTheme.headline1),
        // ),

        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CompletedListCardUI(
                    // requestId: dashboardController.requestsList[index].requestId,
                    // refNumber: dashboardController.requestsList[index].refNumber,
                    // refType: dashboardController.requestsList[index].refType,
                    // approvalText:
                    //     dashboardController.requestsList[index].approvalText,
                    // img1: dashboardController.requestsList[index].img1,
                    // img2: dashboardController.requestsList[index].img2,
                    // createdOn: dashboardController.requestsList[index].createdOn,
                    // requestedBy:
                    //     dashboardController.requestsList[index].requestedBy,
                    // validatedBy:
                    //     dashboardController.requestsList[index].validatedBy,
                    ),
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
