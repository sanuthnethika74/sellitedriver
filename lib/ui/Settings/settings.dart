import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sellitedriver/constants/colors.dart';
import 'package:sellitedriver/constants/image_strings.dart';
import 'package:sellitedriver/controllers/settings/settings_controller.dart';
import 'package:sellitedriver/ui/drawer/drawer2.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerTwo(),
      appBar: AppBar(
        title: Text(
          "App Settings",
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: CircleAvatar(
                    radius: 52,
                    backgroundColor: cWhiteColor,
                    backgroundImage: AssetImage(LogoJpg)),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Display",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        RadioListTile<int>(
                            value: 1,
                            groupValue: settingsController.selectedMode.value,
                            title: Text("Default"),
                            subtitle: Text("System default theme color"),
                            onChanged: (value) {
                              settingsController.changeIndex(value!);
                            }),
                        Divider(),
                        RadioListTile<int>(
                            value: 2,
                            groupValue: settingsController.selectedMode.value,
                            title: Text("Dark Theme"),
                            subtitle: Text("Set Theme as Dark"),
                            onChanged: (value) {
                              settingsController.changeIndex(value!);
                            }),
                        Divider(),
                        RadioListTile<int>(
                            value: 3,
                            groupValue: settingsController.selectedMode.value,
                            title: Text("Light Theme"),
                            subtitle: Text("Set Theme as Light"),
                            onChanged: (value) {
                              settingsController.changeIndex(value!);
                            }),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
