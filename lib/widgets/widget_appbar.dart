import 'package:get/get.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetAppbar extends StatelessWidget {
  final String? title;
  final Widget? widgetTitle;
  final Widget? left;
  final Widget? right;
  final Color? textColor, backgroundColor;
  final double? height;
  final bool? isTitleCenter;
  final bool? isDivider;

  const WidgetAppbar({
    Key? key,
    this.title,
    this.widgetTitle,
    this.left,
    this.right,
    this.backgroundColor,
    this.textColor = COLORS.WHITE,
    this.height,
    this.isTitleCenter = false,
    this.isDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 5),
            child: SizedBox(
              width: Get.width,
              // height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  left != null
                      ? Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: left
                          ),
                      )
                      : AppValue.kEmptyWidget,
                  // AppValue.hSpace(16),
                  //isTitleCenter == true ? Spacer() : AppValue.kEmptyWidget,
                  Expanded(
                    child: Align(
                      // alignment: isTitleCenter == true ? Alignment.center : Alignment.centerLeft,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        // margin: EdgeInsets.only(left: isTitleCenter == true ? 35 : 70),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: widgetTitle ?? Text(
                          title ?? "",
                          style: AppStyle.DEFAULT_18_BOLD.copyWith(color: textColor),
                        ),
                      ),
                    ),
                  ),
                  // Spacer(),
                  // AppValue.hSpace(16),
                  right != null
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.only(right: 16),
                            child: right
                  ),
                      )
                      :
                  AppValue.kEmptyWidget,
                ],
              ),
            ),
          ),
          isDivider == true ? const Divider(
            color: COLORS.BACKGROUND,
            thickness: 0.8,
            height: 0,
          ) : AppValue.kEmptyWidget,
        ],
      ),
    );
  }
}
