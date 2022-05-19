import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/blank_page.dart';

class ChangeImageController extends GetxController {
  RxInt count = RxInt(1);
  int x = 0;

  void previousVal() {
    if (count.value <= 1) {
      count.value = 3;
    } else {
      count.value--;
    }
  }

  void nextVal() {
    if (count.value >= 3) {
      count.value = 1;
    } else {
      count.value = count.value + 1;
    }
  }

  void navigate() => Get.to(() => const BlankPage());

  //
  // void navigate() {
  //   Get.to(() => const BlankPage());
  // }
}
