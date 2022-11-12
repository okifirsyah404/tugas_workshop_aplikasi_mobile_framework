import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  final storage = GetStorage();
  late RxBool isDarkMode;

  bool? get storageData => storage.read('darkmode');

  void checkStorageExist() {
    isDarkMode = storageData?.obs ?? false.obs;
  }

  ThemeData get setDefaultTheme =>
      isDarkMode.value ? ThemeData.dark() : ThemeData.light();

  void changeTheme(bool val) {
    isDarkMode.value = val;
    isDarkMode.value
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());
    storage.write("darkmode", val);
  }

  @override
  void onInit() {
    checkStorageExist();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
