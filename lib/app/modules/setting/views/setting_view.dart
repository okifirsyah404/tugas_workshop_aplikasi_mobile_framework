import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  SettingView({Key? key}) : super(key: key);

  var appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
              // title: Text(Get.arguments),
              ),
          Obx(
            () => SwitchListTile(
              value: controller.isDarkMode.value,
              onChanged: (val) {
                controller.changeTheme(val);
              },
              title: Text("Dark Mode"),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Get.snackbar(
                "Snackbar",
                "Helllo this is the Snackbar message",
                snackPosition: SnackPosition.BOTTOM,
                colorText: Colors.white,
                backgroundColor: Colors.black87,
              );
            },
            child: Text("GetX Snackbar"),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                title: "Dialogue",
                content: Text('Hey, From Dialogue'),
              );
            },
            child: Text("GetX Dialog"),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text("Back to Home"),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
          ),
        ],
      ),
    );
  }
}
