import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sumary_app/bloc/list_book_bought/list_book_bought_bloc.dart';
import 'package:sumary_app/bloc/my_armorial/my_armorial_bloc.dart';
import 'package:sumary_app/bloc/unread_notifi/unread_notifi_bloc.dart';
import 'package:sumary_app/screens/menu/library/widget/index.dart';
import '../../../bloc/list_book_save/list_book_save_bloc.dart';
import '../../../src/spacing.dart';
import '../../../src/src_index.dart';
import '../../../storages/share_local.dart';
import '../../../widgets/widgets.dart';
import '../../topHeader.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {


  @override
  void initState() {
    ListBookBoughtBloc.of(context).add(InitGetListBookBoughtEvent('john cena', 1, 10));
    ListBookSaveBloc.of(context).add(InitGetListBookSaveEvent('john cena',1,10));
    if(shareLocal.getString(PreferencesKey.TOKEN) != ''){
      MyArmorialBloc.of(context).add(InitGetMyArmorialEvent());
    }
    super.initState();
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    if(shareLocal.getString(PreferencesKey.TOKEN) != ''){
      UnreadNotifiBloc.of(context).add(InitGetUnreadNotifiEvent());
      ListBookBoughtBloc.of(context).add(InitGetListBookBoughtEvent('john cena', 1, 10));
      ListBookSaveBloc.of(context).add(InitGetListBookSaveEvent('john cena',1,10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: COLORS.WHITE,
        body: SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: Column(
            children: [
              _renderHeader(),
              SingleChildScrollView(
                child: Container(
                  height: 40,
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
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      overlayColor: MaterialStateColor.resolveWith((states) => Colors.white),
                      labelColor: HexColor('#EE4D2C'),
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#EE4D2C')
                      ),
                      // indicatorColor: HexColor('#EE4D2C'),
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                            color: HexColor('#EE4D2C'), width: 1.0),
                        insets: const EdgeInsets.symmetric(horizontal: 15),
                      ),
                      tabs: [
                        Container(
                            width: AppValue.widths*0.5,
                            decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: 1,color: COLORS.GREY_400),
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Sách đã mua'),
                                BlocBuilder<ListBookBoughtBloc, ListBookBoughtState>(
                                  builder: (context, state) {
                                    if(state is UpdateGetListBookBoughtState){
                                      return Text(' (${state.listBookBought.length})');
                                    }else{
                                      return Container();
                                    }
                                  },
                                ),
                              ],
                            )
                        ),
                        Container(
                            width: AppValue.widths*0.5,
                            decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: 1,color: COLORS.GREY_400),
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Sách đã lưu'),
                                BlocBuilder<ListBookSaveBloc, ListBookSaveState>(
                                  builder: (context, state) {
                                    if(state is UpdateGetListBookSaveState){
                                      return Text(' (${state.listBookSave.length})');
                                    }else{
                                      return Container();
                                    }
                                  },
                                ),
                              ],
                            )
                        ),
                      ]
                  ),
                ),
              ),
              const Expanded(
                  child: TabBarView(
                    children: [
                      widgetBookBought(),
                      widgetBookSaved()
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
  _renderHeader() {
    return (Container(
      width: Get.width,
      height: Get.height / 2.7+Spacing.viewPadding.top,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/advise.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(right: 16,top: 16+Spacing.viewPadding.top,left: 5),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.9),
                    Color.fromRGBO(0, 0, 0, 0)
                  ],
                )),
            child: const topHeader(),
          ),
          BlocBuilder<MyArmorialBloc, MyArmorialState>(
            builder: (context, state) {
              if(state is UpdateGetMyArmorialState){
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      SizedBox(
                          width: AppValue.widths*0.95,
                          child: Image.asset('assets/images/img_labrary.png',fit: BoxFit.fill,)),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            AppValue.vSpace(5),
                            Row(
                              children: [
                                WidgetText(
                                  title: 'Danh hiệu',
                                  style: AppStyle.DEFAULT_14.copyWith(
                                      color: COLORS.WHITE
                                  ),
                                ),
                                const Spacer(),
                                WidgetText(
                                  title: 'Tên thành viên',
                                  style: AppStyle.DEFAULT_14.copyWith(
                                      color: COLORS.WHITE
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: WidgetText(
                                    title: "${state.data.name}",
                                    style: AppStyle.DEFAULT_20.copyWith(
                                        color: COLORS.WHITE,
                                        fontWeight: FontWeight.w700
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                WidgetText(
                                  title: state.data.username,
                                  style: AppStyle.DEFAULT_16.copyWith(
                                      color: COLORS.WHITE,
                                      fontWeight: FontWeight.w500
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            AppValue.vSpaceSmall,
                            StepProgressIndicator(
                              totalSteps: state.data.myBookRequireForUpAppellation!,
                              currentStep: state.data.myBook!,
                              size: 3,
                              padding: 0,
                              roundedEdges: const Radius.circular(15),
                              selectedGradientColor: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [HexColor('#925B00'), HexColor('#925B00')],
                              ),
                              unselectedGradientColor: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.white, Colors.white],
                              ),
                            ),
                            AppValue.vSpaceSmall,
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: ()=> AppNavigator.navigateArmorialPage(),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset('assets/icons/i.svg',height: 12,width: 12,fit: BoxFit.fill,),
                                      AppValue.hSpaceTiny,
                                      WidgetText(
                                        title: '“Đọc Tâm sách - Thưởng Bookcoin!”',
                                        style: AppStyle.DEFAULT_12.copyWith(
                                          color: COLORS.WHITE,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                WidgetText(
                                  title: '${state.data.myBook}/${state.data.myBookRequireForUpAppellation}',
                                  style: AppStyle.DEFAULT_14.copyWith(
                                    color: COLORS.WHITE,
                                  ),
                                ),
                              ],
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
        ],
      ),
    )
    );
  }
}