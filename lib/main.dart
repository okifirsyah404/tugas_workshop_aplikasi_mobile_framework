import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tugas_workshop_aplikasi_mobile_framework/app/controllers/app_controller.dart';
import 'package:tugas_workshop_aplikasi_mobile_framework/app/modules/setting/controllers/setting_controller.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MainApp(),
  );
}

class MainApp extends StatelessWidget {
  MainApp({
    Key? key,
  }) : super(key: key);

  var settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData.light(),
      themeMode: ThemeMode.system,
    );
  }
}
