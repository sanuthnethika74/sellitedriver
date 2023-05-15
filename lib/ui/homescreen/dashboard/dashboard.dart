import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/constants/colors.dart';
import 'package:sellitedriver/constants/image_strings.dart';
import 'package:sellitedriver/controllers/homescreen/dashboard/dashboard_controller.dart';
import 'package:sellitedriver/utils/theme/list_card_ui.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            // dashboardController.goToQickLinks(99);
          },
          child: Container(
            margin: EdgeInsets.all(10),
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Color.fromRGBO(205, 0, 65, 1),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [cPrimaryColor, cAccentColor],
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: Get.width * 0.2,
                  height: Get.height * 0.2,
                  margin: EdgeInsets.all(15),
                  child: FutureBuilder(
                    future: Future.delayed(Duration(seconds: 2)),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Obx(
                          () => CircleAvatar(
                            backgroundImage: NetworkImage(
                              '${dashboardController.profileImage.value}',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Container(
                  width: Get.width * 0.5,
                  height: Get.height * 0.2,
                  margin: EdgeInsets.all(10),
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${dashboardController.fname.value} ${dashboardController.lname.value}",
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${dashboardController.email.value}",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "UID : ${dashboardController.id.value}",
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // package List

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Pending Orders",
              style: Theme.of(context).textTheme.headline1),
        ),

        Obx(
          () => dashboardController.isLoading.value == true
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(cPrimaryColor),
                    ),
                  ),
                )
              : dashboardController.pendingOrdersList.isEmpty
                  ? Center(
                      child: Text("No Pending Orders"),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListCardUI(
                              orderId: dashboardController
                                  .pendingOrdersList[index].orderId,
                              clientId: dashboardController
                                  .pendingOrdersList[index].clientId,
                              firstName: dashboardController
                                  .pendingOrdersList[index].firstName,
                              lastName: dashboardController
                                  .pendingOrdersList[index].lastName,
                              email: dashboardController
                                  .pendingOrdersList[index].email,
                              mobileNo: dashboardController
                                  .pendingOrdersList[index].mobileNo,
                              address: dashboardController
                                  .pendingOrdersList[index].address,
                              city: dashboardController
                                  .pendingOrdersList[index].city,
                              country: dashboardController
                                  .pendingOrdersList[index].country,
                              deliveryAddress: dashboardController
                                  .pendingOrdersList[index].deliveryAddress,
                              productId: dashboardController
                                  .pendingOrdersList[index].productId,
                              title: dashboardController
                                  .pendingOrdersList[index].title,
                              date: dashboardController
                                  .pendingOrdersList[index].date,
                            ),
                          );
                        },
                        itemCount: dashboardController.pendingOrdersList.length,
                      ),
                    ),
        ),
      ],
    );
  }
}

// class PendingOrders {
// //firstName, lastName, email, mobileNo, address, city, country, deliveryAddress, productId, title, date

//   String? orderId;
//   String? clientId;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? mobileNo;
//   String? address;
//   String? city;
//   String? country;
//   String? deliveryAddress;
//   String? productId;
//   String? title;
//   String? date;

//   PendingOrders(
//       {this.orderId,
//       this.clientId,
//       this.firstName,
//       this.lastName,
//       this.email,
//       this.mobileNo,
//       this.address,
//       this.city,
//       this.country,
//       this.deliveryAddress,
//       this.productId,
//       this.title,
//       this.date});
// }
