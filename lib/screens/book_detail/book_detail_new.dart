import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sumary_app/bloc/save_book/save_book_bloc.dart';
import 'package:sumary_app/screens/book_detail/modal_sheet_buy.dart';
import 'package:sumary_app/widgets/widget_dialog.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../bloc/avg_rate/avg_rate_bloc.dart';
import '../../bloc/detail_product/detail_product_bloc.dart';
import '../../bloc/detail_product_view/detail_product_view_bloc.dart';
import '../../bloc/list_quote/list_quote_bloc.dart';
import '../../bloc/list_quote_view/list_quote_view_bloc.dart';
import '../../bloc/list_rate_product/list_rate_product_bloc.dart';
import '../../bloc/list_rate_product_view/list_rate_product_view_bloc.dart';
import '../../bloc/unsave_book/unsave_book_bloc.dart';
import '../../src/models/model_generator/detail_productt.dart';
import '../../src/spacing.dart';
import '../../src/src_index.dart';
import '../../storages/storages.dart';
import 'widget_tabbar/commentBook.dart';
import 'widget_tabbar/introduceBook.dart';

class BookDetailNew extends StatefulWidget {
  const BookDetailNew({Key? key}) : super(key: key);

  @override
  State<BookDetailNew> createState() => _BookDetailNewState();
}

class _BookDetailNewState extends State<BookDetailNew> {
  String id = Get.arguments;
  double avgRate = 0;

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

     if((shareLocal.getString(PreferencesKey.TOKEN)) == '' || shareLocal.getString(PreferencesKey.TOKEN) == null){
       ListQuoteViewBloc.of(context).add(InitGetListQuoteViewEvent(id.toString()));
       ListRateProductViewBloc.of(context).add(InitGetListRateProductViewEvent(id, 0, 0));
       DetailProductViewBloc.of(context).add(InitDetailProductViewEvent(id));
     }else {
       ListQuoteBloc.of(context).add(InitGetListQuoteEvent(id.toString()));
       ListRateProductBloc.of(context).add(InitGetListRateProductEvent(id, 0, 0));
       DetailProductBloc.of(context).add(InitDetailProductEvent(id));
     }
    if(connectivityResult == ConnectivityResult.none) {
      return;
    } else {
      AvgRateBloc.of(context).add(InitAvgRateEvent(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.WHITE,
      body: DefaultTabController(
        length: 2,
        child: ((shareLocal.getString(PreferencesKey.TOKEN)) == '' || shareLocal.getString(PreferencesKey.TOKEN) == null) ? BlocBuilder<DetailProductViewBloc, DetailProductViewState>(
          builder: (context, state) {
            if(state is UpdateDetailProductViewState) {
              DataDetailProduct data = state.data;
              return buildDetailBookNew(data);
            }
            else{
              return Container();
            }
          },
        ) : BlocBuilder<DetailProductBloc, DetailProductState>(
          builder: (context, state) {
            if(state is UpdateGetDetailProductState) {
              DataDetailProduct data = state.data;
              return buildDetailBookNew(data);
            }
            else{
              return Container();
            }
          },
        ) ,
      ),
    );
  }

  buildDetailBookNew( DataDetailProduct data) {
    return Stack(
        children: [
          BlocBuilder<AvgRateBloc, AvgRateState>(
            builder: (context, state) {
              if(state is UpdateAvgRateState){
                if(state.data.avgContentRate == null || state.data.avgContentRate == null){
                  avgRate = 0.0;
                }
                else{
                  avgRate = ((state.data.avgContentRate! + state.data.avgVoiceRate!) / 2);
                }
                return headerTopBook(data: data,avgRate: avgRate);
              }
              else{
                return Container();
              }
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.62,
            minChildSize: 0.62,
            maxChildSize: 0.885,
            builder: (BuildContext context, ScrollController draggableScrollable) {
              return Container(
                decoration: const BoxDecoration(
                    color: COLORS.WHITE,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )
                ),
                child: Column(
                  children: [
                    Container(
                      height: 54,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: COLORS.GREY_E7)
                          )
                      ),
                      child: TabBar(
                          labelPadding: const EdgeInsets.all(0),
                          indicatorPadding: const EdgeInsets.all(0),
                          automaticIndicatorColorAdjustment: false,
                          unselectedLabelColor: HexColor('#777777'),
                          unselectedLabelStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          overlayColor: MaterialStateColor.resolveWith((states) => Colors.white),
                          labelColor: HexColor('#EE4D2C'),
                          labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: HexColor('#EE4D2C')
                          ),
                          indicatorColor: HexColor('#EE4D2C'),
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                                color: HexColor('#EE4D2C'), width: 2.0),
                            insets: const EdgeInsets.symmetric(horizontal: 50),
                          ),
                          tabs: [
                            Container(
                                width: AppValue.widths*0.5,
                                decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(width: 1,color: COLORS.GREY_400),
                                    )
                                ),
                                child: const Text('Giới thiệu',textAlign: TextAlign.center)
                            ),
                            SizedBox(
                                width: AppValue.widths*0.5,
                                child: const Text('Nhận Xét',textAlign: TextAlign.center)
                            ),
                          ]
                      ),
                    ),
                    Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              controller: draggableScrollable,
                              child: introBook(data: data,avgRate: avgRate),
                            ),
                            SingleChildScrollView(
                              controller: draggableScrollable,
                              child: commentBook(id: id,),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      );
  }
}

class headerTopBook extends StatelessWidget {
  DataDetailProduct data;
  double avgRate;

  headerTopBook({
    Key? key,
    required this.data,
    required this.avgRate,
  }) : super(key: key);

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Chia sẻ tâm sách',
        text: 'Chia sẻ tâm sách',
        linkUrl: 'https://tiem-nang-master.netlify.app/',
        chooserTitle: 'Chia sẻ tâm sách'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppValue.widths,
      height: AppValue.heights*0.4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bgr_bookdetail.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15,left: 15,bottom: 15,top: 15 + Spacing.viewPadding.top),
            child: Row(
              children: [
                GestureDetector(
                    onTap:(){
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios_sharp,color: COLORS.WHITE,)),
                const Spacer(),
                GestureDetector(
                    onTap: share,
                    child: SvgPicture.asset('assets/icons/share.svg',color: COLORS.WHITE)
                ),
                AppValue.hSpaceSmall,
                buildSaveBook(data: data,isSave: data.is_save,)
              ],
            ),
          ),
          Container(
            width: AppValue.widths*0.92,
            height: Get.height*0.17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/icons/bokdetail.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(data.book!.images![0],height: Get.height*0.145,fit: BoxFit.cover,)),
                  AppValue.hSpace(14),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetText(
                        title: data.book!.name,
                        style: AppStyle.DEFAULT_18.copyWith(
                            fontWeight: FontWeight.w600,
                            color: COLORS.WHITE
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/time.svg'),
                          AppValue.hSpace(4),
                          WidgetText(
                            title: "${data.book!.voiceTime ?? 0} phút",
                            style: AppStyle.DEFAULT_14.copyWith(
                                fontWeight: FontWeight.w400,
                                color: COLORS.WHITE
                            ),
                          ),
                          AppValue.hSpaceSmall,
                          SvgPicture.asset('assets/icons/eye.svg'),
                          AppValue.hSpace(4),
                          WidgetText(
                            title: '${data.book!.viewCount ?? 0} lượt xem',
                            style: AppStyle.DEFAULT_14.copyWith(
                                fontWeight: FontWeight.w400,
                                color: COLORS.WHITE
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      RatingBarIndicator(
                        rating: avgRate,
                        itemBuilder: (context, index) =>
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 23.5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/coincoin.svg'),
                          AppValue.hSpace(4),
                          WidgetText(
                            title: data.book!.price.toString(),
                            style: AppStyle.DEFAULT_24.copyWith(
                                fontWeight: FontWeight.w600,
                                color: HexColor('#FAFF00'),
                                fontSize: 30
                            ),
                          ),
                          WidgetText(
                            title: " Bcoin",
                            style: AppStyle.DEFAULT_18.copyWith(
                              color: COLORS.WHITE,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          (data.book!.price != data.book!.prePrice) ? Row(
                            children: [
                              Icon(Icons.arrow_left, color: COLORS.WHITE,),
                              WidgetText(
                                title: "${data.book!.prePrice} Bcoin",
                                style: AppStyle.DEFAULT_18.copyWith(
                                    fontSize: 16,
                                    color: HexColor('#D4D4D4'),
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough
                                ),
                              ),
                            ],
                          ) : Container(),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),

          SizedBox(
            width: AppValue.widths,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      print('object');
                    },
                    child: Container(
                      height: AppValue.widths*0.11,
                      width: AppValue.widths*0.11,
                      decoration: BoxDecoration(
                        color: HexColor('#2896FF'),
                        borderRadius: BorderRadius.circular(AppValue.widths*0.11)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          'assets/icons/lisst.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  data.is_buy
                      ? GestureDetector(
                    onTap: (){
                      if(data.book!.voice!.isNotEmpty){
                        AppNavigator.navigateAudioScreen(data,0);
                      }else{
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return WidgetDialog(
                                title: MESSAGES.NOTIFICATION,
                                content: "Tâm sách này hiện chưa có audio!!",
                                onTap1: () {
                                  Get.back();
                                }
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                      height: AppValue.widths*0.11,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              HexColor('FF9F00'),
                              HexColor('F17400').withOpacity(1)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(AppValue.widths*0.11)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/tainghe.svg'),
                            AppValue.hSpace(5),
                            WidgetText(
                              title: 'Nghe Tâm Sách',
                              style: AppStyle.DEFAULT_16.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: COLORS.WHITE
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                      : GestureDetector(
                    onTap: (){
                      AppNavigator.navigateChapterDetail(data.book!.Id.toString(),0);
                    },
                    child: Container(
                      height: AppValue.widths*0.11,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: COLORS.PRIMARY_COLOR),
                          color: HexColor('#263238').withOpacity(0.7),
                          borderRadius: BorderRadius.circular(AppValue.widths*0.11)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/mosach.svg',color: COLORS.PRIMARY_COLOR,),
                            AppValue.hSpace(5),
                            WidgetText(
                              title: 'Trải Nghiệm Thử',
                              style: AppStyle.DEFAULT_16.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: COLORS.WHITE
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  data.is_buy
                      ? GestureDetector(
                    onTap: (){
                      AppNavigator.navigateChapterDetail(data.book!.Id.toString(),0);
                    },
                    child: Container(
                      height: AppValue.widths*0.11,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              HexColor('FF9F00'),
                              HexColor('F17400').withOpacity(1)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(AppValue.widths*0.11)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/mosach.svg'),
                            AppValue.hSpace(5),
                            WidgetText(
                              title: 'Đọc Tâm Sách',
                              style: AppStyle.DEFAULT_16.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: COLORS.WHITE
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                      : GestureDetector(
                    onTap: () {
                      ((shareLocal.getString(PreferencesKey.TOKEN)) == '' || shareLocal.getString(PreferencesKey.TOKEN) == null) ? showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return WidgetDialog(
                              title: MESSAGES.NOTIFICATION,
                              content: "Bạn cần đăng nhập để mua sách !!",
                              onTap1: () {
                                Get.back();
                              }
                          );
                        },
                      ) :
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            SingleChildScrollView(
                              controller: ModalScrollController.of(context),
                              child: Modal_Sheet(
                                changeStatus: () {
                                },
                                name: data.book!.name.toString(),
                                price: data.book!.price!.toInt(),
                                id: data.book!.Id.toString(),
                              ),
                            ),
                      );
                    },
                    child: Container(
                      height: AppValue.widths*0.11,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: COLORS.PRIMARY_COLOR),
                          color: HexColor('#263238').withOpacity(0.7),
                          borderRadius: BorderRadius.circular(AppValue.widths*0.11)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/shoppping.svg',color: COLORS.PRIMARY_COLOR,),
                            AppValue.hSpace(5),
                            WidgetText(
                              title: 'Mua Tâm Sách',
                              style: AppStyle.DEFAULT_16.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: COLORS.WHITE
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class buildSaveBook extends StatefulWidget {
  DataDetailProduct data;
  bool isSave;
  buildSaveBook({
    Key? key,
    required this.data,
    required this.isSave,
  }) : super(key: key);

  @override
  State<buildSaveBook> createState() => _buildSaveBookState();
}

class _buildSaveBookState extends State<buildSaveBook> {
  @override
  Widget build(BuildContext context) {
    return !widget.isSave
        ? GestureDetector(
        onTap: (){
          setState(()  {
            if((shareLocal.getString(PreferencesKey.TOKEN)) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null){
              SaveBookBloc.of(context).add(SaveBookSubmitted(id: widget.data.book!.Id.toString(), data: widget.data));
              widget.isSave = !widget.isSave;
            }else{
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return WidgetDialog(
                      title: MESSAGES.NOTIFICATION,
                      content: "Bạn cần đăng nhập !!",
                      onTap1: () {
                        setState((){
                          Get.back();
                        });
                      }
                  );
                },
              );
            }
          });
        },
        child: SvgPicture.asset('assets/icons/save_quote2.svg',color: COLORS.WHITE,)
        )
        : GestureDetector(
        onTap: (){
          setState(()  {
            if((shareLocal.getString(PreferencesKey.TOKEN)) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null){
              UnsaveBookBloc.of(context).add(UnsaveBookSubmitted(id: widget.data.book!.Id.toString(), data: widget.data));
              widget.isSave = !widget.isSave;
            }else{
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return WidgetDialog(
                      title: MESSAGES.NOTIFICATION,
                      content: "Bạn cần đăng nhập !!",
                      onTap1: () {
                        setState((){
                          Get.back();
                        });
                      }
                  );
                },
              );
            }
          });
        },
        child: SvgPicture.asset('assets/icons/save_quote.svg'));
  }
}
