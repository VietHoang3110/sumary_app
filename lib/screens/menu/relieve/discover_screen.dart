import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sumary_app/bloc/list_book_recommend/list_book_recommend_bloc.dart';
import 'package:sumary_app/screens/menu/relieve/widget_banner.dart';
import 'package:sumary_app/screens/topHeader_2.dart';
import 'package:sumary_app/storages/share_local.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../../bloc/list_book_top_view/list_book_top_view_bloc.dart';
import '../../../bloc/list_product_by_categories/list_product_by_categories_bloc.dart';
import '../../../src/spacing.dart';
import '../../../src/src_index.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;
  bool hide = true;
  bool isLogin = false;

  @override
  void initState() {
    if(shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null){
      isLogin = true;
    }
    scrollController.addListener(() { //scroll listener
      double showoffset = 10.0; //Back to top botton will show on scroll offset 10.0
      if(scrollController.offset > showoffset){
        showbtn = true;
        setState(() {
          //update state
        });
      }else{
        showbtn = false;
        setState(() {
          //update state
        });
      }
    });
    GetListProductByCategoriesBloc.of(context).add(InitGetListProductByCategoriesEvent('','','',1,6));
    ListBookTopViewBloc.of(context).add(InitGetListBookTopViewEvent());
    if(isLogin){
      ListBookRecommendBloc.of(context).add(InitGetListBookRecommendEvent());
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.BACKGROUND,
      floatingActionButton: SizedBox(
        height: 35,
        width: 35,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 1000),  //show/hide animation
          opacity: showbtn ?1.0 : 0.0, //set obacity to 1 on visible, or hide
          child: FloatingActionButton(
            onPressed: () {
              scrollController.animateTo( //go to top of scroll
                  0,  //scroll offset to go
                  duration: const Duration(milliseconds: 500), //duration of scroll
                  curve:Curves.fastOutSlowIn //scroll type
              );
            },
            child: const Icon(Icons.arrow_upward_outlined),
            backgroundColor: COLORS.PRIMARY_COLOR,
          ),
        ),
      ),
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
          Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    WidgetBanner(),
                    AppValue.vSpace(28),
                    Row(
                      children: [
                        AppValue.hSpaceSmall,
                        SvgPicture.asset('assets/icons/book_discover.svg'),
                        AppValue.hSpaceTiny,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WidgetText(
                                title: 'Lối Tắt',
                                style: AppStyle.DEFAULT_18.copyWith(
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              Container(
                                height: 1,
                                width: Get.width,
                                color: COLORS.BLACK,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    AppValue.vSpaceSmall,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isLogin ? buildButtonDIscover(
                            click: () {
                              scrollController.animateTo(250,
                                  duration: const Duration(milliseconds: 500), //duration of scroll
                                  curve:Curves.fastOutSlowIn //scroll type
                              );
                            },
                            image: 'assets/icons/dexuat.svg',
                            title: 'Đề Xuất',
                          ) :  Container(),
                          buildButtonDIscover(
                            click: () {
                              scrollController.animateTo(isLogin ? 600 : 250,
                                  duration: const Duration(milliseconds: 500), //duration of scroll
                                  curve:Curves.fastOutSlowIn //scroll type
                              );
                            },
                            image: 'assets/icons/noibat.svg',
                            title: 'Nổi Bật',
                          ),
                          buildButtonDIscover(
                            click: () {
                              scrollController.animateTo(isLogin ? 900 : 600,
                                  duration: const Duration(milliseconds: 500), //duration of scroll
                                  curve:Curves.fastOutSlowIn //scroll type
                              );
                            },
                            image: 'assets/icons/moinhat.svg',
                            title: 'Mới Nhất',
                          ),
                          buildButtonDIscover(
                            click: () {
                              scrollController.animateTo(isLogin ? 1200 : 900,
                                  duration: const Duration(milliseconds: 500), //duration of scroll
                                  curve:Curves.fastOutSlowIn //scroll type
                              );
                            },
                            image: 'assets/icons/sapramat.svg',
                            title: 'Sắp Ra Mắt',
                          ),
                          // buildButtonDIscover(
                          //   click: () {  },
                          //   image: 'assets/icons/bangxephang.svg',
                          //   title: 'Bảng Xếp Hạng',
                          // ),
                          buildButtonDIscover(
                            click: () {
                              scrollController.animateTo(isLogin ? 1500 : 1200,
                                  duration: const Duration(milliseconds: 500), //duration of scroll
                                  curve:Curves.fastOutSlowIn //scroll type
                              );
                            },
                            image: 'assets/icons/banchaynhat.svg',
                            title: 'Bán Chạy nhất',
                          ),
                          buildButtonDIscover(
                            click: () {
                              scrollController.animateTo(scrollController.position.maxScrollExtent-30,
                                duration: const Duration(milliseconds: 500), //duration of scroll
                                curve:Curves.fastOutSlowIn //scroll type
                            );},
                            image: 'assets/icons/tatca.svg',
                            title: 'Tất Cả',
                          )
                        ],
                      ),
                    ),
                    AppValue.vSpace(30),
                    isLogin ? Stack(
                      children: [
                        Image.asset('assets/images/anhtabnoibat.png',width: AppValue.widths,fit: BoxFit.fill),
                        Column(
                          children: [
                            buildTitle(icon: 'assets/icons/icondexuat.svg', title: 'TÂM SÁCH ĐỀ XUẤT CHO BẠN HÔM NAY',),
                            AppValue.vSpaceSmall,
                            BlocBuilder<ListBookRecommendBloc, ListBookRecommendState>(
                              builder: (context, state) {
                                if(state is UpdateGetListBookRecommendState){
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(state.data.length, (index) =>
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: SizedBox(
                                                height: 160,
                                                child: GestureDetector(
                                                  onTap: (){
                                                    AppNavigator.navigateBookDetailMain(state.data[index].id!);
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(10),
                                                        child: Image.network(state.data[index].images![0],
                                                          fit: BoxFit.fill,
                                                        )
                                                      ),
                                                      (daysBetween(DateTime.parse(state.data[index].updatedAt.toString()), DateTime.now()) <= 7) ? Positioned(
                                                        bottom: -8,
                                                        right: -3,
                                                        child: SizedBox(
                                                            height: 55,
                                                            child: Lottie.asset(
                                                              'assets/lottie/new-tag.json',
                                                            )
                                                        ),
                                                      ) :  Container()
                                                    ],
                                                  ),
                                                )
                                            ),
                                          ),
                                      ),
                                    ),
                                  );
                                }
                                else{return Container();}
                              },
                            )
                          ],
                        )
                      ],
                    ) : Container(),
                    isLogin ? AppValue.vSpace(40) : Container(),
                    Stack(
                      children: [
                        Image.asset('assets/images/anhtabnoibat.png',width: AppValue.widths,fit: BoxFit.fill),
                        Column(
                          children: [
                            buildTitle(icon: 'assets/icons/iconnoibat.svg', title: 'TÂM SÁCH NỔI BẬT',),
                            AppValue.vSpaceSmall,
                            BlocBuilder<ListBookTopViewBloc, ListBookTopViewState>(
                              builder: (context, state) {
                                if(state is UpdateGetListBookTopViewState){
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(state.data.length, (index) =>
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: GestureDetector(
                                              onTap:(){
                                                AppNavigator.navigateBookDetailMain(state.data[index].id!);
                                              },
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: SizedBox(
                                                        height: 160,
                                                        child: Image.network(state.data[index].images![0],
                                                          fit: BoxFit.fill,
                                                        )
                                                      // Image.asset('assets/Bìa Marketing cho người ngờ nghệch.png',
                                                      //   fit: BoxFit.contain,
                                                      // )
                                                    ),
                                                  ),
                                                  (daysBetween(DateTime.parse(state.data[index].updatedAt.toString()), DateTime.now()) <= 7) ? Positioned(
                                                    bottom: -8,
                                                    right: -3,
                                                    child: SizedBox(
                                                        height: 55,
                                                        child: Lottie.asset(
                                                          'assets/lottie/new-tag.json',
                                                        )
                                                    ),
                                                  ) :  Container()
                                                ],
                                              ),
                                            ),
                                          ),
                                      ),
                                    ),
                                  );
                                }
                                else{
                                  return Container();
                                }
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    AppValue.vSpace(40),
                    Stack(
                      children: [
                        Image.asset('assets/images/anhtabnoibat.png',width: AppValue.widths,fit: BoxFit.fill),
                        Column(
                          children: [
                            buildTitle(icon: 'assets/icons/iconmoinhat.svg', title: 'TÂM SÁCH MỚI NHẤT',),
                            AppValue.vSpaceSmall,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(10, (index) =>
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                            height: 160,
                                            child: Image.asset('assets/Bìa Nguyên lý Marketing.png',
                                              fit: BoxFit.contain,
                                            )
                                        ),
                                      ),
                                    ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    AppValue.vSpace(40),
                    Stack(
                      children: [
                        Image.asset('assets/images/anhtabnoibat.png',width: AppValue.widths,fit: BoxFit.fill,),
                        Column(
                          children: [
                            buildTitle(icon: 'assets/icons/iconsapramat.svg', title: 'TÂM SÁCH SẮP RA MẮT',),
                            AppValue.vSpaceSmall,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(10, (index) =>
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                            height: 160,
                                            child: Image.asset('assets/Bìa Nguyên lý Marketing.png',
                                              fit: BoxFit.contain,
                                            )
                                        ),
                                      ),
                                    ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                    AppValue.vSpace(40),
                    Stack(
                      children: [
                        Image.asset('assets/images/anhtabnoibat.png',width: AppValue.widths,fit: BoxFit.fill),
                        Column(
                          children: [
                            buildTitle(icon: 'assets/icons/iconbanchay.svg', title: 'TÂM SÁCH BÁN CHẠY NHẤT CỦA TIỀM NĂNG MASTER',),
                            AppValue.vSpaceSmall,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(10, (index) =>
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                            height: 160,
                                            child: Image.asset('assets/Bìa Nguyên lý Marketing.png',
                                              fit: BoxFit.contain,
                                            )
                                        ),
                                      ),
                                    ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    AppValue.vSpace(40),
                    WidgetText(
                      title: 'TẤT CẢ TÂM SÁCH',
                      style: AppStyle.DEFAULT_24.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 25
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(height: 2, width: AppValue.widths,color: COLORS.PRIMARY_COLOR,),
                    BlocBuilder<GetListProductByCategoriesBloc, ListProductByCategoriesState>(
                      builder: (context, state) {
                        if(state is UpdateGetListProductByCategoriesState){
                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.data.length,
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisExtent: 255,
                            ),
                            itemBuilder: (BuildContext context, int index){
                              return GestureDetector(
                                onTap: (){
                                  AppNavigator.navigateBookDetailMain(state.data[index].id!);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: SizedBox(
                                                height: 160,
                                                child: Image.network(
                                                    state.data[index].images![0],
                                                    fit: BoxFit.contain
                                                )
                                            ),
                                          ),
                                          (daysBetween(DateTime.parse(state.data[index].updatedAt.toString()), DateTime.now()) <= 7) ? Positioned(
                                            bottom: -8,
                                            right: -3,
                                            child: SizedBox(
                                              height: 55,
                                              child: Lottie.asset(
                                              'assets/lottie/new-tag.json',
                                            )
                                            ),
                                          ) :  Container()
                                        ],
                                      ),
                                      WidgetText(
                                        title: state.data[index].name,
                                        style: AppStyle.DEFAULT_16.copyWith(
                                            fontWeight: FontWeight.w500
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      WidgetText(
                                        title: 'Ngày Phát Hành',
                                        style: AppStyle.DEFAULT_16.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      WidgetText(
                                        title: AppValue.formatStringOnlyDate(state.data[index].updatedAt.toString()),
                                        style: AppStyle.DEFAULT_16.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: COLORS.PRIMARY_COLOR
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        else{
                          return Container();
                        }
                      },
                    ),
                    hide ? GestureDetector(
                      onTap: (){
                        setState(() {
                          GetListProductByCategoriesBloc.of(context).add(InitGetListProductByCategoriesEvent('','','',0,0));
                          hide = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/iconall.png',height: 41,width: 41,fit: BoxFit.fill,),
                          AppValue.hSpaceTiny,
                          WidgetText(
                            title: 'XEM TẤT CẢ',
                            style: AppStyle.DEFAULT_16.copyWith(
                              fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    ) : GestureDetector(
                      onTap: (){
                        setState(() {
                          GetListProductByCategoriesBloc.of(context).add(InitGetListProductByCategoriesEvent('','','',1,6));
                          hide = true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/iconall.png',height: 41,width: 41,fit: BoxFit.fill,),
                          AppValue.hSpaceTiny,
                          WidgetText(
                            title: 'Thu gọn',
                            style: AppStyle.DEFAULT_16.copyWith(
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    ),
                    AppValue.vSpaceSmall
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}

class buildTitle extends StatelessWidget {
  String icon;
  String title;
  Widget? expand;
  buildTitle({
    required this.icon,
    required this.title,
    this.expand,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/images/title.svg',width: AppValue.widths,fit: BoxFit.contain,),
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/dautitle.png'),
                Row(
                  children: [
                    SvgPicture.asset(icon),
                    AppValue.hSpaceTiny
                  ],
                )
              ],
            ),
            AppValue.hSpace(4),
            SizedBox(
              width: (expand == null) ? AppValue.widths*0.8 : AppValue.widths*0.5,
              child: WidgetText(
                title: title,
                style: AppStyle.DEFAULT_18.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: COLORS.WHITE
                ),
              ),
            ),
            const Spacer(),
            expand ?? Container()
          ],
        )
      ],
    );
  }
}

class buildButtonDIscover extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback click;
  const buildButtonDIscover({
    Key? key,
    required this.image,
    required this.title,
    required this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: click,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: AppValue.widths*0.16,
                child: SvgPicture.asset(image)),
            AppValue.vSpace(5),
            SizedBox(
              width: AppValue.widths*0.17,
              child: WidgetText(
                title: title,
                style: AppStyle.DEFAULT_16.copyWith(
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
