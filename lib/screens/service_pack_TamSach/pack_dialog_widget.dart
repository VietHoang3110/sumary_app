import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';

class ShowDialog_Pack {

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

  //Todo: Kiệt

  static createDialog_Pack({
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


  //Todo: thanh toán 13, 20, 24, 22
  static createDialog_PayQR({
    required BuildContext context,
    required int? value,
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
                        padding: EdgeInsets.only(top: 0),
                        child: Image.asset("assets/icons/diaLog_t.png",
                          height: AppValue.heights*0.13,
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
                          child: Text("THANH TOÁN", style: AppStyle.DEFAULT_16.copyWith(fontSize: 23, fontWeight: FontWeight.w600, color: COLORS.WHITE), textAlign: TextAlign.center,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppValue.heights*0.09, left: AppValue.widths*0.14, right: AppValue.widths*0.14),
                        child: Image.asset(value == 1
                            ? "assets/images/qr_vnP.png"
                            : value == 2
                            ? "assets/images/qr_momo.png"
                            : value == 3
                            ? "assets/images/qr_viettelP.png"
                            : value == 4
                            ? "assets/images/qr_zaloP.png"
                            : ""
                          , height: AppValue.heights*0.241,),
                      ),
                    ],
                  ),
                  AppValue.vSpaceSmall,
                  InkWell(
                    onTap: (){
                      createDialog_PayQRconfirm(
                          context: context,
                          titleButton1: '',
                          value: value,
                          account: 'MinhHoang2855',
                          phoneNumber: '0123456789',
                          pack: '*Gói Tuần',
                          time: '10:08 / 24-10-2022',
                          price: "69.000"
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              colors: [
                                COLORS.PRIMARY_COLOR,
                                COLORS.PRIMARY_COLOR2,
                              ]
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 5),
                        child: Text(
                          "Quét mã QR",
                          style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                        ),
                      ),
                    ),
                  ),
                  AppValue.vSpaceTiny,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "(Nhấn ",
                            style: AppStyle.DEFAULT_12
                          ),
                          TextSpan(
                              text: "Quét mã QR ",
                              style: AppStyle.DEFAULT_12.copyWith(color: COLORS.PRIMARY_COLOR)
                          ),
                          TextSpan(
                              text: "để tiến hành giao dịch)",
                              style: AppStyle.DEFAULT_12
                          ),
                        ]
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/icons/luu_y.png", height: 12,),
                      Column(
                        children: [
                          SizedBox(
                            width: AppValue.widths*0.655,
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "LƯU Ý: ",
                                  style: AppStyle.DEFAULT_14.copyWith(color: COLORS.RED4,)
                                ),
                                TextSpan(
                                    text: "Nhập Mã số sau vào ",
                                    style: AppStyle.DEFAULT_14
                                ),
                                TextSpan(
                                    text: "Nội dung chuyển khoản",
                                    style: AppStyle.DEFAULT_14.copyWith(color: COLORS.BLUE)
                                ),
                              ]
                            )),
                          ),
                        ],
                      )
                    ],
                  ),
                  AppValue.vSpaceTiny,
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Container(
                      width: AppValue.widths*0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: COLORS.WHITE,
                          border: Border.all(
                            width: 1,
                            color: COLORS.RED2,
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetText(
                              title: "891241091274akefnkjsdf",
                            ),
                            InkWell(
                              onTap: (){
                                Clipboard.setData(ClipboardData(text: "891241091274akefnkjsdf"));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Đã sao chép!!'),
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: COLORS.BLUE,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 1),
                                  child: WidgetText(
                                    title: "Copy",
                                    style: AppStyle.DEFAULT_14.copyWith(color: COLORS.WHITE),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  AppValue.vSpaceVrTiny,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/Group 18372.svg", height: 10,)
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        Image.asset("assets/icons/Vector 12.png",),
                        Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap:(){
                              AppNavigator.navigateBack();
                            },
                            child: Container(
                              width: AppValue.widths*0.67,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: COLORS.GREY_E5
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  bottom: 11,
                                ),
                                child: WidgetText(
                                  title: "QUAY LẠI",
                                  style: AppStyle.DEFAULT_20.copyWith(fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

            )
        );
      },
    );
  }

  //Todo: thanh toán : 26
  static createDialog_PayQRbank({
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
                        padding: EdgeInsets.only(top: 0),
                        child: Image.asset("assets/icons/diaLog_t.png",
                          height: AppValue.heights*0.13,
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
                          child: Text("THANH TOÁN", style: AppStyle.DEFAULT_16.copyWith(fontSize: 23, fontWeight: FontWeight.w600, color: COLORS.WHITE), textAlign: TextAlign.center,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppValue.heights*0.09, left: AppValue.widths*0.14, right: AppValue.widths*0.14),
                        child: Image.asset("assets/images/qr_bank.png"
                          , height: AppValue.heights*0.241,),
                      ),
                    ],
                  ),
                  AppValue.vSpaceSmall,
                  InkWell(
                    onTap:(){
                      createDialog_PayQRconfirm_Bank(
                        context: context,
                        titleButton1: '',
                        value: value,
                        account: 'MinhHoang2855',
                        phoneNumber: '0123456789',
                        pack: '*Gói Tuần',
                        time: '10:08 / 24-10-2022',
                        price: "69.000"
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              colors: [
                                COLORS.PRIMARY_COLOR,
                                COLORS.PRIMARY_COLOR2,
                              ]
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 5),
                        child: Text(
                          "Quét mã QR",
                          style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                        ),
                      ),
                    ),
                  ),
                  AppValue.vSpaceTiny,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: "(Nhấn ",
                                style: AppStyle.DEFAULT_12
                            ),
                            TextSpan(
                                text: "Quét mã QR ",
                                style: AppStyle.DEFAULT_12.copyWith(color: COLORS.PRIMARY_COLOR)
                            ),
                            TextSpan(
                                text: "để tiến hành giao dịch)",
                                style: AppStyle.DEFAULT_12
                            ),
                          ]
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/icons/luu_y.png", height: 12,),
                      Column(
                        children: [
                          SizedBox(
                            width: AppValue.widths*0.655,
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "LƯU Ý: ",
                                          style: AppStyle.DEFAULT_14.copyWith(color: COLORS.RED4,)
                                      ),
                                      TextSpan(
                                          text: "Nhập Mã số sau vào ",
                                          style: AppStyle.DEFAULT_14
                                      ),
                                      TextSpan(
                                          text: "Nội dung chuyển khoản",
                                          style: AppStyle.DEFAULT_14.copyWith(color: COLORS.BLUE)
                                      ),
                                    ]
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                  AppValue.vSpaceTiny,
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Container(
                      width: AppValue.widths*0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: COLORS.WHITE,
                          border: Border.all(
                            width: 1,
                            color: COLORS.RED2,
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetText(
                              title: "891241091274akefnkjsdf",
                            ),
                            InkWell(
                              onTap: (){
                                Clipboard.setData(ClipboardData(text: "891241091274akefnkjsdf"));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Đã sao chép!!'),
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: COLORS.BLUE,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 1),
                                  child: WidgetText(
                                    title: "Copy",
                                    style: AppStyle.DEFAULT_14.copyWith(color: COLORS.WHITE),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  AppValue.vSpaceVrTiny,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/Group 18372.svg", height: 12,)
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        Image.asset("assets/icons/Vector 12.png",),
                        Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap:(){
                              AppNavigator.navigateBack();
                            },
                            child: Container(
                              width: AppValue.widths*0.67,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: COLORS.GREY_E5
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  bottom: 11,
                                ),
                                child: WidgetText(
                                  title: "QUAY LẠI",
                                  style: AppStyle.DEFAULT_20.copyWith(fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

            )
        );
      },
    );
  }

  //Todo: thanh toán 25, 23, 21, 19
  static createDialog_PayQRconfirm({
    required BuildContext context,
    int? value,
    String? packNumber,
    String? packName,
    String? packValue,
    String? discount,
    required String? account,
    required String? phoneNumber,
    required String? pack,
    required String? time,
    required String? price,
    String? title,
    String? title2,
    Color? color,
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
                        padding: EdgeInsets.only(top: 0),
                        child: Image.asset("assets/icons/diaLog_t.png",
                          height: AppValue.heights*0.13,
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
                          child: Text("THANH TOÁN", style: AppStyle.DEFAULT_16.copyWith(fontSize: 23, fontWeight: FontWeight.w600, color: COLORS.WHITE), textAlign: TextAlign.center,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 66, left: AppValue.widths*0.2, right: AppValue.widths*0.2),
                        child: Container(
                          width: AppValue.widths *0.374,
                          decoration: BoxDecoration(
                            color: value == 1
                                ? COLORS.GREEN1
                                : value == 2
                                ? COLORS.VIOLET1
                                : value == 3
                                ? COLORS.RED2
                                : value == 4
                                ? COLORS.BLUE
                                : COLORS.WHITE,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  value == 1
                                      ? "assets/images/vn_pay.png"
                                      : value == 2
                                      ? "assets/images/momo.png"
                                      : value == 3
                                      ? "assets/images/vietel_pay.png"
                                      : value == 4
                                      ? "assets/images/zalo_pay.png"
                                      : "",
                                  width: 23, height: 23,),
                                AppValue.hSpaceTiny,
                                WidgetText(
                                  title:value == 1
                                      ? "Vn Pay"
                                      : value == 2
                                      ? "MoMo"
                                      : value == 3
                                      ? "Viettel Pay"
                                      : value == 4
                                      ? "Zalo Pay"
                                      : "",
                                  style: AppStyle.DEFAULT_16.copyWith(color:COLORS.WHITE),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [

                        AppValue.vSpaceSmall,
                        Container(
                          width: AppValue.widths,
                          height: 1,
                          color: COLORS.GREY_EB,
                        ),
                        AppValue.vSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetText(
                              title: "Tài khoản:",
                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.GREY_A6),
                            ),
                            WidgetText(
                              title: "$account",
                              style: AppStyle.DEFAULT_14,
                            ),
                          ],
                        ),
                        AppValue.vSpaceTiny,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetText(
                              title: "Số điện thoại:",
                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.GREY_A6),
                            ),
                            WidgetText(
                              title: "$phoneNumber",
                              style: AppStyle.DEFAULT_14,
                            ),
                          ],
                        ),
                        AppValue.vSpaceTiny,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetText(
                              title: "Gói giao dịch:",
                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.GREY_A6),
                            ),
                            WidgetText(
                              title: "$pack",
                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR),
                            ),
                          ],
                        ),
                        AppValue.vSpaceTiny,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetText(
                              title: "Thời gian:",
                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.GREY_A6),
                            ),
                            WidgetText(
                              title: "$time",
                              style: AppStyle.DEFAULT_14,
                            ),
                          ],
                        ),
                        AppValue.vSpaceSmall,
                        Container(
                          width: AppValue.widths,
                          height: 1,
                          color: COLORS.GREY_EB,
                        ),
                        AppValue.vSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetText(
                              title: "Số tiền đã thanh toán:",
                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.GREY_A6),
                            ),
                            WidgetText(
                              title: "${price}vnđ",
                              style: AppStyle.DEFAULT_18.copyWith(color: COLORS.PRIMARY_COLOR),
                            ),
                          ],
                        ),
                        AppValue.vSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: AppValue.widths*0.31,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: COLORS.BLUE
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/icons/dowload.svg", width: 15, height: 15,),
                                    AppValue.hSpaceVrTiny,
                                    WidgetText(
                                      title: "Tải xuống",
                                      style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            AppValue.hSpaceSmall,
                            Container(
                              width: AppValue.widths*0.31,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: COLORS.GREEN1
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/icons/shar_icone.svg", width: 15, height: 15,),
                                    AppValue.hSpaceVrTiny,
                                    WidgetText(
                                      title: "Chia sẻ",
                                      style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppValue.vSpaceSmall,
                  SvgPicture.asset("assets/images/Group 18363.svg", height: 10,),
                  AppValue.vSpaceSmall,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        Image.asset("assets/icons/Vector 12.png",),
                        Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap:(){
                              AppNavigator.navigateBack();
                            },
                            child: Container(
                              width: AppValue.widths*0.67,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: COLORS.PRIMARY_COLOR
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  bottom: 11,
                                ),
                                child: WidgetText(
                                  title: "XÁC NHẬN",
                                  style: AppStyle.DEFAULT_20.copyWith(fontWeight: FontWeight.w500, color: COLORS.WHITE),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

            )
        );
      },
    );
  }


//Todo: thanh toán 27
  static createDialog_PayQRconfirm_Bank({
    required BuildContext context,
    int? value,
    String? packNumber,
    String? packName,
    String? packValue,
    String? discount,
    required String? account,
    required String? phoneNumber,
    required String? pack,
    required String? time,
    required String? price,
    String? title,
    String? title2,
    Color? color,
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
                        padding: EdgeInsets.only(top: 0),
                        child: Image.asset("assets/icons/diaLog_t.png",
                          height: AppValue.heights*0.13,
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
                          child: Text("THANH TOÁN", style: AppStyle.DEFAULT_16.copyWith(fontSize: 23, fontWeight: FontWeight.w600, color: COLORS.WHITE), textAlign: TextAlign.center,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 66, left: AppValue.widths*0.05, right: AppValue.widths*0.05),
                        child: Stack(
                          children: [
                            Image.asset("assets/icons/bank_img.png",
                              width: AppValue.widths*0.71,
                              height: AppValue.heights*0.06, fit: BoxFit.fill,),
                            Padding(
                              padding: EdgeInsets.only(top: AppValue.heights*0.0058, left: AppValue.widths*0.02),
                              child: SvgPicture.asset("assets/icons/bank_icon.svg",height: 35,),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: AppValue.heights*0.008, left: AppValue.widths*0.14),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  WidgetText(
                                    title: "Chuyển khoản ngân hàng",
                                    style: AppStyle.DEFAULT_18_BOLD.copyWith(color: COLORS.WHITE, fontSize: 14),
                                  ),

                                  WidgetText(
                                      title: "(Miễn phí và an toàn)",
                                      style: AppStyle.DEFAULT_12.copyWith(fontSize: 11, color:COLORS.WHITE)
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [

                        AppValue.vSpaceSmall,
                        Container(
                          width: AppValue.widths,
                          height: 1,
                          color: COLORS.GREY_EB,
                        ),
                        AppValue.vSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetText(
                              title: "Tài khoản:",
                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.GREY_A6),
                            ),
                            WidgetText(
                              title: "$account",
                              style: AppStyle.DEFAULT_14,
                            ),
                          ],
                        ),
                        AppValue.vSpaceTiny,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetText(
                              title: "Số điện thoại:",
                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.GREY_A6),
                            ),
                            WidgetText(
                              title: "$phoneNumber",
                              style: AppStyle.DEFAULT_14,
                            ),
                          ],
                        ),
                        AppValue.vSpaceTiny,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetText(
                              title: "Gói giao dịch:",
                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.GREY_A6),
                            ),
                            WidgetText(
                              title: "$pack",
                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR),
                            ),
                          ],
                        ),
                        AppValue.vSpaceTiny,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetText(
                              title: "Thời gian:",
                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.GREY_A6),
                            ),
                            WidgetText(
                              title: "$time",
                              style: AppStyle.DEFAULT_14,
                            ),
                          ],
                        ),
                        AppValue.vSpaceSmall,
                        Container(
                          width: AppValue.widths,
                          height: 1,
                          color: COLORS.GREY_EB,
                        ),
                        AppValue.vSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetText(
                              title: "Số tiền đã thanh toán:",
                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.GREY_A6),
                            ),
                            WidgetText(
                              title: "${price}vnđ",
                              style: AppStyle.DEFAULT_18.copyWith(color: COLORS.PRIMARY_COLOR),
                            ),
                          ],
                        ),
                        AppValue.vSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: AppValue.widths*0.31,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: COLORS.BLUE
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/icons/dowload.svg", width: 15, height: 15,),
                                    AppValue.hSpaceVrTiny,
                                    WidgetText(
                                      title: "Tải xuống",
                                      style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            AppValue.hSpaceSmall,
                            Container(
                              width: AppValue.widths*0.31,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: COLORS.GREEN1
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7, bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/icons/shar_icone.svg", width: 15, height: 15,),
                                    AppValue.hSpaceVrTiny,
                                    WidgetText(
                                      title: "Chia sẻ",
                                      style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppValue.vSpaceSmall,
                  SvgPicture.asset("assets/images/Group 18363.svg", height: 10,),
                  AppValue.vSpaceSmall,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        Image.asset("assets/icons/Vector 12.png",),
                        Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap:(){
                              AppNavigator.navigateBack();
                            },
                            child: Container(
                              width: AppValue.widths*0.67,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: COLORS.PRIMARY_COLOR
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  bottom: 11,
                                ),
                                child: WidgetText(
                                  title: "XÁC NHẬN",
                                  style: AppStyle.DEFAULT_20.copyWith(fontWeight: FontWeight.w500, color: COLORS.WHITE),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

            )
        );
      },
    );
  }
}

