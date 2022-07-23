import 'package:adil_vectracom_test/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  final AppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>
          appController.dashboardViews[appController.navigationIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.login),
                label: 'Login',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
            currentIndex: appController.navigationIndex.value,
            onTap: (index) => appController.onNavigationTab(index),
            selectedItemColor: Colors.blue),
      ),
    );
  }
}
