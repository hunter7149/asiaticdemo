import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'controllers/createuser.controller.dart';

class CreateuserScreen extends GetView<CreateuserController> {
  const CreateuserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: ZoomTapAnimation(
          onTap: () {
            Get.back();
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
          'Create User',
          style: TextStyle(color: Colors.grey.shade500),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/6300830.jpg'),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 40,
                          child: TextField(
                            controller: controller.email,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          controller.domain.value.isEmpty
                              ? 'Loading..'
                              : '@ ${controller.domain.value}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    child: TextField(
                      controller: controller.password,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      controller.requestAccountCreation();
                    },
                    child: Container(
                      // margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.teal.shade300,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Create",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
