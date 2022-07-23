
import 'package:flutter/material.dart';


class SplashView extends StatelessWidget {
 const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff154072),
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
