import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sumary_app/widgets/widgets.dart';

import '../../../../src/src_index.dart';

class widget_course extends StatelessWidget {
  const widget_course({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: 1,
          color: COLORS.GREY.withOpacity(0.15),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/khoaHoc.svg'),
              AppValue.vSpaceSmall,
              WidgetText(
                title: 'Khoá học sẽ ra mắt vào tháng 06/2023',
                style: AppStyle.DEFAULT_14,
              ),
              AppValue.vSpaceTiny,
              WidgetButton(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const WidgetDialog(
                        title: MESSAGES.NOTIFICATION,
                        content: 'Khoá học sẽ ra mắt vào tháng 06/2023',
                      );
                    },
                  );
                },
                height: 40,
                text: "Tham gia ngay",
              )
            ],
          ),
        ),
      ],
    );
  }
}