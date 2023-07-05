import 'package:asiatic/infrastructure/api/service/prefrences.dart';
import 'package:asiatic/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset('assets/images/5500661.jpg'),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Container(
                      child: Center(
                        child: Text(
                          "Welcome to Asiatic",
                          style: TextStyle(
                              color: Colors.blue.shade500, fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Column(
                  children: [
                    ZoomTapAnimation(
                      onTap: () {
                        Get.toNamed(Routes.CREATEUSER);
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: Colors.pink.shade700,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Create an account',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ZoomTapAnimation(
                      onTap: () {
                        if (Pref.readData(key: Pref.LOGIN_INFORMATION) !=
                            null) {
                          Get.offNamed(Routes.DASHBOARD);
                        } else {
                          Get.toNamed(Routes.LOGINUSER);
                        }
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade400,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
