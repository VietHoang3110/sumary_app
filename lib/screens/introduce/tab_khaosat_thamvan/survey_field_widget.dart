import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';


class Tab_Survey_Fields_Widget extends StatefulWidget {
  const Tab_Survey_Fields_Widget({Key? key}) : super(key: key);

  @override
  State<Tab_Survey_Fields_Widget> createState() => _Tab_Survey_Fields_WidgetState();
}

class _Tab_Survey_Fields_WidgetState extends State<Tab_Survey_Fields_Widget> {

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
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/header.png', width: AppValue.widths,  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppValue.heights*0.153),
                    child: Container(
                      width: AppValue.widths,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: AppValue.heights*0.027),
                            child: Text("THƯ VIỆN TÂM SÁCH",
                              style: AppStyle.DEFAULT_24
                                  .copyWith(fontSize: 25, color: COLORS.PRIMARY_COLOR, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              color: COLORS.BLACK,
                              width: 50,
                              height: 1,
                            ),
                          ),
                          Text("Bạn quan tâm đến lĩnh vực nào?",
                            style: AppStyle.DEFAULT_16
                                .copyWith(fontWeight: FontWeight.w500),
                          ),

                          SizedBox(height: AppValue.heights*0.016,),

                          Stack(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: AppValue.heights*0.42),
                                child: Row(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: SvgPicture.asset(
                                            "assets/icons/circle_left.svg"
                                        )),

                                    SvgPicture.asset("assets/icons/bottomBook.svg", width: AppValue.widths*0.75,),
                                  ],
                                ),
                              ),
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
                                                    return Item(index: index,
                                                      image: title[index]["image"],
                                                      title: title[index]["name"],
                                                      checkAll: checkAll,);
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
                            ],
                          ),

                          SizedBox(height: AppValue.heights*0.025,),
                          InkWell(
                            onTap: (){
                              AppNavigator.navigateTabSurveyFavoritet();
                            },
                            child: Container(
                              width: AppValue.widths*0.67,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      colors: [
                                        COLORS.PRIMARY_COLOR,
                                        COLORS.PRIMARY_COLOR2,
                                      ]
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 9, bottom: 8),
                                child: Text("XÁC NHẬN",
                                  style: AppStyle.DEFAULT_16
                                      .copyWith(fontWeight: FontWeight.w500, color: COLORS.WHITE),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: AppValue.heights*0.011 ,),
                          InkWell(
                            onTap:(){
                              AppNavigator.navigateBack();
                            },
                            child: Container(
                              width: AppValue.widths*0.67,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(width: 1.5, color: COLORS.GREY)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 9, bottom: 8),
                                child: Text("QUAY LẠI",
                                  style: AppStyle.DEFAULT_16
                                      .copyWith(fontWeight: FontWeight.w500, color: COLORS.GREY),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: AppValue.heights*0.022,),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SvgPicture.asset("assets/icons/circle_bottom.svg"),
                          )
                        ],
                      ),
                    ),
                  ),
                  _itemAppBar(),
                ],
              ),

            ],
          ),
        )
    );
  }
  _itemAppBar(){
    return  Padding(
      padding: EdgeInsets.only(top: AppValue.heights*0.05, left: AppValue.widths*0.042, right: AppValue.widths*0.042,),
      child: Row(
        children: [
          Image.asset('assets/ic_launcher.png', width: 53, height: 53,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Tiềm năng', style: AppStyle.DEFAULT_16_BOLD.copyWith(color: COLORS.WHITE),),
              Text("Master", style: AppStyle.DEFAULT_16_BOLD.copyWith(color: COLORS.SECONDS_COLOR),),
            ],
          ),
          Spacer(),
          InkWell(
              onTap: (){
                setState(() {
                  checkAll = !checkAll;
                });
              },
              child:  Container(
                width: AppValue.widths*0.31,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        colors: [
                          COLORS.PRIMARY_COLOR,
                          COLORS.PRIMARY_COLOR2,
                        ]
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 9, bottom: 8.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Chọn tất cả", style: AppStyle.DEFAULT_12.copyWith(fontSize: 13, color: COLORS.WHITE),),
                      SizedBox(width: 5,),
                      Container(
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: COLORS.PRIMARY_COLOR,
                            border: Border.all(color: COLORS.WHITE, width: 1)
                        ),
                        child: checkAll == true ? SvgPicture.asset("assets/icons/select.svg") : Container(),
                      )
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}


class Item extends StatefulWidget {
  Item({Key? key,
    required this.index,
    required this.image,
    required this.title,
    required this.checkAll
  }) : super(key: key);

  bool checkAll;
  int index;
  String image;
  String title;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          widget.checkAll = !widget.checkAll;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        child: Container(
          decoration: BoxDecoration(
              color: (widget.checkAll == true ? COLORS.PRIMARY_COLOR : COLORS.WHITE),
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
                      SvgPicture.asset("${widget.image}"),
                    ],
                  ),
                ),
              ),
              WidgetText(
                title: "${widget.title}",
                style: AppStyle.DEFAULT_14.copyWith(
                    color: (widget.checkAll == true ? COLORS.WHITE : COLORS.BLACK)
                ),
              ),
              Spacer(),
              (widget.checkAll == true
                  ? SvgPicture.asset("assets/icons/choosenItem.svg")
                  : SvgPicture.asset("assets/icons/unchoosen.svg")
              ),
              SizedBox(width: 10,)
            ],
          ),
        ),
      ),
    );
  }
}