import 'dart:convert';

import 'package:adil_vectracom_test/models/animal_model.dart';
import 'package:adil_vectracom_test/views/dashboard_view.dart';
import 'package:adil_vectracom_test/views/home_view.dart';
import 'package:adil_vectracom_test/views/login_view.dart';
import 'package:adil_vectracom_test/views/setting_view.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  RxInt navigationIndex = 1.obs;
  RxBool isHidePassword = true.obs;

  List<StatelessWidget> dashboardViews = [
    LoginView(),
    HomeView(),
    SettingView(),
  ];

  late List<Animal> animalsData;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1)).then((_) async {
      checkTheme();
      await getAnimalData();
      Get.to(() => LoginView());
    });
  }

  checkTheme() {
    GetStorage().read('isBlack');

    if (GetStorage().read('isBlack') == null ||
        GetStorage().read('isBlack') == false) {
      Get.changeTheme(ThemeData.light());
    } else {
      Get.changeTheme(ThemeData.dark());
    }
  }

  onNavigationTab(int index) {
    if (index == 0) {
      Get.back();
      return;
    }
    navigationIndex.value = index;
  }

  onPasswordView() {
    isHidePassword.value = !isHidePassword.value;
  }

  Future getAnimalData() async {
    dio.Response response = await dio.Dio()
        .get('https://zoo-animal-api.herokuapp.com/animals/rand/10');

    animalsData = animalFromJson(jsonEncode(response.data));
  }
}
