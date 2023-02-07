import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sumary_app/screens/topHeader_2.dart';
import 'package:sumary_app/src/spacing.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';

import '../../../bloc/user_info/user_info_bloc.dart';
import '../../../storages/share_local.dart';
import 'widget/index.dart';

class Advise_Screen_New extends StatefulWidget {
  const Advise_Screen_New({Key? key}) : super(key: key);

  @override
  State<Advise_Screen_New> createState() => _Advise_Screen_NewState();
}

class _Advise_Screen_NewState extends State<Advise_Screen_New> {

  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool check5 = false;
  bool check6 = false;

  List<Map<String,dynamic>> title1 = [
    {"image":"assets/icons/img_1.svg", "name":'Tâm Lý Gia Đình', 'number':"01", "color":COLORS.PRIMARY_COLOR},
    {"image":"assets/icons/img_2.svg", "name":"Tâm Lý Học Đường", 'number':"02", "color":COLORS.BLUE2},
    {"image":"assets/icons/img_3.svg", "name":'Tâm Lý Người Đi Làm', 'number':"03", "color":COLORS.RED2},
    {"image":"assets/icons/img_4.svg", "name":'Các Vấn Đề Tâm Lý Khác', 'number':"04", "color":COLORS.VIOLET1},
  ];

  List<Map<String,dynamic>> title2 = [
    {"image":"assets/icons/img_5.svg", "name":'Rối Loạn Lo Âu & Sợ Hãi', 'number': '05', "color":COLORS.GREEN1},
    {"image":"assets/icons/img_6.svg", "name":"Rối Loạn Ám Ảnh & Cưỡng Chế", 'number' : '06', "color":COLORS.VIOLET1},
    {"image":"assets/icons/img_7.svg", "name":'Rối Loạn Lưỡng Cực & Trầm Cảm', 'number' : '07', "color":COLORS.RED2},
    {"image":"assets/icons/img_8.svg", "name":'Nghiện', 'number' : '08', "color":COLORS.PINK},
  ];

  List<Map<String,dynamic>> title3 = [
    {
      "image":"assets/icons/orange.png",
      "name":'Tư vấn theo phiên', 'number':"01",
      "color":"assets/icons/lg1.png",
      "price": "200.000 - 250.000",
      "value": "VND / phiên",
      "lg": "assets/icons/lg1.svg"
    },
    {
      "image":"assets/icons/green.png",
      "name":"Tư Vấn Theo Tháng",
      'number':"02",
      "color":"assets/icons/lg1.png",
      "price" : "1.000.000 - 2.000.000",
      "value": "VND / tháng",
      "lg": "assets/icons/lg2.svg"
    },
    {
      "image":"assets/icons/blue.png",
      "name":'Liệu Trình Trọn Gói',
      'number':"03",
      "color":"assets/icons/lg1.png",
      "price" : "5.000.000 - 15.000.000",
      "value": "Tùy mức độ triệu trứng",
      "lg": "assets/icons/lg3.svg"
    },
  ];

  List<Map<String,dynamic>> title4 = [
    {"number":"1", "title":"Dịch vụ tham vấn cần thiết trong trường hợp nào?"},
    {"number":"2", "title":"Tôi nhận được gì sau khi sử dụng dịch vụ tham vấn?"},
    {"number":"3", "title":"Nội dung của phiên tham vấn đầu tiên là gì?"},
    {"number":"4", "title":"Tôi có cần trả trước phí tham vấn không?"},
    {"number":"5", "title":"Tôi có được hoàn tiền nếu yêu cầu ngừng tham vấn?"},
    {"number":"6", "title":"Làm sao để đăng ký tham vấn/tư vấn?"},
    {"number":"7", "title":"Có được thay đổi ngày hẹn sau khi đã đặt lịch không?"},
    {"number":"8", "title":"Tôi nên chọn Gói tư vấn nào?"},
    {"number":"9", "title":"Làm sao để biết vấn đề của tôi thuộc nhóm tâm lý nào?"},
    {"number":"10", "title":"Một tháng gồm mấy phiên và mỗi phiên kéo dài bao lâu?"},
    {"number":"11", "title":"Thông tin tham vấn của tôi có được bảo mật không?"},
  ];


  @override
  void initState() {
    if(((shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null))) {
        UserInfoBloc.of(context).add(InitUserInfoEvent());
      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: InkWell(
        onTap: (){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return  ((shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null)) ? BlocBuilder<UserInfoBloc, UserInfoState>(
                builder: (context, state) {
                  if(state is UpdateUserInfoState){
                    return DialogAdvise(
                      name: state.data.name,
                      email: state.data.email,
                      phone: state.data.phone,
                    );
                  }else{
                    return Container();
                  }
                },
              ) : DialogAdvise();
            },
          );
        },
        child: Container(
            width: 60, height: 60,
            decoration: BoxDecoration(
              color: COLORS.PRIMARY_COLOR,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  blurRadius: 6,
                  spreadRadius: 0,
                  offset: Offset(0, 1), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.circular(60)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/icon_date_advise.svg",height: 30,width: 38, fit: BoxFit.cover,),
                WidgetText(
                  title: 'Đặt Lịch',
                  style: AppStyle.DEFAULT_12.copyWith(
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    color: COLORS.WHITE
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            )
        ),
      ),
      backgroundColor: COLORS.BACKGROUND,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 16+Spacing.viewPadding.top),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child:  Column(
              children: [
                const topHeader2(),
                AppValue.vSpace(12),
                const widget_seach(),
                AppValue.vSpace(10)
              ],
            ),
          ),
          AppValue.vSpace(10),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset("assets/images/Group 18047.png"),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: AppValue.widths*0.05, top: AppValue.heights*0.042),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: COLORS.PRIMARY_COLOR,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                                      child: InkWell(
                                        onTap:(){
                                        },
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            AppValue.hSpaceTiny,
                                            SvgPicture.asset("assets/icons/contact_ic.svg"),
                                            AppValue.hSpaceTiny,
                                            WidgetText(
                                              title: "LIÊN HỆ",
                                              style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, color: COLORS.WHITE),
                                            ),
                                            AppValue.hSpaceSmall,
                                            AppValue.hSpaceTiny,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  AppValue.vSpaceSmall,
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/icons/phone_ic.svg"),
                                      const SizedBox(width: 8,),
                                      SvgPicture.asset("assets/icons/zalo_ic.svg"),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: AppValue.widths*0.05, top: AppValue.heights*0.043),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WidgetText(
                                    title: "We are here for your care.",
                                    style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w600, color: COLORS.WHITE),
                                  ),
                                  WidgetText(
                                    title: "Best Care &",
                                    style: AppStyle.DEFAULT_14.copyWith(fontSize: 22, fontWeight: FontWeight.w600, color: COLORS.WHITE),
                                  ),
                                  WidgetText(
                                    title: "Better Doctor.",
                                    style: AppStyle.DEFAULT_14.copyWith(fontSize: 22, fontWeight: FontWeight.w600, color: COLORS.WHITE),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    AppValue.vSpace(10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset("assets/icons/tv_tamly.png", height: AppValue.heights*0.15, color: COLORS.GREY_EB,)),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppValue.vSpaceTiny,
                                  WidgetText(
                                    title: "Dịch vụ",
                                    style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w600, color: COLORS.GREY),
                                  ),
                                  AppValue.vSpaceSmall,
                                  WidgetText(
                                    title: "Tham vấn tâm lý",
                                    style: AppStyle.DEFAULT_24.copyWith(fontSize: 32, fontWeight: FontWeight.w600, color: COLORS.PRIMARY_COLOR),
                                  ),
                                  AppValue.vSpaceTiny,
                                  AppValue.vSpaceSmall,
                                  SvgPicture.asset("assets/icons/slider_gray.svg")
                                ],
                              ),
                            )
                          ],
                        ),

                        AppValue.vSpace(10),

                        //Các nhóm tâm lý nhận hỗ trợ
                        expand1(),

                        AppValue.vSpace(10),

                        //các gói tư vấn
                        expand2(),

                        AppValue.vSpace(18),

                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppValue.vSpaceSmall,
                              WidgetText(
                                title: "Hỗ trợ",
                                style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w600, color: COLORS.GREY),
                              ),
                              AppValue.vSpaceTiny,
                              WidgetText(
                                title: "Cách Thức liên Hệ",
                                style: AppStyle.DEFAULT_24.copyWith(fontSize: 32, fontWeight: FontWeight.w600, color: COLORS.PRIMARY_COLOR),
                              ),
                              AppValue.vSpaceSmall,
                              SvgPicture.asset("assets/icons/slider_gray.svg"),
                              AppValue.vSpaceSmall,
                              SizedBox(
                                width: AppValue.widths*0.95,
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: AppStyle.DEFAULT_14,
                                    children:  <TextSpan>[
                                      TextSpan(
                                          text: "TN Master ",
                                          style: AppStyle.DEFAULT_14.copyWith(color:COLORS.RED2)
                                      ),
                                      const TextSpan(
                                        text: "nhận tham vấn cho người lớn và trẻ em ở mọi lứa tuổi. Nếu bạn quan tâm tới dịch vụ, vui lòng ",
                                      ),
                                      TextSpan(
                                          text: "Đặt lịch tư vấn ",
                                          style: AppStyle.DEFAULT_14.copyWith(color:COLORS.BLUE)
                                      ),
                                      const TextSpan(
                                        text: "ngay để nhận được sự hỗ trợ tốt nhất từ chúng tôi.",
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        AppValue.vSpace(10),

                        //Liên hệ với chúng tôi
                        expand3(),

                        AppValue.vSpaceMedium,
                        AppValue.vSpaceTiny,

                        Container(
                          height: AppValue.heights*0.255,
                          width: AppValue.widths*0.91,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: AppValue.heights*0.015, right: AppValue.widths*0.01),
                                child: Container(
                                  width: AppValue.widths*0.87,
                                  height: AppValue.heights*0.24,
                                  decoration: BoxDecoration(
                                      color: COLORS.WHITE,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 6,
                                          spreadRadius: 0,
                                          offset: Offset(0, 2),
                                          color: Color.fromRGBO(0, 0, 0, 0.35),
                                        )
                                      ]
                                  ),
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Spacer(),
                                              Image.asset("assets/icons/diaLog_t.png",
                                                height: AppValue.heights*0.06,
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Image.asset("assets/icons/Vector 12.png",),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: AppValue.widths*0.025, top: AppValue.heights*0.021),
                                            child: WidgetText(
                                              title: "6. Làm sao để đăng ký tham vấn/tư vấn?",
                                              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.BLUE4, decoration: TextDecoration.underline),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: AppValue.widths*0.025, right: AppValue.widths*0.025, top: AppValue.heights*0.014),
                                            child: Container(
                                              width: AppValue.widths*0.82,
                                              height: AppValue.heights*0.16,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(width: 1.5, color: COLORS.GREY_400)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 6, left: 6, right: 2),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      width: AppValue.widths*0.8,
                                                      child: WidgetText(
                                                        title: "Bạn có thể chọn biểu tượng bên dưới góc phải màn hình.",
                                                        style: AppStyle.DEFAULT_14,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppValue.widths*0.825, bottom: AppValue.heights*0.01),
                                child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 6,
                                          spreadRadius: 0,
                                          offset: Offset(0, 2),
                                          color: Color.fromRGBO(0, 0, 0, 0.35),

                                        )
                                      ]
                                    ),
                                    child: SvgPicture.asset("assets/icons/close_button.svg")),
                              ),
                            ],
                          ),
                        ),

                        AppValue.vSpaceMedium,
                        AppValue.vSpaceTiny,

                      ],
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  dialogIntro() {
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
                Align(
                  alignment: Alignment.center,
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
                      child: Text("TIẾP TỤC",
                        style: AppStyle.DEFAULT_16
                            .copyWith(fontWeight: FontWeight.w500, color: COLORS.WHITE),
                        textAlign: TextAlign.center,
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
  }

  expand1(){
    return Padding(
      padding: EdgeInsets.only(left: AppValue.widths*0.036, right: AppValue.widths*0.036, top: 8),
      child: check1 == false
          ?InkWell(
        onTap: (){
          setState(() {
            check1 = ! check1;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: COLORS.RED4,
              border: Border.all(
                  color: COLORS.RED4,
                  width: 1
              ),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppValue.hSpaceTiny,
              SvgPicture.asset("assets/icons/group_sp_tamly.svg"),
              AppValue.hSpaceTiny,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 30),
                    child: SizedBox(
                      width: AppValue.widths*0.7,
                      child: WidgetText(
                        title: "CÁC NHÓM TÂM LÝ NHẬN HỖ TRỢ",
                        maxLine: 2,
                        style: AppStyle.DEFAULT_18_BOLD
                            .copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: COLORS.WHITE
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppValue.hSpaceVrTiny,
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/dropdown.svg", color: COLORS.WHITE,),
                  ],
                ),
              ),
              AppValue.hSpaceTiny,
            ],
          ),
        ),
      )
          :Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: COLORS.RED4),
            boxShadow: const [
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
                    color: COLORS.RED4,
                    border: Border.all(
                        color: COLORS.RED4,
                        width: 1
                    ),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppValue.hSpaceTiny,
                    SvgPicture.asset("assets/icons/group_sp_tamly.svg"),
                    AppValue.hSpaceTiny,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 32, bottom: 30),
                          child: SizedBox(
                            width: AppValue.widths*0.7,
                            child: WidgetText(
                              title: "CÁC NHÓM TÂM LÝ NHẬN HỖ TRỢ",
                              maxLine: 2,
                              style: AppStyle.DEFAULT_18_BOLD
                                  .copyWith(
                                fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: COLORS.WHITE
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppValue.hSpaceVrTiny,
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/dropdown.svg", color: COLORS.WHITE,),
                        ],
                      ),
                    ),
                    AppValue.hSpaceTiny,
                  ],
                ),
              ),
            ),
            Container(
              width: AppValue.widths,
              decoration: const BoxDecoration(
                  color: COLORS.LIGHT_GREY,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 6),
                child: Column(
                  children: List.generate(title1.length, (index) => Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Container(
                              width: AppValue.widths*0.83,
                              decoration: BoxDecoration(
                                  color: COLORS.WHITE,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        color: COLORS.GREY_400,
                                        offset: Offset(0,2)
                                    )
                                  ]
                              ),
                              child: Padding(
                                padding:  EdgeInsets.only(left: AppValue.widths*0.115, top: 8, bottom: 8),
                                child: WidgetText(
                                  title: "${title1[index]["name"]}",
                                  style: AppStyle.DEFAULT_16.copyWith(color: title1[index]["color"]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: AppValue.widths*0.025, top: 1),
                        child: Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: COLORS.WHITE,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      color: COLORS.GREY_400,
                                      offset: Offset(1,2)
                                  )
                                ]
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: WidgetText(
                                title: "${title1[index]["number"]}",
                                style: AppStyle.DEFAULT_24.copyWith(color: title1[index]["color"], fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            )
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 8.6, left: AppValue.widths*0.78),
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                              color: COLORS.WHITE,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.5,
                                    offset: Offset(0,1),
                                    color: COLORS.GREY_A6
                                ),
                              ],
                              shape: BoxShape.circle
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset("${title1[index]["image"]}")),
                        ),
                      )
                    ],
                  )),
                ),
              ),
            ),
            Container(
                height: 2,
                width: AppValue.widths,
                color: COLORS.WHITE
            ),
            Container(
              width: AppValue.widths,
              decoration: const BoxDecoration(
                  color: COLORS.LIGHT_GREY,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 6),
                child: Column(
                  children: List.generate(title1.length, (index) => Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Container(
                              width: AppValue.widths*0.83,
                              decoration: BoxDecoration(
                                  color: COLORS.WHITE,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        color: COLORS.GREY_400,
                                        offset: Offset(0,2)
                                    )
                                  ]
                              ),
                              child: Padding(
                                padding:  EdgeInsets.only(left: AppValue.widths*0.115, top: 8, bottom: 8),
                                child: WidgetText(
                                  title: "${title2[index]["name"]}",
                                  style: AppStyle.DEFAULT_16.copyWith(color: title2[index]["color"]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: AppValue.widths*0.025, top: 1),
                        child: Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: COLORS.WHITE,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      color: COLORS.GREY_400,
                                      offset: Offset(1,2)
                                  )
                                ]
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: WidgetText(
                                title: "${title2[index]["number"]}",
                                style: AppStyle.DEFAULT_24.copyWith(color: title2[index]["color"], fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            )
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 8.6, left: AppValue.widths*0.78),
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                              color: COLORS.WHITE,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.5,
                                    offset: Offset(0,1),
                                    color: COLORS.GREY_A6
                                ),
                              ],
                              shape: BoxShape.circle
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset("${title2[index]["image"]}")),
                        ),
                      ),

                    ],
                  )),
                ),
              ),
            ),
            Container(
              color: COLORS.WHITE,
              width: AppValue.widths,
              height: 1,
            ),
            Container(
              width: AppValue.widths,
              decoration: const BoxDecoration(
                  color: COLORS.LIGHT_GREY,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetText(
                      title: "Để xem chi tiết triệu chứng các nhóm tâm lý trên, vui lòng ",
                      style: AppStyle.DEFAULT_12.copyWith(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetText(
                          title: "truy cập Website chính thức ",
                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                        WidgetText(
                          title: "Tiemnangmaster.com .",
                          style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, color: COLORS.BLUE, decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  expand2(){
    return Padding(
      padding: EdgeInsets.only(left: AppValue.widths*0.036, right: AppValue.widths*0.036, top: 8),
      child: check2 == false
          ?InkWell(
        onTap: (){
          setState(() {
            check2 = ! check2;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: COLORS.RED4,
              border: Border.all(
                  color: COLORS.RED4,
                  width: 1
              ),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            children: [
              const Spacer(),
              AppValue.hSpaceTiny,
              SvgPicture.asset("assets/icons/unbox.svg"),
              AppValue.hSpaceTiny,
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 30),
                child: SizedBox(
                  child: WidgetText(
                    title: "CÁC GÓI TƯ VẤN",
                    style: AppStyle.DEFAULT_18_BOLD
                        .copyWith(
                      fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: COLORS.WHITE
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              AppValue.hSpaceTiny,
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/dropdown.svg", color: COLORS.WHITE,),
                  ],
                ),
              ),
              AppValue.hSpaceSmall,
              const Spacer(),
            ],
          ),
        ),
      )
          :Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: COLORS.RED4),
            boxShadow: const [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: COLORS.LIGHT
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
                    color: COLORS.RED4,
                    border: Border.all(
                        color: COLORS.RED4,
                        width: 1
                    ),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    AppValue.hSpaceTiny,
                    SvgPicture.asset("assets/icons/unbox.svg"),
                    AppValue.hSpaceTiny,
                    Padding(
                      padding: const EdgeInsets.only(top: 32, bottom: 30),
                      child: SizedBox(
                        child: WidgetText(
                          title: "CÁC GÓI TƯ VẤN",
                          style: AppStyle.DEFAULT_18_BOLD
                              .copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: COLORS.WHITE
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    AppValue.hSpaceTiny,
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/dropdown.svg", color: COLORS.WHITE,),
                        ],
                      ),
                    ),
                    AppValue.hSpaceSmall,
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Container(
              width: AppValue.widths,
              decoration: const BoxDecoration(
                  color: COLORS.LIGHT,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
              ),
              child: Column(
                children: List.generate(title3.length, (index) => Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Image.asset("${title3[index]["image"]}"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppValue.heights*0.021 ,
                          left: 12
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: AppValue.widths*0.76,
                            height: AppValue.heights*0.15,
                            decoration: BoxDecoration(
                                color: COLORS.WHITE,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 1,
                                      offset: Offset(0,1),
                                      color: COLORS.GREY_400
                                  )
                                ]
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: AppValue.heights*0.02, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WidgetText(
                                    title: "${title3[index]["name"]}",
                                    style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500),),
                                  AppValue.vSpaceVrTiny,
                                  Container(
                                      height: 1,
                                      width: 40,
                                      color: COLORS.RED2
                                  ),
                                  AppValue.vSpaceVrTiny,
                                  WidgetText(
                                    title: "${title3[index]["price"]}",
                                    style: AppStyle.DEFAULT_20_BOLD.copyWith(fontSize: 22, color: COLORS.RED2),
                                  ),
                                  WidgetText(
                                      title: "${title3[index]["value"]}",
                                      style: AppStyle.DEFAULT_16
                                  )
                                ],
                              ),
                            ),
                          ),

                          Padding(
                              padding: EdgeInsets.only(
                                  top: AppValue.heights*0.049,
                                  left: AppValue.widths*0.69
                              ),
                              child: Stack(
                                children: [
                                  SvgPicture.asset("${title3[index]["lg"]}"),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7, left: 12),
                                    child: WidgetText(
                                      title: "${title3[index]["number"]}",
                                      style: AppStyle.DEFAULT_20.copyWith(fontWeight: FontWeight.w600, color: COLORS.WHITE),
                                    ),
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ),
            AppValue.vSpaceSmall,
            check3 == false
                ?InkWell(
              onTap:(){
                setState(() {
                  check3 = !check3;
                });
              },
              child: Container(
                width: AppValue.widths,
                decoration: const BoxDecoration(
                  color: COLORS.BLUE3,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 20,
                      ),
                      WidgetText(
                        title: "QUYỀN LỢI KHÁCH HÀNG",
                        style: AppStyle.DEFAULT_16_BOLD.copyWith(color:COLORS.WHITE),
                        textAlign: TextAlign.center,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/dropdown.svg", color: COLORS.WHITE,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
                :Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8)),
                color:COLORS.LIGHT,
              ),
                  child: Column(
                    children: [
                      InkWell(
              onTap: (){
                      setState(() {
                        check3 = !check3;
                      });
              },
                        child: Container(
              width: AppValue.widths,
              decoration: const BoxDecoration(
                          color: COLORS.BLUE3,
              ),
              child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 20,
                            ),
                            WidgetText(
                              title: "QUYỀN LỢI KHÁCH HÀNG",
                              style: AppStyle.DEFAULT_16_BOLD.copyWith(color:COLORS.WHITE),
                              textAlign: TextAlign.center,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/bb.svg", color: COLORS.WHITE,),
                                ],
                              ),
                            ),
                          ],
                        ),
              ),
            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppValue.hSpaceVrTiny,
                          SvgPicture.asset("assets/icons/benefit_1.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 2, top: 12),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppValue.widths*0.75,
                                  child: RichText(
                                    text: TextSpan(
                                      children:  <TextSpan>[
                                        const TextSpan(
                                          text: "Khi đến với chúng tôi, khách hàng sẽ được ",
                                          style: AppStyle.DEFAULT_16
                                        ),
                                        TextSpan(
                                            text: "lắng nghe & thấu hiểu, ",
                                            style: AppStyle.DEFAULT_16.copyWith(color: COLORS.BLUE4)
                                        ),
                                        const TextSpan(
                                            text: "được hỗ trợ giải pháp cho những vấn đề tâm lý đang gặp.",
                                            style: AppStyle.DEFAULT_16
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Container(
                          height: 2,
                          width: AppValue.widths,
                          color: COLORS.WHITE,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppValue.hSpaceVrTiny,
                          SvgPicture.asset("assets/icons/benefit_2.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 2),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppValue.widths*0.75,
                                  child: RichText(
                                    text: TextSpan(
                                      children:  <TextSpan>[
                                        const TextSpan(
                                            text: "Khách hàng sau khi nhận được kết quả mong đợi (Căn cứ theo ",
                                            style: AppStyle.DEFAULT_16
                                        ),
                                        TextSpan(
                                            text: "hợp đồng tham vấn) ",
                                            style: AppStyle.DEFAULT_16.copyWith(color: COLORS.BLUE4)
                                        ),
                                        const TextSpan(
                                            text: "mới phải chi trả phí dịch vụ.",
                                            style: AppStyle.DEFAULT_16
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Container(
                          height: 2,
                          width: AppValue.widths,
                          color: COLORS.WHITE,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppValue.hSpaceVrTiny,
                          SvgPicture.asset("assets/icons/benefit_3.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 2),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppValue.widths*0.75,
                                  child: RichText(
                                    text: TextSpan(
                                      children:  <TextSpan>[
                                        const TextSpan(
                                            text: "Có thể lựa chọn thanh toán theo từng giai đoạn liệu trình (Có xuất ",
                                            style: AppStyle.DEFAULT_16
                                        ),
                                        TextSpan(
                                            text: "hóa đơn thanh toán",
                                            style: AppStyle.DEFAULT_16.copyWith(color: COLORS.BLUE4)
                                        ),
                                        const TextSpan(
                                            text: ").",
                                            style: AppStyle.DEFAULT_16
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Container(
                          height: 2,
                          width: AppValue.widths,
                          color: COLORS.WHITE,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppValue.hSpaceVrTiny,
                          SvgPicture.asset("assets/icons/benefit_4.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 2),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppValue.widths*0.75,
                                  child: RichText(
                                    text: TextSpan(
                                      children:  <TextSpan>[
                                        const TextSpan(
                                            text: "Khách hàng được ",
                                            style: AppStyle.DEFAULT_16
                                        ),
                                        TextSpan(
                                            text: "trải nghiệm miễn phí ",
                                            style: AppStyle.DEFAULT_16.copyWith(color: COLORS.BLUE4)
                                        ),
                                        const TextSpan(
                                            text: "phiên tham vấn đầu tiên.",
                                            style: AppStyle.DEFAULT_16
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Container(
                          height: 2,
                          width: AppValue.widths,
                          color: COLORS.WHITE,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppValue.hSpaceVrTiny,
                            SvgPicture.asset("assets/icons/benefit_5.svg"),
                            Padding(
                              padding: const EdgeInsets.only(left: 4, right: 2),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: AppValue.widths*0.75,
                                    child: RichText(
                                      text: const TextSpan(
                                        children:  <TextSpan>[
                                          TextSpan(
                                              text: "Có thể tùy chọn hình thức tham vấn:",
                                              style: AppStyle.DEFAULT_16
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppValue.widths*0.75,
                                    child: RichText(
                                      text: TextSpan(
                                        children:  <TextSpan>[
                                          TextSpan(
                                              text: "  • Online ",
                                              style: AppStyle.DEFAULT_16.copyWith(color:COLORS.BLUE4)
                                          ),
                                          const TextSpan(
                                              text: "(Toàn quốc)",
                                              style: AppStyle.DEFAULT_16
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppValue.widths*0.75,
                                    child: RichText(
                                      text: TextSpan(
                                        children:  <TextSpan>[
                                          TextSpan(
                                              text: "  • Trực tiếp ",
                                              style: AppStyle.DEFAULT_16.copyWith(color:COLORS.BLUE4)
                                          ),
                                          const TextSpan(
                                              text: "(Tp. Hồ Chí Minh và các tỉnh thành lân cận)",
                                              style: AppStyle.DEFAULT_16
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }

  expand3(){
    return  Padding(
      padding: EdgeInsets.only(left: AppValue.widths*0.036, right: AppValue.widths*0.036, top: 8),
      child: check4 == false
          ?InkWell(
            onTap: (){
              setState(() {
                check4 = ! check4;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: COLORS.RED4,
                  border: Border.all(
                      color: COLORS.RED4  ,
                      width: 1
                  ),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  const Spacer(),
                  AppValue.hSpaceTiny,
                  SvgPicture.asset("assets/icons/contact_w_u.svg"),
                  AppValue.hSpaceTiny,
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 30),
                    child: SizedBox(
                      child: WidgetText(
                        title: "LIÊN HỆ VỚI CHÚNG TÔI",
                        style: AppStyle.DEFAULT_18_BOLD
                            .copyWith(
                            fontWeight: FontWeight.w700,
                            color: COLORS.WHITE
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  AppValue.hSpaceTiny,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/dropdown.svg", color: COLORS.WHITE,),
                      ],
                    ),
                  ),
                  const Spacer(),

                ],
              ),
            ),
          )
          :Container(
            decoration: BoxDecoration(
              border: Border.all(color: COLORS.RED4, width: 1),
              borderRadius: BorderRadius.circular(8),
              color: COLORS.LIGHT
        ),
            child: InkWell(
              onTap: (){
                  setState(() {
                    check4 = ! check4;
                  });
              },
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: COLORS.RED4,
                          border: Border.all(
                              color: COLORS.RED4,
                              width: 1
                          ),
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          AppValue.hSpaceTiny,
                          SvgPicture.asset("assets/icons/contact_w_u.svg"),
                          AppValue.hSpaceTiny,
                          Padding(
                            padding: const EdgeInsets.only(top: 32, bottom: 30),
                            child: SizedBox(
                              child: WidgetText(
                                title: "LIÊN HỆ VỚI CHÚNG TÔI",
                                style: AppStyle.DEFAULT_18_BOLD
                                    .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: COLORS.WHITE
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          AppValue.hSpaceTiny,
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/dropdown.svg", color: COLORS.WHITE,),
                              ],
                            ),
                          ),
                          const Spacer(),

                        ],
                      ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      children: [
                        AppValue.vSpaceTiny,
                        Stack(
                          children: [
                            SvgPicture.asset("assets/icons/contt.svg"),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 12),
                              child: SvgPicture.asset("assets/icons/contact_ic1.svg"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 70),
                              child: WidgetText(
                                title: "0903 245 691",
                                style: AppStyle.DEFAULT_14.copyWith(color: COLORS.RED2),
                              ),
                            )
                          ],
                        ),
                        AppValue.vSpaceTiny,
                        Stack(
                          children: [
                            SvgPicture.asset("assets/icons/contt.svg"),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 12),
                              child: SvgPicture.asset("assets/icons/contact_ic2.svg"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 67),
                              child: WidgetText(
                                title: "Tiemnangmaster@gmail.com",
                                style: AppStyle.DEFAULT_14.copyWith(color: COLORS.BLUE, decoration: TextDecoration.underline ),
                              ),
                            )
                          ],
                        ),
                        AppValue.vSpaceTiny,
                        Stack(
                          children: [
                            SvgPicture.asset("assets/icons/contt.svg"),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 12),
                              child: SvgPicture.asset("assets/icons/contact_ic3.svg"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 62),
                              child: WidgetText(
                                title: "03/63 Võ Văn Kiệt, tp Buôn Ma Thuột, tỉnh ĐăkLăk",
                                style: AppStyle.DEFAULT_12.copyWith(color: const Color.fromRGBO(170, 118, 105, 1)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppValue.vSpaceTiny,
                  AppValue.vSpaceVrTiny,
                  check6 == false
                      ?InkWell(
                    onTap:(){
                      setState(() {
                        check6 = !check6;
                      });
                    },
                    child: Container(
                      width: AppValue.widths,
                      decoration: const BoxDecoration(
                          color: COLORS.BLUE3,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 20,
                            ),
                            WidgetText(
                              title: "CÂU HỎI THƯỜNG GẶP",
                              style: AppStyle.DEFAULT_16_BOLD.copyWith(color:COLORS.WHITE),
                              textAlign: TextAlign.center,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/dropdown.svg", color: COLORS.WHITE,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      :Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8)),
                      color:COLORS.LIGHT,
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              check6 = !check6;
                            });
                          },
                          child: Container(
                            width: AppValue.widths,
                            decoration: const BoxDecoration(
                              color: COLORS.BLUE3,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 11),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 20,
                                  ),
                                  WidgetText(
                                    title: "CÂU HỎI THƯỜNG GẶP",
                                    style: AppStyle.DEFAULT_16_BOLD.copyWith(color:COLORS.WHITE),
                                    textAlign: TextAlign.center,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset("assets/icons/bb.svg", color: COLORS.WHITE,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AppValue.vSpaceSmall,
                        Column(
                          children: List.generate(title4.length, (index) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: AppValue.widths*0.84,
                                          child: WidgetText(
                                            title: "${title4[index]["number"]}. ${title4[index]["title"]}",
                                            style: AppStyle.DEFAULT_14.copyWith(color: COLORS.BLUE4, decoration: TextDecoration.underline),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                        ),
                        AppValue.vSpaceSmall,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
