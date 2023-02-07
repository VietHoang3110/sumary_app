import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sumary_app/bloc/list_categories/list_categories_bloc.dart';
import 'package:sumary_app/bloc/unread_notifi/unread_notifi_bloc.dart';
import 'package:sumary_app/screens/menu/home/dialogCategory.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_button_category.dart';
import 'package:sumary_app/widgets/widget_text.dart';
import '../../../bloc/Filter_product_2/filter_product_2_bloc.dart';
import '../../../bloc/list_categories/fitlter_category_bloc.dart';
import '../../../src/spacing.dart';
import '../../../storages/share_local.dart';
import '../../topHeader_2.dart';

class NewsScreen extends StatefulWidget {
  final bool? isBack;

  const NewsScreen({Key? key, this.isBack}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // late List<DataCategory> listCategory1;
  // late List<DataCategory> listCategory2;
  // late List<DataCategory> listCategory3;

  List<String> menu = [
    "Phổ biến",
    "Bán chạy",
    "Được xem nhiều",
    "Được xem nhiều nhất",
  ];

  int indexCategory1 = -1;
  int indexCategory2 = -1;
  int indexCategory3 = -1;
  int indexmenu = 0;

  String type = 'PAPER_BOOK';
  String sortBy = 'VIEW';
  String category = '';
  List<String> data = [];

  late int page = 1;

  @override
  void initState() {
    FilterProduct2Bloc.of(context).add(InitFilterProduct2Event());
    GetListCategoriesBloc.of(context).add(InitGetListCategoriesEvent());
    CategorySelectBloc.of(context).add(InitCategorySelectEvent());
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    setState(() {
      indexCategory1 = -1;
      indexCategory2 = -1;
      indexCategory3 = -1;
      indexmenu = 0;
      //  UnreadNotifiBloc.of(context).add(InitGetUnreadNotifiEvent());
      GetListCategoriesBloc.of(context).add(InitGetListCategoriesEvent());
      CategorySelectBloc.of(context).add(InitCategorySelectEvent());
      FilterProduct2Bloc.of(context).add(InitFilterProduct2Event());
    });
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.WHITE,
      body: Container(
        padding: EdgeInsets.only(top: 16+Spacing.viewPadding.top),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child:  Column(
          children: [
            const topHeader2(),
            AppValue.vSpace(12),
            const widget_seach(),
            AppValue.vSpace(10),
            Expanded(
              child: _renderContent(),
            )
          ],
        ),
      ),
    );
  }
  Widget _renderContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _renderHeader(),
          AppValue.vSpaceTiny,
          BlocBuilder<CategorySelectBloc, CategorySelectState>(
              builder: (context, state) {
            if (state is UpdateCategorySelectState) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      state.data.length,
                      (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                indexmenu = index;
                                category = state.data[index].id!;
                              });
                              FilterProduct2Bloc.of(context)
                                  .add(FilterProduct2Submitted(data, category));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 5),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1, color: COLORS.GREY_E7))),
                              child: WidgetText(
                                title: state.data[index].name,
                                style: AppStyle.DEFAULT_16.copyWith(
                                    fontWeight: index == indexmenu
                                        ? FontWeight.w600
                                        : FontWeight.w400),
                              ),
                            ),
                          )),
                ),
              );
            } else {
              return Container();
            }
          }),
          BlocBuilder<FilterProduct2Bloc, FilterProduct2State>(
            builder: (context, state) {
              if (state is SuccessFilterProduct2State &&
                  (indexCategory1 != -1 &&
                      indexCategory2 != -1 &&
                      indexCategory3 != -1)) {
                return state.data.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.only(
                            top: 8, left: 16, right: 16),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.data.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  // crossAxisSpacing: 10.0,
                                  // mainAxisSpacing: 10.0,
                                  // childAspectRatio: 1.8,
                                  mainAxisExtent: 255),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                print(
                                    'tokennn: ${(shareLocal.getString(PreferencesKey.TOKEN) == "")}');
                                AppNavigator.navigateBookDetailMain(
                                    state.data[index].id!);
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: COLORS.WHITE,
                                ),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: SizedBox(
                                            width: Get.width / 2 - 36,
                                            height: 220,
                                            child: Image.network(
                                              state.data[index].images![0],
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        (daysBetween(DateTime.parse(state.data[index].updatedAt.toString()), DateTime.now()) <=7) ? Positioned(
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
                                    SizedBox(
                                      width: Get.width / 2 - 36,
                                      child: WidgetText(
                                        title: state.data[index].name ?? "",
                                        style: AppStyle.DEFAULT_16.copyWith(
                                            fontWeight: FontWeight.w500),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Column(
                          children: const [
                            WidgetContainerImage(
                              image: 'assets/images/no_item.png',
                              width: 146,
                              height: 146,
                              fit: BoxFit.contain,
                            ),
                            Text('Hiện chưa có sách'),
                          ],
                        ),
                      );
              } else {
                return Center(
                  child: Column(
                    children: [
                      const WidgetContainerImage(
                        image: 'assets/images/no_item.png',
                        width: 146,
                        height: 146,
                        fit: BoxFit.contain,
                      ),
                      WidgetText(
                        title: MESSAGES.PICK_3_CATEGORY_SEARCH,
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _renderHeader() {
    return Container(
      width: Get.width,
      height: Get.height *0.25,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/img_home.png"),
          fit: BoxFit.fill,
        ),
        // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: WidgetText(
                    title: MESSAGES.PICK_3_CATEGORY,
                    style: AppStyle.DEFAULT_18.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
                AppValue.vSpaceTiny,
                BlocBuilder<GetListCategoriesBloc, ListCategotiesState>(
                    builder: (context, state) {
                      if (state is UpdateGetListCategotiesState) {
                        final listCategory1 = state.dataCategory[0];
                        final listCategory2 = state.dataCategory[1];
                        final listCategory3 = state.dataCategory[2];
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Row(
                                  children: List.generate(
                                      listCategory1.length,
                                          (index) => (listCategory1[index].parent ==
                                          null) ? Padding(
                                        padding:
                                        const EdgeInsets.only(left: 16),
                                        child: WidgetButtonCategory(
                                          image: 'assets/icons/open-book.png',
                                          title:
                                          listCategory1[index].name ?? "",
                                          index: index,
                                          select: indexCategory1,
                                          onHold: (){
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) => dialogCategory(childCategory: listCategory1[index].childs,)
                                            );
                                          },
                                          onClick: () {
                                            if (data.length >= 3) {
                                              data.removeAt(0);
                                              data.insert(0,
                                                  listCategory1[index].id!);
                                            } else {
                                              data.add(
                                                  listCategory1[index].id!);
                                            }
                                            setState(() {
                                              indexmenu = 0;
                                              indexCategory1 = index;
                                              category = '';
                                            });
                                            FilterProduct2Bloc.of(context)
                                                .add(FilterProduct2Submitted(
                                                data, category));
                                          },
                                        ),
                                      )
                                          : Container()),
                                ),
                              ),
                              AppValue.vSpaceTiny,
                              GestureDetector(
                                child: Row(
                                  children: List.generate(
                                      listCategory2.length,
                                          (index) => (listCategory2[index].parent ==
                                          null)
                                          ? Padding(
                                        padding:
                                        const EdgeInsets.only(left: 16),
                                        child: WidgetButtonCategory(
                                          image: 'assets/icons/open-book.png',
                                          title:
                                          listCategory2[index].name ?? "",
                                          index: index,
                                          select: indexCategory2,
                                          onHold: (){
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) => dialogCategory(childCategory: listCategory2[index].childs,)
                                            );
                                          },
                                          onClick: () {
                                            if (data.length >= 3) {
                                              data.removeAt(2);
                                              data.insert(1,
                                                  listCategory2[index].id!);
                                            } else {
                                              data.add(
                                                  listCategory2[index].id!);
                                            }
                                            setState(() {
                                              indexmenu = 0;
                                              indexCategory2 = index;
                                              category = '';
                                            });
                                            FilterProduct2Bloc.of(context)
                                                .add(FilterProduct2Submitted(
                                                data, category));
                                          },
                                        ),
                                      )
                                          : Container()),
                                ),
                              ),
                              AppValue.vSpaceTiny,
                              GestureDetector(
                                child: Row(
                                  children: List.generate(
                                      listCategory3.length,
                                          (index) => (listCategory3[index].parent ==
                                          null)
                                          ? Padding(
                                        padding:
                                        const EdgeInsets.only(left: 16),
                                        child: WidgetButtonCategory(
                                          image: 'assets/icons/open-book.png',
                                          title:
                                          listCategory3[index].name ?? "",
                                          index: index,
                                          select: indexCategory3,
                                          onHold: (){
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) => dialogCategory(childCategory: listCategory3[index].childs,)
                                            );
                                          },
                                          onClick: () {
                                            if (data.length >= 3) {
                                              data.removeLast();
                                              data.insert(2,
                                                  listCategory3[index].id!);
                                            } else {
                                              data.add(
                                                  listCategory3[index].id!);
                                            }
                                            setState(() {
                                              indexmenu = 0;
                                              indexCategory3 = index;
                                              category = '';
                                            });
                                            FilterProduct2Bloc.of(context)
                                                .add(FilterProduct2Submitted(
                                                data, category));
                                          },
                                        ),
                                      )
                                          : Container()),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (state is InitGetListCategotiesState) {
                        return Container();
                      } else {
                        return const Center(
                          child: Text("Lỗi kết nối !"),
                        );
                      }
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}


