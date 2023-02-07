import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../bloc/get_referral/get_referral_bloc.dart';
import '../../../../bloc/list_history_affiliate/list_history_affiliate_bloc.dart';
import '../../../../src/src_index.dart';
import '../../../../widgets/widget_text.dart';

class MarketingScreen extends StatefulWidget {
  const MarketingScreen({Key? key}) : super(key: key);

  @override
  State<MarketingScreen> createState() => _MarketingScreenState();
}

class _MarketingScreenState extends State<MarketingScreen> {

  bool isSelect = true;

  @override
  void initState() {
    ListHistoryAffiliateBloc.of(context).add(InitGetListHistoryAffiliateEvent('AFFILIATE', page, 10));
    GetReferralBloc.of(context).add(InitGetReferralEvent());

    _scrollController.addListener(() async {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        ListHistoryAffiliateBloc.of(context).add(InitGetListHistoryAffiliateEvent('AFFILIATE', page + 1, 10));
        page = page + 1;
      } else {}
    });
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();
  late int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.BACKGROUND,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Tiếp thị liên kết',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: ()=> Get.back(),
            child: const Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: AppValue.heights*0.33,
                  child: Image.asset("assets/images/TiepThiLienKet.png",width: AppValue.widths,fit: BoxFit.fill),
                ),
                Column(
                  children: [
                    SvgPicture.asset('assets/images/image_marketing.svg',
                      height: AppValue.heights*0.2,
                      width: AppValue.widths*0.3,
                      fit: BoxFit.fill,),
                    AppValue.vSpaceTiny,
                    WidgetText(
                      title: "Chia sẻ mã giới thiệu của bạn để nhận coin",
                      style: AppStyle.DEFAULT_16.copyWith(color: white),
                    ),
                    AppValue.vSpaceTiny,
                    Container(
                      color: white,
                      height: 45,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: DottedBorder(
                        dashPattern: const [6,5],
                        strokeWidth: 2,
                        color: COLORS.PRIMARY_COLOR,
                        child: BlocBuilder<GetReferralBloc, GetReferralState>(
                          builder: (context, state) {
                            if(state is UpdateGetReferralState){
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child:Row(
                                  children: [
                                    WidgetText(
                                      title: state.data,
                                      style: AppStyle.DEFAULT_16_BOLD,
                                    ),
                                    const Spacer(),
                                    const DottedLine(
                                        dashColor: COLORS.PRIMARY_COLOR,
                                        direction: Axis.vertical,
                                        dashGapLength: 5),
                                    const SizedBox(width: 15),
                                    GestureDetector(
                                      onTap: (){
                                        Clipboard.setData(ClipboardData(text: state.data));
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                          content: Text('Đã sao chép!!'),
                                        ));

                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.asset('assets/images/copy.svg'),
                                          WidgetText(
                                            title: "  Copy",
                                            style: AppStyle.DEFAULT_14.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: COLORS.PRIMARY_COLOR
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                            else{
                             return Container();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            orSelect(),
            isSelect 
                ? Expanded(
                 child: BlocBuilder<ListHistoryAffiliateBloc, ListHistoryAffiliateState>(
                    builder: (context, state) {
                      if(state is UpdateGetListHistoryAffiliateState){
                        return state.data.isNotEmpty ? ListView.separated(
                            controller: _scrollController,
                            itemCount: state.data.length,
                            shrinkWrap: true,
                            itemBuilder: (context,index) => Container(
                              height: AppValue.heights*0.16,
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      WidgetText(
                                        title: 'Tài khoản nhập',
                                        style: AppStyle.DEFAULT_16,
                                      ),

                                      WidgetText(
                                        title: (state.data[index].userCharged != null) ? state.data[index].userCharged!.name : "Người dùng",
                                        style: AppStyle.DEFAULT_16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      WidgetText(
                                        title: 'Số coin nhận được',
                                        style: AppStyle.DEFAULT_16,
                                      ),
                                      WidgetText(
                                        title: '${state.data[index].bcoin!.round()} Bcoin',
                                        style: AppStyle.DEFAULT_16_BOLD.copyWith(color: const Color(0xffEE4D2C)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  WidgetText(
                                    title: AppValue.formatStringDate1(state.data[index].create_at.toString()),
                                    style: AppStyle.DEFAULT_16,
                                    textAlign: TextAlign.end,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            separatorBuilder: (context,index) => Container(
                              height: 1,
                              decoration: BoxDecoration(
                                  color: COLORS.GREY.withOpacity(0.5),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        spreadRadius: 5,
                                        offset: const Offset(4,4),
                                        color: COLORS.GREY.withOpacity(0.1)
                                    )
                                  ]
                              ),
                            ),
                        ) : Center(child: Column(
                          children: const [
                            AppValue.vSpaceSmall,
                            WidgetContainerImage(
                              image: 'assets/images/no_item.png',
                              width: 146,
                              height: 146,
                              fit: BoxFit.contain,
                            ),
                            Text('Không có dữ liệu !!'),
                          ],
                        ),
                        );
                      }
                      else{
                        return Container();
                      }
                    },
                  ),
                )
                : const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15,right: 15 ,top: 10),
                    // child: ListView.separated(
                    //     shrinkWrap: true,
                    //     itemBuilder: (context,index) => GestureDetector(
                    //       // onTap: (){
                    //       //   AppNavigator.navigateEvent();
                    //       // },
                    //       child: Container(
                    //         height: AppValue.heights*0.12,
                    //         decoration: BoxDecoration(
                    //           border: Border.all(width: 1, color: COLORS.GREY.withOpacity(0.2))
                    //         ),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             ClipRRect(
                    //               child: Image.asset('assets/images/img.png',width: 114,fit: BoxFit.fill,),
                    //             ),
                    //             Padding(
                    //                 padding: const EdgeInsets.only(right: 8),
                    //               child: Column(
                    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                 crossAxisAlignment: CrossAxisAlignment.start,
                    //                 children: [
                    //                   WidgetText(
                    //                     title: 'Chia sẻ bạn bè - nhận quà liền tay',
                    //                     style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w600),
                    //                     overflow: TextOverflow.ellipsis,
                    //                   ),
                    //                   WidgetText(
                    //                     title: 'Thời gian: từ 20/05/2022 - 30/05/2022',
                    //                     style: AppStyle.DEFAULT_14,
                    //                     overflow: TextOverflow.ellipsis,
                    //                   )
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     separatorBuilder: (context,index) => const SizedBox(height: 8,),
                    //     itemCount: 5
                    // ),
                  ),
            )
          ],
        ),),
    );
  }
  orSelect(){
    return Column(
      children : [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  setState((){
                    isSelect = !isSelect;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: 35,
                      child: WidgetText(
                        title: "Lịch sử nhận Bcoin",
                        style: isSelect
                            ? AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w600,color: const Color(0xffEE4D2C))
                            : AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w600,color: COLORS.GREY),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 1,
                      color: isSelect ? const Color(0xffEE4D2C) : null,
                    )
                  ],
                ),
              ),
              AppValue.hSpaceSmall,
              GestureDetector(
                onTap: (){
                  setState((){
                    isSelect = !isSelect;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      height: 35,
                      child: WidgetText(
                        title: "Sự kiện",
                        style: !isSelect
                            ? AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w600,color: const Color(0xffEE4D2C))
                            : AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w600,color: COLORS.GREY),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 1,
                      color: !isSelect ? const Color(0xffEE4D2C) : null,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: COLORS.GREY.withOpacity(0.5),
        ),
      ]
    );
  }
}
