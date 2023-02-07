import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';

import '../storages/storages.dart';


class dialogLogin extends StatelessWidget {
  const dialogLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: SizedBox(
        width: AppValue.widths*0.9,
        child: WidgetText(
          title: 'Bạn cần đăng nhập !!',
          style: AppStyle.DEFAULT_18.copyWith(
              fontWeight: FontWeight.w500
          ),
          textAlign: TextAlign.center,
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () async {
                AppNavigator.navigateLogin();
              },
              child: Container(
                width: Get.width*0.35,
                height: 48,
                decoration: BoxDecoration(
                    color: COLORS.PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: WidgetText(
                    title: 'Đồng ý',
                    style: AppStyle.DEFAULT_18.copyWith(
                        color: COLORS.WHITE
                    ),
                  ),
                ),
              ),
            ),
            AppValue.hSpaceSmall,
            GestureDetector(
              onTap: () {
                print('aaaaa:  ${shareLocal.getString(PreferencesKey.TOKEN)}');
                Navigator.pop(context);
                // AppNavigator.navigateSurveyFields();
              },
              child: Container(
                width: Get.width*0.35,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: COLORS.WHITE,
                    border: Border.all(width: 1,color: COLORS.PRIMARY_COLOR)
                ),
                child: Center(
                  child: WidgetText(
                    title: 'Hủy',
                    style: AppStyle.DEFAULT_18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}