import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../src/src_index.dart';
import '../../../widgets/widget_text.dart';

class IntroRecommend extends StatefulWidget {
  const IntroRecommend({Key? key}) : super(key: key);

  @override
  State<IntroRecommend> createState() => _IntroRecommendState();
}

class _IntroRecommendState extends State<IntroRecommend> {

  bool check1 = false;
  bool check2 = false;

  //Todo: giới thiệu 7

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/icons/header_p.png"),
                Padding(
                  padding: EdgeInsets.only(left: AppValue.widths*0.045, top: AppValue.heights*0.045, right: AppValue.widths*0.045),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.arrow_back, color: COLORS.WHITE, ),
                          SizedBox(height: AppValue.heights*0.056,)
                        ],
                      ),
                      Image.asset('assets/icons/logo_bigsize.png', width: AppValue.widths*0.32,),
                      SizedBox(width: 20,),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: AppValue.heights*0.025,),
            WidgetText(
              title: "Giới thiệu",
              style: AppStyle.DEFAULT_16.copyWith(color: COLORS.GREY_CS, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4,),
            WidgetText(
              title: "Sản Phẩm & Dịch Vụ",
              style: AppStyle.DEFAULT_16.copyWith(fontSize: 35, color: COLORS.PRIMARY_COLOR, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8,),
            Image.asset("assets/icons/Group 16952.png", width: 115,),
            AppValue.vSpaceMedium,
            _expand1(),
            AppValue.vSpaceMedium,
            _expand2(),
            AppValue.vSpaceSmall,

            //////////////
            AppValue.vSpaceSmall,
            WidgetText(
              title: "(Xin chọn Sản phẩm & Dịch vụ bạn quan tâm)",
              style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w400, fontSize: 13),
            ),
            AppValue.vSpaceMedium,
            Stack(
              children: [
                Row(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                            "assets/icons/circle_left.svg"
                        )),

                    SvgPicture.asset("assets/icons/bottomBook.svg", width: AppValue.widths*0.75,),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Image.asset("assets/icons/pack_bottom.png"),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
  _expand1(){
    return Padding(
      padding: EdgeInsets.only(left: AppValue.widths*0.036, right: AppValue.widths*0.036),
      child: check1 == false
          ?InkWell(
            onTap: (){
              setState(() {
                check1 = ! check1;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: COLORS.RED3,
                border: Border.all(
                    color: COLORS.RED2,
                    width: 1
              ),
              borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
            children: [
              AppValue.hSpaceSmall,
              SvgPicture.asset("assets/icons/recommend_book.svg"),
              AppValue.hSpaceTiny,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetText(
                    title: "THƯ VIỆN TÂM SÁCH",
                    style: AppStyle.DEFAULT_18_BOLD
                        .copyWith(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: COLORS.PRIMARY_COLOR
                    ),
                  ),
                  WidgetText(
                    title: "(Food For The Soul)",
                    style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    WidgetText(
                      title: "01",
                      style: AppStyle.DEFAULT_24_BOLD.copyWith(fontWeight: FontWeight.w600, fontSize: 40, color: COLORS.GREY_400),
                    ),
                    AppValue.vSpaceTiny,
                    SvgPicture.asset("assets/icons/dropdown.svg"),
                    AppValue.vSpaceTiny
                  ],
                ),
              ),
              AppValue.hSpaceSmall,
            ],
        ),
      ),
          )
          :Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: COLORS.RED2),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: COLORS.GREY_400
              )
            ]
        ),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  check1 = ! check1;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                  border: Border.all(width: 1, color: COLORS.RED2),
                  color: COLORS.RED2,
                ),
                child: Row(
                  children: [
                    AppValue.hSpaceSmall,
                    SvgPicture.asset("assets/icons/recommend_book.svg"),
                    AppValue.hSpaceTiny,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WidgetText(
                          title: "THƯ VIỆN TÂM SÁCH",
                          style: AppStyle.DEFAULT_18_BOLD
                              .copyWith(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: COLORS.WHITE
                          ),
                        ),
                        WidgetText(
                          title: "(Food For The Soul)",
                          style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w400, color: COLORS.WHITE),
                        )
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          WidgetText(
                            title: "01",
                            style: AppStyle.DEFAULT_24_BOLD.copyWith(fontWeight: FontWeight.w600, fontSize: 40, color: COLORS.WHITE),
                          ),
                          AppValue.vSpaceTiny,
                          SvgPicture.asset("assets/icons/undropdown.svg",),
                          AppValue.vSpaceTiny
                        ],
                      ),
                    ),
                    AppValue.hSpaceSmall,
                  ],
                ),
              ),
            ),
            Container(
              color: COLORS.LIGHT_GREY,
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset("assets/icons/tv_tm.svg"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            WidgetText(
                              title: "Mô Tả: ",
                              style: AppStyle.DEFAULT_16.copyWith(color: COLORS.PRIMARY_COLOR, fontWeight: FontWeight.w700),
                            ),
                            WidgetText(
                              title: "Tâm Sách là bản tóm",
                              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),

                        WidgetText(
                          title: " tắt chắt lọc những nội dung",
                          style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                        ),
                        WidgetText(
                          title: "cốt tủy của một cuốn sách.",
                          style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container (
              width: AppValue.widths,
              color: COLORS.PRIMARY_COLOR,
              child: Padding(
                padding: const EdgeInsets.only(top: 9, bottom: 8),
                child: WidgetText(
                  title: "ƯU ĐIỂM SẢN PHẨM",
                  style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500, color: COLORS.WHITE),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: AppValue.widths,
              decoration: BoxDecoration(
                  color: COLORS.LIGHT_GREY,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
              ),
              child: Column(

                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8, left: AppValue.widths*0.045),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/day_du.svg"),
                        AppValue.hSpaceSmall,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                WidgetText(
                                  title: "Đầy đủ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w700),
                                ),

                                WidgetText(
                                  title: "(Toàn bộ những ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),
                                WidgetText(
                                  title: "thông điệp",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                WidgetText(
                                  title: "chính yếu ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                ),
                                WidgetText(
                                  title: "của tác giả đều được truyền",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            WidgetText(
                              title: "tải lại trong Tâm Sách)",
                              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    width: AppValue.widths,
                    color: COLORS.WHITE,
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8, left: AppValue.widths*0.045),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/ngangon.svg"),
                        AppValue.hSpaceSmall,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                WidgetText(
                                  title: "Ngắn gọn",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w700),
                                ),

                                WidgetText(
                                  title: "((Tâm Sách cô đọng 300 trang",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                WidgetText(
                                  title: "Sách chỉ còn ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, ),
                                ),
                                WidgetText(
                                  title: "30 phút đọc/nghe",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                ),
                                WidgetText(
                                  title: ")",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    width: AppValue.widths,
                    color: COLORS.WHITE,
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8, left: AppValue.widths*0.045),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/dehieu.svg"),
                        AppValue.hSpaceSmall,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                WidgetText(
                                  title: "Dễ hiểu ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w700),
                                ),

                                WidgetText(
                                  title: "(Tâm Sách của những tác giả ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                WidgetText(
                                  title: "nước ngoài đều mang văn phong ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),
                                WidgetText(
                                  title: "thuần",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                WidgetText(
                                  title: "Việt gần gũi",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                ),
                                WidgetText(
                                  title: ")",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    width: AppValue.widths,
                    color: COLORS.WHITE,
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: AppValue.heights*0.02, left: AppValue.widths*0.045),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/tietkiem.svg"),
                        AppValue.hSpaceSmall,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                WidgetText(
                                  title: "Tiết kiệm ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w700),
                                ),

                                WidgetText(
                                  title: "(Sở hữu Tâm Sách chỉ với 30k",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                WidgetText(
                                  title: "hoặc ít hơn với ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400,),
                                ),
                                WidgetText(
                                  title: "Gói Ưu Đãi",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                ),
                                WidgetText(
                                  title: ")",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400,),
                                ),
                              ],
                            ),

                          ],
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: AppValue.heights*0.035),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap:(){
                            AppNavigator.navigateLibrary_Survey();
                          },
                          child: Container(
                            width: AppValue.widths*0.6,
                            decoration: BoxDecoration(
                                color: COLORS.RED2,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 9),
                              child: WidgetText(
                                title: "KHÁM PHÁ",
                                style: AppStyle.DEFAULT_16_BOLD.copyWith(color: COLORS.WHITE),
                                textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }

  _expand2(){
    return Padding(
      padding: EdgeInsets.only(left: AppValue.widths*0.036, right: AppValue.widths*0.036),
      child: check2 == false
          ?InkWell(
            onTap: (){
              setState(() {
                check2 = ! check2;
              });
            },
            child: Container(
            decoration: BoxDecoration(
              color: COLORS.RED3,
              border: Border.all(
                  color: COLORS.RED2,
                  width: 1
              ),
              borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
            children: [
              AppValue.hSpaceSmall,
              SvgPicture.asset("assets/icons/recommend_hm.svg"),
              AppValue.hSpaceTiny,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetText(
                    title: "THAM VẤN TÂM LÝ",
                    style: AppStyle.DEFAULT_18_BOLD
                        .copyWith(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: COLORS.PRIMARY_COLOR
                    ),
                  ),
                  WidgetText(
                    title: "(Salvation For The Soul)",
                    style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    WidgetText(
                      title: "02",
                      style: AppStyle.DEFAULT_24_BOLD.copyWith(fontWeight: FontWeight.w600, fontSize: 40, color: COLORS.GREY_400),
                    ),
                    AppValue.vSpaceTiny,
                    SvgPicture.asset("assets/icons/dropdown.svg"),
                    AppValue.vSpaceTiny
                  ],
                ),
              ),
              AppValue.hSpaceSmall,
            ],
        ),
      ),
          )
          :Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: COLORS.RED2),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: COLORS.GREY_400
              )
            ]
        ),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  check2 = ! check2;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                  border: Border.all(width: 1, color: COLORS.RED2),
                  color: COLORS.RED2,
                ),
                child: Row(
                  children: [
                    AppValue.hSpaceSmall,
                    SvgPicture.asset("assets/icons/recommend_hm.svg"),
                    AppValue.hSpaceTiny,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WidgetText(
                          title: "THAM VẤN TÂM LÝ",
                          style: AppStyle.DEFAULT_18_BOLD
                              .copyWith(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: COLORS.WHITE
                          ),
                        ),
                        WidgetText(
                          title: "(Salvation For The Soul)",
                          style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w400, color: COLORS.WHITE),
                        )
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          WidgetText(
                            title: "02",
                            style: AppStyle.DEFAULT_24_BOLD.copyWith(fontWeight: FontWeight.w600, fontSize: 40, color: COLORS.WHITE),
                          ),
                          AppValue.vSpaceTiny,
                          SvgPicture.asset("assets/icons/undropdown.svg",),
                          AppValue.vSpaceTiny
                        ],
                      ),
                    ),
                    AppValue.hSpaceSmall,
                  ],
                ),
              ),
            ),
            Container(
              color: COLORS.LIGHT_GREY,
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset("assets/icons/consultation.svg"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            WidgetText(
                              title: "Mô Tả: ",
                              style: AppStyle.DEFAULT_16.copyWith(color: COLORS.PRIMARY_COLOR, fontWeight: FontWeight.w700),
                            ),
                            WidgetText(
                              title: "Chuyên viên tham",
                              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),

                        WidgetText(
                          title: "vấn sẽ hỗ trợ và giải đáp mọi",
                          style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                        ),
                        WidgetText(
                          title: "thắc mắc về các vấn đề tâm",
                          style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                        ),
                        WidgetText(
                          title: "lý bạn đang gặp phải.   ",
                          style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container (
              width: AppValue.widths,
              color: COLORS.PRIMARY_COLOR,
              child: Padding(
                padding: const EdgeInsets.only(top: 9, bottom: 8),
                child: WidgetText(
                  title: "ƯU ĐIỂM DỊCH VỤ",
                  style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500, color: COLORS.WHITE),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: AppValue.widths,
              decoration: BoxDecoration(
                  color: COLORS.LIGHT_GREY,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
              ),
              child: Column(

                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8, left: AppValue.widths*0.045),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6, right: 6),
                          child: SvgPicture.asset("assets/icons/nhiet_tinh.svg"),
                        ),
                        AppValue.hSpaceSmall,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                WidgetText(
                                  title: "Nhiệt tình ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w700),
                                ),

                                WidgetText(
                                  title: "(Mọi thắc mắc sẽ được",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                WidgetText(
                                  title: "phản hồi nhanh chóng ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                ),
                                WidgetText(
                                  title: "và giải đáp ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            WidgetText(
                              title: "thỏa đáng)",
                              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    width: AppValue.widths,
                    color: COLORS.WHITE,
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8, left: AppValue.widths*0.045),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/cam_ket.svg"),
                        AppValue.hSpaceSmall,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                WidgetText(
                                  title: "Cam kết ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w700),
                                ),

                                WidgetText(
                                  title: "(Khách hàng chỉ phải đóng",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                WidgetText(
                                  title: "phí dịch vụ khi đã ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, ),
                                ),
                                WidgetText(
                                  title: "hài lòng ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                ),
                                WidgetText(
                                  title: "với kết",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, ),
                                ),
                              ],
                            ),
                            WidgetText(
                              title: "quả tham vấn)",
                              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    width: AppValue.widths,
                    color: COLORS.WHITE,
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8, left: AppValue.widths*0.045),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/tien_loi.svg"),
                        AppValue.hSpaceSmall,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                WidgetText(
                                  title: "Tiện Lợi ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w700),
                                ),

                                WidgetText(
                                  title: "(Có thể Đặt lịch hẹn &",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                WidgetText(
                                  title: "Tiếp nhận tham vấn ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),
                                WidgetText(
                                  title: "ngay trên App",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                ),
                                WidgetText(
                                  title: ")",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    width: AppValue.widths,
                    color: COLORS.WHITE,
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: AppValue.heights*0.02, left: AppValue.widths*0.045),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/tiet_kiem.svg"),
                        AppValue.hSpaceSmall,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                WidgetText(
                                  title: "Tiết kiệm ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w700),
                                ),

                                WidgetText(
                                  title: "(Mức phí tham vấn ",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                                ),

                                WidgetText(
                                  title: "siêu ưu",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, color:COLORS.BLUE),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                WidgetText(
                                  title: "đãi",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                ),
                                WidgetText(
                                  title: "so với mặt bằng chung thị trường)",
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400,),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: AppValue.heights*0.035),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap:(){
                            AppNavigator.navigateConsultation_Survey();
                          },
                          child: Container(
                            width: AppValue.widths*0.6,
                            decoration: BoxDecoration(
                                color: COLORS.RED2,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 9),
                              child: WidgetText(
                                title: "KHÁM PHÁ",
                                style: AppStyle.DEFAULT_16_BOLD.copyWith(color: COLORS.WHITE),
                                textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}
