import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Setting'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton.icon(
                  onPressed: () {
                    Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                    );

                    GetStorage()
                        .write('isBlack', Get.isDarkMode ? false : true);
                  },
                  icon: Icon(Icons.swap_horizontal_circle_sharp),
                  label: Text('Switch Theme')),
            ),
          ),
        ],
      ),
    );
  }
}
