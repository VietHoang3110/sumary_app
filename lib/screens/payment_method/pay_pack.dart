import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sumary_app/widgets/widgets.dart';

import '../../src/color.dart';
import '../../src/src_index.dart';
import '../../widgets/widget_text.dart';

class Pay_Pack extends StatefulWidget {
  const Pay_Pack({Key? key}) : super(key: key);

  @override
  State<Pay_Pack> createState() => _Pay_PackState();
}

class _Pay_PackState extends State<Pay_Pack> {

  List<Map<String,dynamic>> title = [
    {"item":"TÊN NGÂN HÀNG:", "name":'Á Châu Bank (ACB)', },
    {"item":"SỐ TÀI KHOẢN:", "name":"382827", },
    {"item":"CHỦ KHOẢN:", "name":'HOANG THE SONG', },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: COLORS.WHITE,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _appBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                    width: AppValue.widths,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: AppValue.heights*0.027),
                          child: WidgetText(
                            title: "Mua Tâm Sách",
                            style: AppStyle.DEFAULT_16.copyWith(color: COLORS.GREY_400, fontWeight: FontWeight.w500),
                          ),
                        ),
                        WidgetText(
                          title: "Cách Thức Thanh Toán",
                          style: AppStyle.DEFAULT_24
                              .copyWith(fontSize: 25, color: COLORS.PRIMARY_COLOR, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child:  Image.asset("assets/icons/Group 16952.png", width: 115,),
                        ),
                        AppValue.vSpaceTiny,
                        SizedBox(
                          width: AppValue.widths*0.85,
                          child: WidgetText(
                            textAlign: TextAlign.center,
                            title: "Để mua Gói ưu đãi, Quý khách vui lòng Quét mã QR và nhập Mã Giao Dịch sau vào nội dung chuyển khoản",
                            maxLine: 2,
                            style: AppStyle.DEFAULT_16
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                AppValue.vSpaceSmall,
                Container(
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
                AppValue.vSpaceSmall,
                AppValue.vSpaceVrTiny,
                Container(
                  width: AppValue.widths,
                  height: 1,
                  color: COLORS.LIGHT_GREY,
                ),
                AppValue.vSpaceSmall,
                AppValue.vSpaceVrTiny,
                Container(
                  width: AppValue.widths*0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: COLORS.PRIMARY_COLOR)
                  ),
                  child: Column(
                    children: [
                      Container   (
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(9),
                              topLeft: Radius.circular(9)
                          ),
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                colors: [
                                  COLORS.PRIMARY_COLOR,
                                  COLORS.PRIMARY_COLOR2,
                                ]
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/tt_bank.svg"),
                              AppValue.hSpaceSmall,
                              WidgetText(
                                title: "THÔNG TIN NGÂN HÀNG",
                                style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w600, color: COLORS.WHITE),
                              )
                            ],
                          ),
                        ),
                      ),
                      AppValue.vSpaceTiny,
                      Image.asset("assets/icons/code_QR.png", width: AppValue.widths*0.68,),
                      AppValue.vSpaceTiny,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppValue.widths*0.31,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    colors: [
                                      COLORS.PRIMARY_COLOR,
                                      COLORS.PRIMARY_COLOR2,
                                    ]
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset("assets/icons/dowload.svg"),
                                  WidgetText(
                                    title: "Tải xuống",
                                    style: AppStyle.DEFAULT_18.copyWith(color: COLORS.WHITE),
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
                                gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    colors: [
                                      COLORS.PRIMARY_COLOR,
                                      COLORS.PRIMARY_COLOR2,
                                    ]
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset("assets/icons/shar_icone.svg"),
                                  WidgetText(
                                    title: "Chia sẻ",
                                    style: AppStyle.DEFAULT_18.copyWith(color: COLORS.WHITE),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      AppValue.vSpaceTiny,
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisExtent: AppValue.heights*0.077,
                          ),
                          itemCount: title.length,
                          itemBuilder: (context, index){
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: AppValue.widths*0.37,
                                  child: WidgetText(
                                    title: "${title[index]["item"]}",
                                    style: AppStyle.DEFAULT_16.copyWith(color: COLORS.GREY_5B, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  width: AppValue.widths*0.37,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      WidgetText(
                                        title: "${title[index]["name"]}",
                                        style: AppStyle.DEFAULT_16.copyWith(color: COLORS.BLUE, fontWeight: FontWeight.w500),
                                      ),
                                      title[index]["value"] == true
                                          ?InkWell(
                                            onTap:(){
                                              Clipboard.setData(ClipboardData(text: "382827"));
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                content: Text('Đã sao chép!!'),
                                              ));
                                            },
                                            child: Container(
                                        decoration: BoxDecoration(
                                            color: COLORS.BLUE,
                                            borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.only(top: 3, bottom: 2, left: 12, right: 12),
                                            child: WidgetText(
                                              title: "${title[index]["copy"]}",
                                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.WHITE),
                                            ),
                                        ),
                                      ),
                                          )
                                          :Container()
                                    ],
                                  ),
                                ),


                              ],
                            );
                          }),
                    ],
                  ),
                ),
                AppValue.vSpaceMedium,
                AppValue.vSpaceSmall,
              ],
            ),
          ),
        )
    );
  }
  _appBar(){
    return  Stack(
      children: [
        Image.asset("assets/icons/header_p.png"),
        Padding(
          padding: EdgeInsets.only(left: AppValue.widths*0.045, top: AppValue.heights*0.045, right: AppValue.widths*0.045),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/logo_bigsize.png', width: AppValue.widths*0.32,),
            ],
          ),
        )
      ],
    );
  }
}
