import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'controllers/dashboard.controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        leading: ZoomTapAnimation(
          onTap: () {
            // Get.back();
            showMessage(controller: controller);
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(100)),
            child: Icon(Icons.arrow_back),
          ),
        ),
        title: Text(
          'Inbox',
          style: TextStyle(color: Colors.grey.shade500),
        ),
        centerTitle: true,
        actions: [
          ZoomTapAnimation(
            onTap: () {
              controller.requestMessage();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              height: 30,
              width: 40,
              // margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.green.shade500,
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
          child: Obx(() => controller.loading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
                )
              : controller.mailList.length == 0
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No mail',
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey.shade500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ZoomTapAnimation(
                            onTap: () {
                              controller.requestMessage();
                            },
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.orange.shade600,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Refresh",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      child: ListView.builder(
                          itemCount: controller.mailList.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              // height: 60,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              color: Colors.blue.shade100,
                              child: Column(
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    color: Colors.grey.shade800,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: Text(
                                      "From: ${controller.mailList[index]['from']['address']}",
                                      style: TextStyle(
                                          color: Colors.grey.shade100),
                                    ),
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    color: Colors.grey.shade700,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: Text(
                                      "Subject: ${controller.mailList[index]['subject']}",
                                      style: TextStyle(
                                          color: Colors.grey.shade100),
                                    ),
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    color: Colors.blue.shade600,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child: Text(
                                        "${controller.mailList[index]['intro'] ?? "Email without body"}",
                                        style: TextStyle(
                                            color: Colors.grey.shade100),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })),
                    ))),
    );
  }
}

showMessage({required DashboardController controller}) {
  return showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Warning'),
            ZoomTapAnimation(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red.shade300),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        content: Text('Are you sure to sign out?'),
        actions: [
          ZoomTapAnimation(
            onTap: () {
              controller.requestSingOut();
            },
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  "Sign out",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}
