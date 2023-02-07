import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';

import '../storages/share_local.dart';

class ShowDialogCustom {

  static showLoading() {
    showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return TrailLoading();
      },
    );
  }

  static endLoading() {
    Get.back();
  }

  static showDialogOneButton({String? title, String? content, String? textButton, Color? colorButton, VoidCallback? onTap}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return WidgetDialog(
          title: title ?? MESSAGES.NOTIFICATION,
          content: content ?? MESSAGES.SUCCESS,
          onTap1: onTap,
          textButton1: textButton,
          backgroundButton1: colorButton,
        );
      },
    );
  }

  static showDialogTwoButton({String? title, String? content, String? textButton1, Color? colorButton1, VoidCallback? onTap1, String? textButton2, Color? colorButton2, VoidCallback? onTap2}) {
    showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? 'Thông báo', style: AppStyle.DEFAULT_16_BOLD.copyWith(fontSize: 18),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content ?? 'Nội dung thông báo', style: AppStyle.DEFAULT_16,),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(textButton1 ?? 'OK', style: AppStyle.DEFAULT_16.copyWith(fontSize: 18, color: colorButton1 ?? Colors.black),),
              onPressed: onTap1 ?? ()=> Get.back(),
            ),
            TextButton(
              child: Text(textButton2 ?? 'Hủy', style: AppStyle.DEFAULT_16.copyWith(fontSize: 18, color: colorButton2 ?? Colors.black),),
              onPressed: onTap2 ?? ()=> Get.back(),
            ),
          ],
        );
      },
    );
  }

  static showDialogTwoButton2({String? title, String? content, String? textButton1, Color? colorButton1, VoidCallback? onTap1, String? textButton2, Color? colorButton2, VoidCallback? onTap2}) {
    showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? 'Thông báo', style: AppStyle.DEFAULT_16_BOLD.copyWith(fontSize: 18),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content ?? 'Nội dung thông báo', style: AppStyle.DEFAULT_16,),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(textButton1 ?? 'OK', style: AppStyle.DEFAULT_16.copyWith(fontSize: 18, color: colorButton1 ?? Colors.black),),
              onPressed: onTap1 ?? ()=> Get.back(),
            ),
            TextButton(
              child: Text(textButton2 ?? 'Hủy', style: AppStyle.DEFAULT_16.copyWith(fontSize: 18, color: colorButton2 ?? Colors.black),),
              onPressed: onTap2 ?? ()=> Get.back(),
            ),
          ],
        );
      },
    );
  }

  static createDialog({
    required BuildContext context,

    int? value,
    String? packNumber,
    String? packName,
    String? packValue,
    String? discount,


    String? title,
    String? title2,
    Widget? widgetContent,
    bool? isButtonClose, barrierDismissible,
    String? image,
    Image? image2,
    double? heightImage, widthImage,
    String? content,
    required String titleButton1,
    Color? bgButton1,
    String? titleButton2, titleButton3,
    VoidCallback? onTap1, onTap2, onTap3,
    TextStyle? textStyle1, textStyle2, textStyle3,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            content: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: AppValue.widths*0.065, top: AppValue.heights*0.12),
                        child: value == 1
                            ? Stack(
                          children: [
                            Image.asset("assets/icons/pack1.png", width: AppValue.widths*0.67,),
                            Padding (
                              padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                              child: Column(
                                children: [
                                  WidgetText(
                                    title: "GÓI",
                                    style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                                  ),
                                  WidgetText(
                                    title: "$packNumber",
                                    style: AppStyle.DEFAULT_16.copyWith(fontSize: 31, color: COLORS.WHITE),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: AppValue.widths*0.19, top: AppValue.heights*0.017 ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      WidgetText(
                                        title: "*$packName",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w600, color: COLORS.PRIMARY_COLOR),
                                      ),
                                      SizedBox(width: 4,),
                                      WidgetText(
                                        title: "$discount",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      WidgetText(
                                        title: "$packValue",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w800, color: COLORS.PRIMARY_COLOR),
                                      ),
                                      SizedBox(width: 4,),
                                      WidgetText(
                                        title: "Đồng/Tháng",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500,),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                            : value == 2
                            ? Stack(
                          children: [
                            Image.asset("assets/icons/pack2.png", width: AppValue.widths*0.67,),
                            Padding (
                              padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                              child: Column(
                                children: [
                                  WidgetText(
                                    title: "GÓI",
                                    style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                                  ),
                                  WidgetText(
                                    title: "$packNumber",
                                    style: AppStyle.DEFAULT_16.copyWith(fontSize: 31, color: COLORS.WHITE),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: AppValue.widths*0.19, top: AppValue.heights*0.017 ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      WidgetText(
                                        title: "*$packName",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w600, color: COLORS.PRIMARY_COLOR),
                                      ),
                                      SizedBox(width: 4,),
                                      WidgetText(
                                        title: "$discount",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      WidgetText(
                                        title: "$packValue",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w800, color: COLORS.PRIMARY_COLOR),
                                      ),
                                      SizedBox(width: 4,),
                                      WidgetText(
                                        title: "Đồng/Tháng",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500,),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                            : value == 3
                            ? Stack(
                          children: [
                            Image.asset("assets/icons/pack3.png", width: AppValue.widths*0.67,),
                            Padding (
                              padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                              child: Column(
                                children: [
                                  WidgetText(
                                    title: "GÓI",
                                    style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                                  ),
                                  WidgetText(
                                    title: "$packNumber",
                                    style: AppStyle.DEFAULT_16.copyWith(fontSize: 31, color: COLORS.WHITE),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: AppValue.widths*0.19, top: AppValue.heights*0.017 ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      WidgetText(
                                        title: "*$packName",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w600, color: COLORS.PRIMARY_COLOR),
                                      ),
                                      SizedBox(width: 4,),
                                      WidgetText(
                                        title: "$discount",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      WidgetText(
                                        title: "$packValue",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w800, color: COLORS.PRIMARY_COLOR),
                                      ),
                                      SizedBox(width: 4,),
                                      WidgetText(
                                        title: "Đồng/Tháng",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500,),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                            : Container(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: AppValue.widths*0.1, top: AppValue.heights*0.08),
                        child: value != null ? Text("Gói đã chọn:", style: AppStyle.DEFAULT_16.copyWith(color: COLORS.BLUE),) : Container(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image.asset("assets/icons/diaLog_t.png",
                          height: AppValue.heights*0.171,
                        ),
                      ),
                      Container(
                        width: AppValue.widths,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                colors: [
                                  COLORS.PRIMARY_COLOR,
                                  COLORS.PRIMARY_COLOR2,
                                ]
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Text("THANH TOÁN", style: AppStyle.DEFAULT_16.copyWith(fontSize: 23, fontWeight: FontWeight.w600, color: COLORS.WHITE), textAlign: TextAlign.center,),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: AppValue.heights*0.08, left: AppValue.widths*0.2, right: AppValue.widths*0.2),
                        child: image != null ? WidgetContainerImage(
                          image: image,
                          height: heightImage ?? AppValue.heights*0.18,
                          width: widthImage ?? AppValue.widths*0.42,
                        ): Container(),
                      ),
                      image != null ? AppValue.vSpaceTiny : AppValue.kEmptyWidget,
                    ],
                  ),



                  title2 != null
                      ? Text(title2 ?? "", style: AppStyle.DEFAULT_18
                            .copyWith(fontSize: 19, fontWeight: FontWeight.w600, color: COLORS.PRIMARY_COLOR),)
                      : Container(),
                  AppValue.vSpaceTiny,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: AppValue.widths*0.8,
                        child: Text(title ?? 'notification.notification'.tr, style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500,), textAlign: TextAlign.center,)),
                  ),
                  //AppValue.vSpaceSmall,

                  widgetContent == null ?
                  content != null ? Text(content, style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w600, color: COLORS.GREY_400), textAlign: TextAlign.center,) : Container()
                      : widgetContent,
                  AppValue.vSpaceTiny,

                  titleButton2 != null ? AppValue.vSpaceTiny : AppValue.kEmptyWidget,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      titleButton2 != null ? Container(
                        width: Get.width*0.55,
                        height: 40 ,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1,color: COLORS.PRIMARY_COLOR.withOpacity(0.5)),
                            color: COLORS.PRIMARY_COLOR
                        ),
                        child: Center(
                          child: InkWell(
                              onTap: onTap2 ?? ()=> Get.back(),
                              child: Text(titleButton2, style: textStyle2 ?? AppStyle.DEFAULT_14.copyWith(fontSize: 18, color: COLORS.WHITE, fontWeight: FontWeight.w500, height: 1 ),textAlign: TextAlign.center,)
                          ),
                        ),
                      ) : Container(),
                      SizedBox(height: 8,),
                      titleButton3 != null ? Container(
                        width: Get.width*0.55,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: COLORS.GREY_E5),
                        child: Center(
                          child: InkWell(
                              onTap: onTap3 ?? ()=> Get.back(),
                              child: Text(titleButton3, style: textStyle3 ?? AppStyle.DEFAULT_14.copyWith(fontSize: 18, color: COLORS.BLACK, fontWeight: FontWeight.w500, height: 1), textAlign: TextAlign.center,)
                          ),
                        ),
                      ) : Container(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset("assets/icons/Vector 12.png",),
                  ),
                ],
              ),

            )
        );
      },
    );
  }

  //////////

  static createDialog2({
    required BuildContext context,

    int? value,
    String? packNumber,
    String? packName,
    String? packValue,
    String? discount,


    String? title,
    String? title2,
    Widget? widgetContent,
    bool? isButtonClose, barrierDismissible,
    String? image,
    Image? image2,
    double? heightImage, widthImage,
    String? content,
    required String titleButton1,
    Color? bgButton1,
    String? titleButton2, titleButton3,
    VoidCallback? onTap1, onTap2, onTap3,
    TextStyle? textStyle1, textStyle2, textStyle3,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            content: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: AppValue.widths*0.065, top: AppValue.heights*0.12),
                        child: value == 1
                            ? Stack(
                          children: [
                            Image.asset("assets/icons/pack1.png", width: AppValue.widths*0.67,),
                            Padding (
                              padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                              child: Column(
                                children: [
                                  WidgetText(
                                    title: "GÓI",
                                    style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                                  ),
                                  WidgetText(
                                    title: "$packNumber",
                                    style: AppStyle.DEFAULT_16.copyWith(fontSize: 31, color: COLORS.WHITE),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: AppValue.widths*0.19, top: AppValue.heights*0.017 ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      WidgetText(
                                        title: "*$packName",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w600, color: COLORS.PRIMARY_COLOR),
                                      ),
                                      SizedBox(width: 4,),
                                      WidgetText(
                                        title: "$discount",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      WidgetText(
                                        title: "$packValue",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w800, color: COLORS.PRIMARY_COLOR),
                                      ),
                                      SizedBox(width: 4,),
                                      WidgetText(
                                        title: "Đồng/Tháng",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500,),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                            : value == 2
                            ? Stack(
                          children: [
                            Image.asset("assets/icons/pack2.png", width: AppValue.widths*0.67,),
                            Padding (
                              padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                              child: Column(
                                children: [
                                  WidgetText(
                                    title: "GÓI",
                                    style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                                  ),
                                  WidgetText(
                                    title: "$packNumber",
                                    style: AppStyle.DEFAULT_16.copyWith(fontSize: 31, color: COLORS.WHITE),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: AppValue.widths*0.19, top: AppValue.heights*0.017 ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      WidgetText(
                                        title: "*$packName",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w600, color: COLORS.PRIMARY_COLOR),
                                      ),
                                      SizedBox(width: 4,),
                                      WidgetText(
                                        title: "$discount",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      WidgetText(
                                        title: "$packValue",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w800, color: COLORS.PRIMARY_COLOR),
                                      ),
                                      SizedBox(width: 4,),
                                      WidgetText(
                                        title: "Đồng/Tháng",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500,),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                            : value == 3
                            ? Stack(
                          children: [
                            Image.asset("assets/icons/pack3.png", width: AppValue.widths*0.67,),
                            Padding (
                              padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                              child: Column(
                                children: [
                                  WidgetText(
                                    title: "GÓI",
                                    style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                                  ),
                                  WidgetText(
                                    title: "$packNumber",
                                    style: AppStyle.DEFAULT_16.copyWith(fontSize: 31, color: COLORS.WHITE),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: AppValue.widths*0.19, top: AppValue.heights*0.017 ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      WidgetText(
                                        title: "*$packName",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w600, color: COLORS.PRIMARY_COLOR),
                                      ),
                                      SizedBox(width: 4,),
                                      WidgetText(
                                        title: "$discount",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      WidgetText(
                                        title: "$packValue",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w800, color: COLORS.PRIMARY_COLOR),
                                      ),
                                      SizedBox(width: 4,),
                                      WidgetText(
                                        title: "Đồng/Tháng",
                                        style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500,),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                            : Container(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: AppValue.widths*0.1, top: AppValue.heights*0.08),
                        child: value != null ? Text("Gói đã chọn:", style: AppStyle.DEFAULT_16.copyWith(color: COLORS.BLUE),) : Container(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image.asset("assets/icons/diaLog_t.png",
                          height: AppValue.heights*0.171,
                        ),
                      ),
                      Container(
                        width: AppValue.widths,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                colors: [
                                  COLORS.PRIMARY_COLOR,
                                  COLORS.PRIMARY_COLOR2,
                                ]
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Text("THANH TOÁN", style: AppStyle.DEFAULT_16.copyWith(fontSize: 23, fontWeight: FontWeight.w600, color: COLORS.WHITE), textAlign: TextAlign.center,),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: AppValue.heights*0.08, left: AppValue.widths*0.2, right: AppValue.widths*0.2),
                        child: image != null ? WidgetContainerImage(
                          image: image,
                          height: heightImage ?? AppValue.heights*0.18,
                          width: widthImage ?? AppValue.widths*0.42,
                        ): Container(),
                      ),
                      image != null ? AppValue.vSpaceTiny : AppValue.kEmptyWidget,
                    ],
                  ),



                  title2 != null
                      ? Text(title2 ?? "", style: AppStyle.DEFAULT_18
                      .copyWith(fontSize: 19, fontWeight: FontWeight.w600, color: COLORS.PRIMARY_COLOR),)
                      : Container(),
                  AppValue.vSpaceTiny,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: AppValue.widths*0.8,
                        child: Text(title ?? 'notification.notification'.tr, style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500,), textAlign: TextAlign.center,)),
                  ),
                  //AppValue.vSpaceSmall,

                  widgetContent == null ?
                  content != null ? Text(content, style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w600, color: COLORS.GREY_400), textAlign: TextAlign.center,) : Container()
                      : widgetContent,
                  AppValue.vSpaceTiny,

                  titleButton2 != null ? AppValue.vSpaceTiny : AppValue.kEmptyWidget,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      titleButton2 != null ? Container(
                        width: Get.width*0.55,
                        height: 40 ,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1,color: COLORS.PRIMARY_COLOR.withOpacity(0.5)),
                            color: COLORS.PRIMARY_COLOR
                        ),
                        child: Center(
                          child: InkWell(
                              onTap: onTap2 ?? ()=> Get.back(),
                              child: Text(titleButton2, style: textStyle2 ?? AppStyle.DEFAULT_14.copyWith(fontSize: 18, color: COLORS.WHITE, fontWeight: FontWeight.w500, height: 1 ),textAlign: TextAlign.center,)
                          ),
                        ),
                      ) : Container(),
                      SizedBox(height: 8,),
                      titleButton3 != null ? Container(
                        width: Get.width*0.55,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: COLORS.GREY_E5),
                        child: Center(
                          child: InkWell(
                              onTap: onTap3 ?? ()=> Get.back(),
                              child: Text(titleButton3, style: textStyle3 ?? AppStyle.DEFAULT_14.copyWith(fontSize: 18, color: COLORS.BLACK, fontWeight: FontWeight.w500, height: 1), textAlign: TextAlign.center,)
                          ),
                        ),
                      ) : Container(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset("assets/icons/Vector 12.png",),
                  ),
                ],
              ),

            )
        );
      },
    );
  }

  static createDialogCS({
    required BuildContext context,
    bool? isButtonClose, barrierDismissible,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            content: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: AppValue.widths,
                      decoration: const BoxDecoration(
                          color: COLORS.PRIMARY_COLOR,
                          gradient:  LinearGradient(
                              begin: Alignment.topRight,
                              colors: [
                                COLORS.PRIMARY_COLOR,
                                COLORS.PRIMARY_COLOR2,
                              ]
                          ),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 9, bottom: 8),
                        child: WidgetText(
                          title: "GÓC THAM VẤN",
                          style: AppStyle.DEFAULT_24_BOLD.copyWith(fontSize: 22, color: COLORS.WHITE, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/icons/dfd.png", height: 29,),
                        Image.asset("assets/icons/dd.png", height: 12,),
                      ],
                    ),
                    Stack(
                      children: [
                        // Align(
                        //   alignment: Alignment.bottomRight,
                        //     child: Image.asset("assets/icons/dddd.png")),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: AppValue.widths*0.7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1, color: COLORS.RED2)
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: AppValue.widths*0.03,right: AppValue.widths*0.02, bottom: 4),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppValue.vSpaceTiny,
                                  AppValue.vSpaceTiny,
                                  WidgetText(
                                    title: "ĐỒNG HÀNH",
                                    style: AppStyle.DEFAULT_24.copyWith(color: COLORS.RED2, fontSize: 22, fontWeight: FontWeight.w500),
                                  ),
                                  AppValue.vSpaceVrTiny,
                                  SvgPicture.asset("assets/icons/slider_gray.svg"),
                                  AppValue.vSpaceTiny,
                                  AppValue.vSpaceVrTiny,

                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Khó khăn là điều không thể tránh khỏi trong cuộc sống của chúng ta, ',
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: 'mỗi người cần có một ',
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: 'tâm lý vững vàng ',
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500, color: COLORS.BLUE),
                                        ),
                                        TextSpan(
                                          text: "để đối mặt và vượt qua chúng. Hãy để ",
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: "để đối mặt và vượt qua chúng. Hãy để ",
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: "TN Master ",
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500, color: COLORS.RED2),
                                        ),
                                        TextSpan(
                                          text: "giúp bạn chiến thắng nghịch cảnh; dịch vụ tham vấn tâm lý của chúng tôi luôn sẵn sàng ",
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: "đồng hành và hỗ trợ ",
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500, color: COLORS.BLUE),
                                        ),
                                        TextSpan(
                                          text: "bạn mọi lúc mọi nơi.",
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  AppValue.vSpaceTiny,
                                  WidgetText(
                                    title: "LIỆU PHÁP",
                                    style: AppStyle.DEFAULT_24.copyWith(color: COLORS.RED2, fontSize: 22, fontWeight: FontWeight.w500),
                                  ),
                                  AppValue.vSpaceVrTiny,
                                  SvgPicture.asset("assets/icons/slider_gray.svg"),
                                  AppValue.vSpaceTiny,
                                  AppValue.vSpaceVrTiny,

                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Liệu trình kết hợp, giữa ',
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: 'Tâm lý học hiện đại ',
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500, color: COLORS.BLUE),
                                        ),
                                        TextSpan(
                                          text: 'và ',
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500,),
                                        ),
                                        TextSpan(
                                          text: 'phương pháp chữa lành phương Đông',
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500, color: COLORS.BLUE),
                                        ),
                                        TextSpan(
                                          text: ', chắc chắn sẽ giúp bạn cải thiện sức khỏe tâm lý một cách ',
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500,),
                                        ),
                                        TextSpan(
                                          text: 'hiệu quả và nhanh chóng.',
                                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500,color: COLORS.BLUE),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppValue.vSpaceVrTiny,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //AppValue.vSpaceVrTiny,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 10,),
                        Image.asset(
                          "assets/icons/logo_bigsize.png",
                          width: AppValue.widths*0.3,),
                        Image.asset("assets/icons/Ellipse 432.png"),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: AppValue.widths*0.8,
                        child:  Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Các chuyên viên tham vấn tại ',
                                style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: 'TN Master ',
                                style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500, color: COLORS.RED2),
                              ),
                              TextSpan(
                                text: 'giàu tâm đức và tinh thần trách nhiệm, luôn hiểu rõ và tuân thủ đạo đức nghề nghiệp; Với sứ mệnh đem lại cho khách hàng một ',
                                style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500,),
                              ),
                              TextSpan(
                                text: 'cuộc sống ý nghĩa ',
                                style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500, color: COLORS.BLUE),
                              ),
                              TextSpan(
                                text: 'và tốt đẹp hơn mỗi ngày!',
                                style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AppValue.vSpaceTiny,
                    WidgetText(
                      title: "(Chọn Bỏ Qua  để trở lại màn chính)",
                      style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    AppValue.vSpace(5),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: (){
                          shareLocal.putString("introTuVan",'aa');
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  colors: [
                                    COLORS.PRIMARY_COLOR,
                                    COLORS.PRIMARY_COLOR2,
                                  ]
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: AppValue.widths*0.075, right: AppValue.widths*0.075, top: 2, bottom: 1),
                            child: Text("BỎ QUA",
                              style: AppStyle.DEFAULT_16
                                  .copyWith(fontWeight: FontWeight.w500, color: COLORS.WHITE),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AppValue.vSpaceTiny,
                  ],
                ),
              ),

            )
        );
      },
    );
  }

  //Todo: Kiệt
  //ĐẶT LỊCH TƯ VẤN
  static createDialog_Consulting({
    required BuildContext context,

    int? value,
    String? packNumber,
    String? packName,
    String? packValue,
    String? discount,


    String? title,
    String? title2,
    Widget? widgetContent,
    bool? isButtonClose, barrierDismissible,
    String? image,
    Image? image2,
    double? heightImage, widthImage,
    String? content,
    required String titleButton1,
    Color? bgButton1,
    String? titleButton2, titleButton3,
    VoidCallback? onTap1, onTap2, onTap3,
    TextStyle? textStyle1, textStyle2, textStyle3,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            content: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Image.asset("assets/icons/diaLog_t.png",
                            height: AppValue.heights*0.171,
                          ),
                        ),
                        Container(
                          width: AppValue.widths,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  colors: [
                                    COLORS.PRIMARY_COLOR,
                                    COLORS.PRIMARY_COLOR2,
                                  ]
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Text("ĐẶT LỊCH TƯ VẤN", style: AppStyle.DEFAULT_16.copyWith(fontSize: 23, fontWeight: FontWeight.w600, color: COLORS.WHITE), textAlign: TextAlign.center,),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10, top: AppValue.heights*0.08),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WidgetText(
                                title: "Tên của bạn",
                                style: AppStyle.DEFAULT_12,
                              ),
                              WidgetInputkk(
                                hint: "Nhập tên",
                              ),
                              Container(
                                width: AppValue.widths,
                                height: 1,
                                color:  COLORS.PRIMARY_COLOR,
                              ),
                              AppValue.vSpaceTiny,
                              AppValue.vSpaceVrTiny,
                              WidgetText(
                                title: "Liên hệ",
                                style: AppStyle.DEFAULT_12,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:AppValue.widths*0.42,
                                    child: WidgetInputkk(
                                      hint: "Email của bạn",
                                    ),
                                  ),
                                  Spacer(),
                                  SvgPicture.asset("assets/icons/gold_phone.svg"),
                                  SizedBox(
                                    width:AppValue.widths*0.2,
                                    child: WidgetInputkk(
                                      hint: "Số điện thoại",
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: AppValue.widths,
                                height: 1,
                                color:  COLORS.PRIMARY_COLOR,
                              ),
                              AppValue.vSpaceTiny,
                              AppValue.vSpaceVrTiny,
                              WidgetText(
                                title: "Vấn đề gặp phải",
                                style: AppStyle.DEFAULT_12,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: AppValue.widths*0.55,
                                    child: WidgetInputkk(
                                      hint: "Chọn nguyên nhân",
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                      onTap:(){
                                      },
                                      child: SvgPicture.asset("assets/icons/drd.svg")),
                                  AppValue.hSpaceTiny
                                ],
                              ),
                              Container(
                                width: AppValue.widths,
                                height: 1,
                                color:  COLORS.PRIMARY_COLOR,
                              ),
                              AppValue.vSpaceTiny,
                              AppValue.vSpaceVrTiny,
                              WidgetText(
                                title: "Ngày đặt hẹn",
                                style: AppStyle.DEFAULT_12,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: AppValue.widths*0.5,
                                    child: WidgetInputkk(
                                      hint: "Thời gian",
                                    ),
                                  ),
                                  Spacer(),
                                  SvgPicture.asset("assets/icons/calculator.svg"),
                                  AppValue.hSpaceTiny
                                ],
                              ),
                              Container(
                                width: AppValue.widths,
                                height: 1,
                                color:  COLORS.PRIMARY_COLOR,
                              ),
                            ],
                          ),
                        )

                      ],
                    ),

                    AppValue.vSpaceTiny,

                    titleButton2 != null ? AppValue.vSpaceTiny : AppValue.kEmptyWidget,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: Get.width*0.55,
                          height: 40 ,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1,color: COLORS.PRIMARY_COLOR.withOpacity(0.5)),
                              color: COLORS.PRIMARY_COLOR
                          ),
                          child: Center(
                            child: InkWell(
                                onTap: onTap2 ?? ()=> Get.back(),
                                child: Text("XÁC NHẬN", style: textStyle2 ?? AppStyle.DEFAULT_14.copyWith(fontSize: 18, color: COLORS.WHITE, fontWeight: FontWeight.w500, height: 1 ),textAlign: TextAlign.center,)
                            ),
                          ),
                        ) ,

                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset("assets/icons/Vector 12.png",),
                    ),
                  ],
                ),
              ),

            )
        );
      },
    );
  }
}

