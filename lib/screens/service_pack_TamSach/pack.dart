import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sumary_app/bloc/list_offer_package/list_offer_package_bloc.dart';
import 'package:sumary_app/screens/service_pack_TamSach/pack_dialog_widget.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';

class Sevice_Pack1 extends StatefulWidget {
  const Sevice_Pack1({Key? key}) : super(key: key);

  @override
  State<Sevice_Pack1> createState() => _Sevice_Pack1State();
}

class _Sevice_Pack1State extends State<Sevice_Pack1> {

  int indexSelect = -1;

  bool checkDialog = false;

  bool check = true;

  List<Map<String,dynamic>> title1 = [
    {"image":"assets/icons/pt_yourseft.svg", "name":'Truy cập không giới hạn tất cả các Tâm Sách đa dạng chủ đề của Thư viện Tâm Sách '},
    {"image":"assets/icons/love.svg", "name":"Đọc/Nghe Tâm sách mọi lúc mọi nơi mà không cần kết nối Internet "},
    {"image":"assets/icons/scrhappy.svg", "name":'Tiết kiệm thời gian tiếp thu kiến thức mới'},
    {"image":"assets/icons/tam_linh.svg", "name":'Thư viện Tâm sách được đổi mới mỗi tuần '},
  ];

  List<Map<String,dynamic>> title2 = [
    {"image":"assets/icons/pt_yourseft.svg", "name":'Không chia sẻ tài khoản để dùng chung, nếu không Gói ưu đãi sẽ bị thu hồi và mất hiệu lực.'},
    {"image":"assets/icons/love.svg", "name":"Gói tuần/Gói tháng sau khi mua không thể đổi trả dưới mọi hình thức, xin vui lòng đọc kỹ trước khi giao dịch."},
    {"image":"assets/icons/scrhappy.svg", "name":'Gói năm sau khi mua cho phép khách hàng đc hủy và hoàn tiền theo % đã sử dụng. Vui lòng liên hệ với chúng tôi khi có nhu cầu hủy gói.'},
    {"image":"assets/icons/tam_linh.svg", "name":'Khi hết thời gian sử dụng Gói ưu đãi, bạn sẽ không còn quyền truy cập các Tâm sách đã mua. Nếu muốn lấy lại quyền truy cập, vui lòng chọn và mua 1 Gói ưu đãi bất kỳ của TN Master.'},
  ];

  List<Map<String, dynamic>> paydialog = [
    {"image":"assets/images/vn_pay.png", "color":COLORS.GREEN1, "title":"Vn Pay", "value":1},
    {"image":"assets/images/momo.png", "color":COLORS.VIOLET1, "title":"MoMo", "value":2},
    {"image":"assets/images/vietel_pay.png", "color":COLORS.RED2, "title":"Viettel Pay", "value":3},
    {"image":"assets/images/zalo_pay.png", "color":COLORS.BLUE, "title":"Zalo Pay", "value":4},
  ];


  int value = 1;
  int packNumber = 1;
  String packName = "Gói tuần";
  String discount = "(Tiết kiệm 21%)";
  String packValue = "69.000";
  String per_time = "Đồng/Tuần";

  //Todo: Gói dịch vụ tấm sách
  
  @override
  void initState() {
    ListOfferPackageBloc.of(context).add(InitGetListOfferPackageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
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
                          GestureDetector(onTap:(){
                            Get.back();
                            Get.back();
                          },
                              child: const Icon(Icons.arrow_back, color: COLORS.WHITE, )),
                          SizedBox(height: AppValue.heights*0.056,)
                        ],
                      ),
                      Image.asset('assets/icons/logo_bigsize.png', width: AppValue.widths*0.3,),
                      const SizedBox(width: 20,),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: AppValue.heights*0.025,),
            WidgetText(
              title: "Đăng ký hội viên",
              style: AppStyle.DEFAULT_16.copyWith(color: COLORS.GREY_CS, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4,),
            WidgetText(
              title: "Chọn gói ưu đãi",
              style: AppStyle.DEFAULT_16.copyWith(fontSize: 37, color: COLORS.PRIMARY_COLOR, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8,),
            Image.asset("assets/icons/Group 16952.png", width: 115,),

            _registerPack(),
            AppValue.vSpaceSmall,
            _benefitRegister(),

          ],
        ),
      ),
    );
  }
  _registerPack(){
    return BlocBuilder<ListOfferPackageBloc, ListOfferPackageState>(
      builder: (context, state) {
        if(state is UpdateListOfferPackageState){
          return Column(
            children: [
              Column(
                children: List.generate(state.data!.length, (index) => GestureDetector(
                  onTap: (){
                    setState(() {
                      indexSelect = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: AppValue.heights*0.02, left: 15, right: 15),
                    child: Stack(
                      children: [
                        Image.asset(
                          (indexSelect == index) ? (index%3==0) ? "assets/icons/pack1.png" : (index%3==1) ? "assets/icons/pack2.png" : "assets/icons/pack3.png"
                          : "assets/icons/pack_unChoosen.png",
                          width: AppValue.widths*0.92,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                          child: Column(
                            children: [
                              WidgetText(
                                title: "GÓI",
                                style: AppStyle.DEFAULT_18.copyWith(color: COLORS.WHITE),
                              ),
                              WidgetText(
                                title: "0${index+1}",
                                style: AppStyle.DEFAULT_18.copyWith(fontSize: AppValue.heights*0.062, color: COLORS.WHITE),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: AppValue.widths*0.28, top: AppValue.heights*0.022 ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  WidgetText(
                                    title: '*'+state.data![index].title.toString(),
                                    style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w600, color: COLORS.PRIMARY_COLOR),
                                  ),
                                  AppValue.hSpaceTiny,
                                  (state.data![index].savePercent == 0) ? const SizedBox() : WidgetText(
                                    title: "(Tiết kiệm: ${state.data![index].savePercent}%)",
                                    style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  WidgetText(
                                    title: AppValue.format_money(state.data![index].cost!.toDouble()),
                                    style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w800, color: COLORS.PRIMARY_COLOR),
                                  ),
                                  const SizedBox(width: 4,),
                                  WidgetText(
                                    title: "Đồng/${state.data![index].title!.split(" ").last}",
                                    style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500,),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),),
              ),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: (){
                  if(indexSelect > -1){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            contentPadding: const EdgeInsets.all(0),
                            insetPadding: const EdgeInsets.all(16),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5))),
                            content: Container(
                              width: AppValue.widths,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: IntrinsicHeight(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 0),
                                          child: Image.asset("assets/icons/diaLog_t.png",
                                            height: AppValue.heights*0.171,
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: AppValue.widths*0.065, top: AppValue.heights*0.12),
                                            child: Stack(
                                              children: [
                                                Image.asset((indexSelect%3==0) ? "assets/icons/pack1.png" : (indexSelect%3==1) ? "assets/icons/pack2.png" : "assets/icons/pack3.png", width: AppValue.widths*0.67,),
                                                Padding (
                                                  padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                                                  child: Column(
                                                    children: [
                                                      WidgetText(
                                                        title: "GÓI",
                                                        style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),
                                                      ),
                                                      WidgetText(
                                                        title: "0${indexSelect+1}",
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
                                                            title: "*${state.data![indexSelect].title}",
                                                            style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w600, color: COLORS.PRIMARY_COLOR),
                                                          ),
                                                          const SizedBox(width: 4,),
                                                          (state.data![indexSelect].savePercent != 0) ? WidgetText(
                                                            title: "(Tiết kiệm ${state.data![indexSelect].savePercent}%)",
                                                            style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w400, color: COLORS.BLUE),
                                                          ): SizedBox(),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          WidgetText(
                                                            title: AppValue.format_money(state.data![indexSelect].cost!.toDouble()),
                                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w800, color: COLORS.PRIMARY_COLOR),
                                                          ),
                                                          const SizedBox(width: 4,),
                                                          WidgetText(
                                                            title: "Đồng/${state.data![indexSelect].title!.split(" ").last}",
                                                            style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500,),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: AppValue.widths*0.1, top: AppValue.heights*0.08),
                                          child: Text("Gói đã chọn:", style: AppStyle.DEFAULT_16.copyWith(color: COLORS.BLUE),),
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
                                      ],
                                    ),

                                    AppValue.vSpaceTiny,

                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: AppValue.widths*0.05
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          WidgetText(
                                            title: "Hình Thức Thanh Toán:",
                                            style: AppStyle.DEFAULT_14.copyWith(color: COLORS.BLUE),
                                          ),
                                        ],
                                      ),
                                    ),
                                    AppValue.vSpaceTiny,

                                    SizedBox(
                                      height: AppValue.heights*0.17,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: GridView.builder(
                                            physics: const NeverScrollableScrollPhysics(),
                                            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10,
                                                mainAxisExtent: AppValue.heights * 0.06
                                            ),
                                            itemCount: paydialog.length,
                                            itemBuilder: (BuildContext, index){
                                              return InkWell(
                                                onTap:(){
                                                  //AppNavigator.navigateBack();
                                                  ShowDialog_Pack.createDialog_PayQR(
                                                      value: paydialog[index]["value"],
                                                      context: context,
                                                      titleButton1: "",
                                                      image: "assets/images/qr_bank.png"
                                                  );
                                                },
                                                child: Container(
                                                  height: 48,
                                                  width: AppValue.widths *0.374,
                                                  decoration: BoxDecoration(
                                                    color: paydialog[index]["color"],
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Image.asset("${paydialog[index]["image"]}", width: 23, height: 23,),
                                                        AppValue.hSpaceTiny,
                                                        WidgetText(
                                                          title: "${paydialog[index]["title"]}",
                                                          style: AppStyle.DEFAULT_16.copyWith(color:COLORS.WHITE),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                        ),
                                      ),
                                    ),

                                    AppValue.vSpaceSmall,

                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                      child: InkWell(
                                        onTap: (){
                                          ShowDialog_Pack.createDialog_PayQRbank(
                                              context: context,
                                              titleButton1: ""
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            Image.asset("assets/icons/bank_img.png",
                                              width: AppValue.widths*0.86,
                                              height: AppValue.heights*0.12, fit: BoxFit.fill,),
                                            Padding(
                                              padding: EdgeInsets.only(top: AppValue.heights*0.025, left: AppValue.widths*0.025),
                                              child: SvgPicture.asset("assets/icons/bank_icon.svg"),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: AppValue.heights*0.031, left: AppValue.widths*0.175),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [

                                                  WidgetText(
                                                    title: "Chuyển khoản ngân hàng",
                                                    style: AppStyle.DEFAULT_18_BOLD.copyWith(color: COLORS.WHITE, fontSize: 17),
                                                  ),

                                                  WidgetText(
                                                      title: "(Miễn phí và an toàn)",
                                                      style: AppStyle.DEFAULT_12.copyWith(color:COLORS.WHITE)
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    AppValue.vSpaceSmall,

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RichText(text: TextSpan(
                                            children: <TextSpan>[
                                              const TextSpan(
                                                  text: "(Vui lòng chọn một ",
                                                  style: AppStyle.DEFAULT_12
                                              ),
                                              TextSpan(
                                                  text: "Hình Thức Thanh Toán ",
                                                  style: AppStyle.DEFAULT_12.copyWith(color: COLORS.PRIMARY_COLOR)
                                              ),
                                              const TextSpan(
                                                  text: ")",
                                                  style: AppStyle.DEFAULT_12
                                              ),
                                            ]
                                        ))
                                      ],
                                    ),
                                    AppValue.vSpaceTiny,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/icons/dot_icon.png", height: 12,)
                                      ],
                                    ),
                                    Spacer(),
                                    Stack(
                                      children: [
                                        Image.asset("assets/icons/Vector 12.png",alignment: Alignment.bottomCenter,),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: InkWell(
                                            onTap:(){
                                              AppNavigator.navigateBack();
                                            },
                                            child: Container(
                                              width: AppValue.widths*0.67,
                                              padding: const EdgeInsets.only(top: 12, bottom: 11),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  color: COLORS.GREY_E5
                                              ),
                                              child: WidgetText(
                                                title: "THOÁT",
                                                style: AppStyle.DEFAULT_20.copyWith(fontWeight: FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                        );
                      },
                    );
                  }
                },
                child:
                Container(
                  width:checkDialog == true ? AppValue.widths*0.5 : AppValue.widths*0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: indexSelect != -1 ? COLORS.PRIMARY_COLOR2 : COLORS.GREY_400,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 9, bottom: 8, left: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetText(
                          title: checkDialog == true ? "ĐÃ THANH TOÁN" : "THANH TOÁN",
                          style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w600, color: COLORS.WHITE,),
                          textAlign: TextAlign.center,
                        ),
                        checkDialog == true ? const SizedBox(width: 8,) : Container(),
                        checkDialog == true ? SvgPicture.asset("assets/icons/choosenItem.svg") : Container(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }else{
          return const SizedBox();
        }
      },
    );
  }

  bool ckeck1 = false;
  bool ckeck2 = false;

  _benefitRegister(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ckeck1 == false
            ?InkWell(
              onTap:(){
                setState(() {
                  ckeck1 = !ckeck1;
                });
              },
              child: Container(
              width: AppValue.widths*0.92,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: COLORS.RED2,
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 2,
                    color: COLORS.GREY_A6
                  )
                ]
          ),
          child: Padding(
              padding: const EdgeInsets.only(top: 21, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: AppValue.widths*0.13,),
                  Image.asset('assets/icons/benefit_pack.png', width: AppValue.widths*0.084,),
                  const SizedBox(width: 8,),
                  Text("LỢI ÍCH KHI SỬ DỤNG GÓI", style: AppStyle.DEFAULT_16_BOLD
                      .copyWith(color: COLORS.WHITE), textAlign: TextAlign.center,
                  ),
                  Container(width: AppValue.widths*0.09,),
                  const Icon(Icons.keyboard_arrow_down_outlined, color: COLORS.WHITE,)
                ],
              ),
          ),
        ),
            )
            :Column(
              children: [
                InkWell(
                  onTap:(){
                    setState(() {
                      ckeck1 = !ckeck1;
                    });
                  },
                  child: Container(
                    width: AppValue.widths*0.92,
                    decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    color: COLORS.RED2,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 2,
                          color: COLORS.GREY_A6
                      )
                    ]
                    ),
                    child: Padding(
                          padding: const EdgeInsets.only(top: 21, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(width: AppValue.widths*0.13,),
                              Image.asset('assets/icons/benefit_pack.png', width: AppValue.widths*0.084,),
                              const SizedBox(width: 8,),
                              Text("LỢI ÍCH KHI SỬ DỤNG GÓI", style: AppStyle.DEFAULT_16_BOLD
                                  .copyWith(color: COLORS.WHITE), textAlign: TextAlign.center,
                              ),
                              Container(width: AppValue.widths*0.09,),
                              const Icon(Icons.keyboard_arrow_up_outlined, color: COLORS.WHITE,)
                            ],
                          ),
                    ),
                  ),
                ),
                Container(
                  width: AppValue.widths*0.92,
                  decoration: BoxDecoration(
                      boxShadow: [
                        const BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 0,
                            color: COLORS.GREY_A6
                        )
                      ],
                      color: COLORS.GREY_E7,
                      border: Border.all(width: 1, color: COLORS.RED2),
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8))
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: AppValue.widths*0.034),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/truy_cap.svg"),
                            AppValue.hSpaceVrTiny,
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: AppValue.widths*0.72,
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: "Truy cập ", style: AppStyle.DEFAULT_14,
                                          ),
                                          TextSpan(
                                            text: "không giới hạn ", style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: COLORS.BLUE4),
                                          ),
                                          const TextSpan(
                                            text: "tất cả Tâm Sách đa đa dạng chủ đề của ", style: AppStyle.DEFAULT_14,
                                          ),
                                          TextSpan(
                                            text: "Thư viện Tâm Sách", style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: COLORS.RED2),
                                          ),
                                        ]
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: AppValue.widths,
                        height: 2,
                        color: COLORS.WHITE,
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: AppValue.widths*0.034),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/wifi.svg"),
                            AppValue.hSpaceVrTiny,
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: AppValue.widths*0.73,
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: "Đọc/Nghe Tâm sách mọi lúc mọi nơi mà không cần ",
                                            style: AppStyle.DEFAULT_14,
                                          ),
                                          TextSpan(
                                            text: "kết nối Internet",
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: COLORS.BLUE4),
                                          ),
                                        ]
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: AppValue.widths,
                        height: 2,
                        color: COLORS.WHITE,
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: AppValue.widths*0.034),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/tietkiem_time.svg"),
                            AppValue.hSpaceVrTiny,
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: AppValue.widths*0.72,
                                    child: RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "Tiết kiệm thời gian ",
                                              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: COLORS.BLUE4),
                                            ),
                                            const TextSpan(
                                              text: "tiếp thu kiến thức mới",
                                              style: AppStyle.DEFAULT_14,
                                            ),
                                          ]
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: AppValue.widths,
                        height: 2,
                        color: COLORS.WHITE,
                      ),

                      Padding (
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: AppValue.widths*0.034),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/doimoi_moituan.svg"),
                            AppValue.hSpaceVrTiny,
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: AppValue.widths*0.72,
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: "Thư viện Tâm sách được ",
                                              style: AppStyle.DEFAULT_14
                                          ),
                                          TextSpan(
                                              text: "đổi mới mỗi tuần",
                                              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: COLORS.BLUE4)
                                          )
                                        ]
                                      ),
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
              ],
            ),
        AppValue.vSpaceMedium,
        ckeck2 == false
            ?InkWell(
          onTap:(){
            setState(() {
              ckeck2 = !ckeck2;
            });
          },
              child: Container(
          width: AppValue.widths*0.92,
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: COLORS.RED2,
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: 0,
                      blurRadius: 2,
                      color: COLORS.GREY_A6
                  )
                ]
          ),
          child: Padding(
              padding: const EdgeInsets.only(top: 21, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: AppValue.widths*0.09,),
                  Image.asset('assets/icons/book_az.png', width: AppValue.widths*0.084,),
                  const SizedBox(width: 8,),
                  Text("ĐIỀU KHOẢN KHI SỬ DỤNG GÓI", style: AppStyle.DEFAULT_16_BOLD
                      .copyWith(color: COLORS.WHITE), textAlign: TextAlign.center,
                  ),
                  Container(width: AppValue.widths*0.03,),
                  const Icon(Icons.keyboard_arrow_down_outlined, color: COLORS.WHITE,)
                ],
              ),
          ),
        ),
            )
            :Column(
          children: [
            InkWell(
              onTap:(){
                setState(() {
                  ckeck2 = !ckeck2;
                });
              },
              child: Container(
                width: AppValue.widths*0.92,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    color: COLORS.RED2,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 2,
                          color: COLORS.GREY_A6
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 21, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: AppValue.widths*0.09,),
                      Image.asset('assets/icons/book_az.png', width: AppValue.widths*0.084,),
                      const SizedBox(width: 8,),
                      Text("ĐIỀU KHOẢN KHI SỬ DỤNG GÓI", style: AppStyle.DEFAULT_16_BOLD
                          .copyWith(color: COLORS.WHITE), textAlign: TextAlign.center,
                      ),
                      Container(width: AppValue.widths*0.03,),
                      const Icon(Icons.keyboard_arrow_up_outlined, color: COLORS.WHITE,)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: AppValue.widths*0.92,
              decoration: BoxDecoration(
                  boxShadow: [
                    const BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 0,
                        color: COLORS.GREY_A6
                    )
                  ],
                  color: COLORS.GREY_E7,
                  border: Border.all(width: 1, color: COLORS.RED2),
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8))
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: AppValue.widths*0.034),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/block_share.svg"),
                        AppValue.hSpaceVrTiny,
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: AppValue.widths*0.72,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Không chia sẻ tài khoản ",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: COLORS.BLUE),
                                      ),
                                      const TextSpan(
                                        text: "để dùng chung, nếu không Gói ưu đãi sẽ bị thu hồi và mất hiệu lực.",
                                        style: AppStyle.DEFAULT_14,
                                      ),

                                    ]
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppValue.widths,
                    height: 2,
                    color: COLORS.WHITE,
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: AppValue.widths*0.034),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/dk2.svg"),
                        AppValue.hSpaceVrTiny,
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: AppValue.widths*0.72,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Gói tuần/Gói tháng ",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: COLORS.BLUE),
                                      ),
                                      const TextSpan(
                                        text: "sau khi mua ",
                                        style: AppStyle.DEFAULT_14,
                                      ),
                                      TextSpan(
                                        text: "không thể đổi trả ",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: COLORS.RED2),
                                      ),const TextSpan(
                                        text: "dưới mọi hình thức, xin vui lòng đọc kỹ trước khi giao dịch.",
                                        style: AppStyle.DEFAULT_14,
                                      ),
                                    ]
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppValue.widths,
                    height: 2,
                    color: COLORS.WHITE,
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: AppValue.widths*0.034),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/dk3.svg"),
                        AppValue.hSpaceVrTiny,
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: AppValue.widths*0.72,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Gói năm ",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: COLORS.BLUE),
                                      ),
                                      const TextSpan(
                                        text: "sau khi mua cho phép khách hàng đc hủy và ",
                                        style: AppStyle.DEFAULT_14,
                                      ),
                                      TextSpan(
                                        text: "hoàn tiền ",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: COLORS.RED2),
                                      ),
                                      const TextSpan(
                                        text: "theo % đã sử dụng. Vui lòng ",
                                        style: AppStyle.DEFAULT_14,
                                      ),
                                      TextSpan(
                                        text: "liên hệ ",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: COLORS.BLUE),
                                      ),
                                      const TextSpan(
                                        text: "với chúng tôi khi có nhu cầu hủy gói. ",
                                        style: AppStyle.DEFAULT_14,
                                      ),
                                    ]
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppValue.widths,
                    height: 2,
                    color: COLORS.WHITE,
                  ),

                  Padding (
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: AppValue.widths*0.034),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/dk4.svg"),
                        AppValue.hSpaceVrTiny,
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: AppValue.widths*0.71,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: "Khi hết thời gian sử dụng Gói ưu đãi, bạn sẽ không còn quyền truy cập các Tâm sách đã mua. Nếu muốn lấy lại quyền truy cập, vui lòng chọn và mua 1 Gói ưu đãi bất kỳ của ",
                                        style: AppStyle.DEFAULT_14,
                                      ),
                                      TextSpan(
                                        text: "TN Master.",
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500, color: COLORS.RED2),
                                      ),
                                    ]
                                  ),
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
          ],
        ),
        AppValue.vSpaceMedium,

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetText(
              title: "Hỗ trợ:",
              style: AppStyle.DEFAULT_14_BOLD,
            ),
            WidgetText(
              title: "Vui lòng ",
              style: AppStyle.DEFAULT_14,
            ),
            WidgetText(
              title: "liên hệ trực tiếp ",
              style: AppStyle.DEFAULT_14.copyWith(color: COLORS.BLUE),
            ),
            WidgetText(
              title: "với chúng tôi khi bạn gặp",
              style: AppStyle.DEFAULT_14,
            ),
          ],
        ),
        WidgetText(
          title: "vấn đề trong quá trình đăng ký, thanh toán và sử dụng gói.",
          style: AppStyle.DEFAULT_14,
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: AppValue.heights*0.026),
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
            Image.asset("assets/icons/start.png"),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset("assets/icons/pack_bottom.png"),
            )
          ],
        ),

      ]
    );
  }
}
