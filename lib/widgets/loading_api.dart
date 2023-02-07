import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../src/color.dart';

class LoadingApi {
  RxInt loading = RxInt(0);

  pushLoading({Widget? childLoading}) {
    loading.value++;
    if (isLoading() && Get.isDialogOpen != true) {
      Get.dialog(Container(
        padding: EdgeInsets.all(150),
        // color: Colors.transparent,
        child: Lottie.asset(
          'assets/lottie/23707-book-animation-for-loader.json',
        )
        // GestureDetector(
        //   onTap: () {},
        //   child: const Center(child:CircularProgressIndicator(color: COLORS.PRIMARY_COLOR,)),
        // ),
      ));
    }
  }

  popLoading() {
    loading.value > 0 ? loading.value-- : loading.value = 0;
    if (!this.isLoading() && Get.isDialogOpen == true) {
      Get.back();
      for(int i=0;i<loading.value;i++){
        Get.back();
      }
    }
  }

  bool isLoading() {
    return loading.value > 0;
  }
}
