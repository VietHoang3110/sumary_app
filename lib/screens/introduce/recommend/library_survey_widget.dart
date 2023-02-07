import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';


class Library_Survey_Widget extends StatefulWidget {
  const Library_Survey_Widget({Key? key}) : super(key: key);

  @override
  State<Library_Survey_Widget> createState() => _Library_Survey_WidgetState();
}

class _Library_Survey_WidgetState extends State<Library_Survey_Widget> {

  bool checkAll = false;

  List<Map<String,dynamic>> title = [
    {"image":"assets/icons/pt_yourseft.svg", "name":'Phát triển bản thân', 'bool':false},
    {"image":"assets/icons/love.svg", "name":"Tình yêu", 'bool':false},
    {"image":"assets/icons/scrhappy.svg", "name":'Bí quyết hạnh phúc', 'bool':false},
    {"image":"assets/icons/tam_linh.svg", "name":'Tâm linh & Tôn giáo', 'bool':false},
    {"image":"assets/icons/kinhdoanh.svg", "name":'Kinh doanh', 'bool':false},
    {"image":"assets/icons/chude_khac.svg", "name":'Chủ đề khác', 'bool':false},
    {"image":"assets/icons/pt_yourseft.svg", "name":'Phát triển bản thân', 'bool':false},
    {"image":"assets/icons/love.svg", "name":"Tình yêu", 'bool':false},
    {"image":"assets/icons/scrhappy.svg", "name":'Bí quyết hạnh phúc', 'bool':false},
    {"image":"assets/icons/tam_linh.svg", "name":'Tâm linh & Tôn giáo', 'bool':false},
    {"image":"assets/icons/kinhdoanh.svg", "name":'Kinh doanh', 'bool':false},
    {"image":"assets/icons/chude_khac.svg", "name":'Chủ đề khác', 'bool':false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            color: COLORS.WHITE,
            child: Column(
              children: [
                _appBar(),
                Container(
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
                          title: "Khảo Sát",
                          style: AppStyle.DEFAULT_16.copyWith(color: COLORS.GREY_400, fontWeight: FontWeight.w500),
                        ),
                      ),
                      WidgetText(
                        title: "THƯ VIỆN TÂM SÁCH",
                        style: AppStyle.DEFAULT_24
                            .copyWith(fontSize: 25, color: COLORS.PRIMARY_COLOR, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Image.asset("assets/icons/Group 16952.png", width: 115,),
                      ),
                      Text("Chủ đề yêu thích của bạn là gì?",
                        style: AppStyle.DEFAULT_16
                            .copyWith(fontWeight: FontWeight.w500),
                      ),

                      SizedBox(height: AppValue.heights*0.016,),

                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: AppValue.heights*0.56,
                          width: AppValue.widths*0.92,
                          decoration: BoxDecoration(
                              color: COLORS.WHITE,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(width: 1, color: COLORS.PRIMARY_COLOR)
                          ),
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left: AppValue.widths*0.08, right: AppValue.widths*0.08, bottom: 5),
                                      child: GridView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            mainAxisExtent: AppValue.heights*0.077,
                                          ),
                                          itemCount: title.length,
                                          itemBuilder: (context, index){
                                            return InkWell(
                                              onTap: (){
                                                setState(() {
                                                  title[index]["bool"] = !title[index]["bool"];
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color:checkAll == true
                                                          ? (title[index]["bool"] == false ? COLORS.PRIMARY_COLOR : COLORS.WHITE)
                                                          : (title[index]["bool"] == true ? COLORS.PRIMARY_COLOR : COLORS.WHITE),
                                                      borderRadius: BorderRadius.circular(20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          spreadRadius: 0,
                                                          blurRadius: 2,
                                                          color:  COLORS.GREY_400,
                                                          offset:  Offset(1,5),
                                                        )
                                                      ]
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 5, right: 10),
                                                        child: Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: COLORS.WHITE,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              SvgPicture.asset("${title[index]["image"]}"),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      WidgetText(
                                                        title: "${title[index]["name"]}",
                                                        style: AppStyle.DEFAULT_14.copyWith(
                                                            color:  checkAll == true
                                                                ? (title[index]["bool"] == false ? COLORS.WHITE : COLORS.BLACK)
                                                                : (title[index]["bool"] == true ? COLORS.WHITE : COLORS.BLACK)
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      checkAll == true
                                                          ? (title[index]["bool"] == false
                                                          ? SvgPicture.asset("assets/icons/choosenItem.svg")
                                                          : SvgPicture.asset("assets/icons/unchoosen.svg")
                                                      )
                                                          : (title[index]["bool"] == true
                                                          ? SvgPicture.asset("assets/icons/choosenItem.svg")
                                                          : SvgPicture.asset("assets/icons/unchoosen.svg")
                                                      ),
                                                      SizedBox(width: 10,)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                    SizedBox(height: AppValue.heights*0.036,)
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: AppValue.widths,

                                  decoration: BoxDecoration(
                                      color: COLORS.PRIMARY_COLOR,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 9, bottom: 8),
                                    child: Image.asset("assets/icons/bt_scroll.png", width: 18, height: 18,),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: AppValue.heights*0.012,),

                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: WidgetText(
                              title: "(Xin chọn lĩnh vực bạn quan tâm)",
                              style: AppStyle.DEFAULT_12.copyWith(fontSize: 13),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset("assets/icons/pack_bottom.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: InkWell(
                              onTap: (){
                                AppNavigator.navigateMain();
                              },
                              child: Align(
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
                                    child: Text("XÁC NHẬN",
                                      style: AppStyle.DEFAULT_16
                                          .copyWith(fontWeight: FontWeight.w500, color: COLORS.WHITE),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
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
