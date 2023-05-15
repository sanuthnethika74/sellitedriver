import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellitedriver/constants/colors.dart';
import 'package:sellitedriver/constants/image_strings.dart';
import 'package:sellitedriver/controllers/homescreen/profile/profile_controller.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  ProfileController profileController = Get.put(ProfileController());

// profile page ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Obx(
      () => Column(children: [
        Container(
            height: Get.height * 0.2,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(deliveryprofilebg), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(
                    'https://vegestall.onrender.com/${profileController.profileImage.value}'),
              ),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(color: cAccentColor),
              //   padding: const EdgeInsets.all(10),
              //   child: Text(
              //     'John Doe Perera',
              //     style: Theme.of(context).textTheme.headline6,
              //   ),
              // ),
            ])),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Get.isDarkMode ? cDarkbgAccent : cWhiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${profileController.fname.value} ${profileController.lname.value}',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'First Name :',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${profileController.fname.value}',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_search,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Last Name :',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${profileController.lname.value}',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone_android,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Phone :',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${profileController.phone.value}',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Email :',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${profileController.email.value}',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}
