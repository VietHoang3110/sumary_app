import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:sumary_app/bloc/Filter_product/filter_product_bloc.dart';
import 'package:sumary_app/bloc/filter_Apophthgan/filter_Apophthgan_bloc.dart';
import 'package:sumary_app/bloc/mood_and_reason/mood_and_reason_bloc.dart';
import 'package:sumary_app/bloc/unread_notifi/unread_notifi_bloc.dart';
import 'package:sumary_app/src/models/model_generator/mood_reason.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_button_category.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../../bloc/Filter_product_1/filter_product_1_bloc.dart';
import '../../../bloc/list_categories/list_categories_bloc.dart';
import '../../../bloc/list_product_by_categories/list_product_by_categories_bloc.dart';
import '../../../src/models/model_generator/list_category.dart';
import '../../../src/spacing.dart';
import '../../topHeader.dart';

class RelieveScreen extends StatefulWidget {
  final bool? isBack;

  const RelieveScreen({Key? key, this.isBack}) : super(key: key);

  @override
  _RelieveScreenState createState() => _RelieveScreenState();
}

class _RelieveScreenState extends State<RelieveScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  String type = 'PAPER_BOOK';
  String category = "";
  String sortBy = 'VIEW';
  List<String> data = [];
  String mood= '';
  String reason = '';


  @override
  void initState() {
    FilterProduct1Bloc.of(context).add(InitFilterProduct1Event());
    MoodAndReasonBloc.of(context).add(InitMoodAndReasonEvent());
    super.initState();
  }

  int indexCategory1 = -1;
  int indexCategory2 = -1;

  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  _onRefresh() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    setState((){
      indexCategory1 = -1;
      indexCategory2 = -1;
      UnreadNotifiBloc.of(context).add(InitGetUnreadNotifiEvent());
      MoodAndReasonBloc.of(context).add(InitMoodAndReasonEvent());
    });
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.WHITE,
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: Column(
          children: [
            _renderHeader(),
            Expanded(
                child: Container(
                  margin:const EdgeInsets.only(top: 11),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [ _renderApophthgan(), _renderBook() ],
                    ),
                  )))
          ],
        ),
      ),
    );
  }

  Widget _renderHeader() {
    return Container(
      width: Get.width,
      height: Get.height / 2.5+Spacing.viewPadding.top,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/img_home.png"),
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
            child: topHeader(),
          ),
        BlocBuilder<MoodAndReasonBloc,MoodAndReasonState>(
          builder: (context,state) {
          if (state is UpdateMoodAndReasonState) {
            final listCategory1 = state.dataMoodAndReason[0];
            final listCategory2 = state.dataMoodAndReason[1];
            return Container(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: WidgetText(
                      title: 'Tâm trạng hiện tại',
                      style: AppStyle.DEFAULT_16.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  AppValue.vSpaceTiny,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: GestureDetector(
                      child: Row(
                        children: List.generate(
                            listCategory1.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: WidgetMoodCategory(
                              image: listCategory1[index].iconPath,
                              title: listCategory1[index].name,
                              index: index,
                              select: indexCategory1,
                              onClick: (){
                                if(data.length >= 2){
                                  data.removeAt(0);
                                  data.insert(0,listCategory1[index].id);
                                }else {
                                  data.add(listCategory1[index].id);
                                }
                                FilterProduct1Bloc.of(context).add(FilterProduct1Submitted(data,category));
                                mood = listCategory1[index].id;
                                FilterApophthganBloc.of(context).add(InitFilterApophthganEvent(mood,reason));
                                  setState(() {
                                    indexCategory1=index;
                                  });
                              },
                            ),
                                )),
                      ),
                    ),
                  ),
                  AppValue.vSpaceSmall,
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: WidgetText(
                      title: 'Căn nguyên',
                      style: AppStyle.DEFAULT_16.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  AppValue.vSpaceTiny,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: GestureDetector(
                      child: Row(
                        children: List.generate(
                            listCategory2.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: WidgetMoodCategory(
                              image: listCategory2[index].iconPath,
                              title: listCategory2[index].name??'',
                              index: index,
                              select: indexCategory2,
                              onClick: (){
                                // filter book
                                if(data.length >= 2){
                                  data.removeLast();
                                  data.insert(1,listCategory2[index].id);
                                }else {
                                  data.add(listCategory2[index].id);
                                }
                                FilterProduct1Bloc.of(context).add(FilterProduct1Submitted(data,category));
                                reason = listCategory2[index].id;
                                // filter Ảnh
                                FilterApophthganBloc.of(context).add(InitFilterApophthganEvent(mood,reason));
                                  setState(() {
                                    indexCategory2=index;
                                  });
                              },
                            ),
                                )),
                      ),
                    ),
                  ),
                  AppValue.vSpace(20)
                ],
              ),
            );
          }
            else if(state is InitGetListCategotiesState){
            return Container();
          }
          else {
            return const Center(
              child: Text("Lỗi kết nối !"),
          );
          }
        }
        )
        ],
      ),
    );
  }



  _renderApophthgan(){
    return BlocBuilder<FilterApophthganBloc,FilterApophthganState>(
        builder: (context,state) {
          if (state is UpdateFilterApophthganState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppValue.vSpaceTiny,
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: WidgetText(
                    title: 'Danh ngôn',
                    style: AppStyle.DEFAULT_16.copyWith(
                        fontWeight: FontWeight.w600
                    ),),
                ),
                (indexCategory1!=-1 &&  indexCategory2!=-1)?
                Container(
                    height: Get.height*0.35,
                    width: Get.width,
                    margin:const EdgeInsets.only(top: 10),
                    child: state.data.isNotEmpty ? Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return WidgetContainerImageNetWork(
                          image: state.data[index].pathImage,
                          height: Get.height*0.35,
                          width: Get.width-50,
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: state.data.length,
                      viewportFraction: 0.6,
                      scale: 0.7,
                    ) : Center(child: Column(
                      children: const [
                        WidgetContainerImage(
                          image: 'assets/images/no_item.png',
                          width: 146,
                          height: 146,
                          fit: BoxFit.contain,
                        ),
                        Text('Hiện chưa có danh ngôn'),
                      ],
                    ),)
                ) :Center(
                      child: Column(
                        children: [
                          const WidgetContainerImage(
                            image: 'assets/images/no_item.png',
                            width: 146,
                            height: 146,
                            fit: BoxFit.contain,
                          ),
                          WidgetText(
                            title: 'Lựa chọn tâm trạng để thể hiện cảm xúc',
                          ),
                        ],
                      ),
                ),
                AppValue.vSpaceSmall,
              ],);
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppValue.vSpaceTiny,
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: WidgetText(
                    title: 'Danh ngôn',
                    style: AppStyle.DEFAULT_16.copyWith(
                        fontWeight: FontWeight.w600
                    ),),
                ),
                Center(
                  child: Column(
                    children: [
                      const WidgetContainerImage(
                        image: 'assets/images/no_item.png',
                        width: 146,
                        height: 146,
                        fit: BoxFit.contain,
                      ),
                      WidgetText(
                        title: 'Lựa chọn tâm trạng để thể hiện cảm xúc',
                      ),
                    ],
                  ),
                ),
              ],);
          }
        }
    );
  }

  _renderBook(){
    return BlocBuilder<FilterProduct1Bloc,FilterProduct1State>(
        builder: (context,state) {
      if (state is SuccessFilterProduct1State) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: WidgetText(
                title: 'Tựa sách nên đọc',
                style: AppStyle.DEFAULT_16.copyWith(
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            (indexCategory1!=-1 &&  indexCategory2!=-1)? Container(
                height: Get.height*0.4,
                width: Get.width,
                margin:const EdgeInsets.only(top: 10),
                child: state.data.isNotEmpty ? Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        AppNavigator.navigateBookDetailMain(state.data[index].id!);
                      },
                      child: WidgetContainerImageNetWork(
                        height: Get.height*0.4,
                        width: Get.width-50,
                        image: state.data[index].images![0],
                        borderRadius: BorderRadius.circular(10),
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  itemCount: state.data.length,
                  viewportFraction: 0.6,
                  scale: 0.6,
                )
                    :  Center(
                  child: Column(
                    children: [
                      const WidgetContainerImage(
                        image: 'assets/images/no_item.png',
                        width: 146,
                        height: 146,
                        fit: BoxFit.contain,
                      ),
                      WidgetText(
                        title: 'Hiện chưa có sách',
                      ),
                    ],
                  ),
                ),
            ):Center(
              child: Column(
                children: [
                  const WidgetContainerImage(
                    image: 'assets/images/rafiki.png',
                    width: 146,
                    height: 146,
                    fit: BoxFit.contain,
                  ),
                  WidgetText(
                    title: 'Lựa chọn tâm trạng để thể hiện cảm xúc',
                  ),
                ],
              ),),
            AppValue.vSpaceTiny
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppValue.vSpaceSmall,
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: WidgetText(
                title: 'Tựa sách nên đọc',
                style: AppStyle.DEFAULT_16.copyWith(
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                   const WidgetContainerImage(
                    image: 'assets/images/rafiki.png',
                    width: 146,
                    height: 146,
                    fit: BoxFit.contain,
                  ),
                  WidgetText(
                    title: 'Lựa chọn tâm trạng để thể hiện cảm xúc',
                  ),
                ],
              ),),
            AppValue.vSpaceTiny
          ],);
      }
        }
    );
  }
}
