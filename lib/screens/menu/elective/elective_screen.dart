import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sumary_app/bloc/list_categories/fitlter_category_bloc.dart';
import 'package:sumary_app/bloc/unread_notifi/unread_notifi_bloc.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/storages/share_local.dart';
import 'package:sumary_app/widgets/widget_button_category.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../../bloc/Filter_product/filter_product_bloc.dart';
import '../../../bloc/list_categories/list_categories_bloc.dart';
import '../../../bloc/list_product_by_categories/list_product_by_categories_bloc.dart';
import '../../../src/spacing.dart';
import '../../topHeader.dart';

class ElectiveScreen extends StatefulWidget {
  final bool? isBack;

  const ElectiveScreen({Key? key, this.isBack}) : super(key: key);

  @override
  _ElectiveScreenState createState() => _ElectiveScreenState();
}

class _ElectiveScreenState extends State<ElectiveScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // List<String> menu = [
  //   "Phổ biến",
  //   "Bán chạy",
  //   "Được xem nhiều",
  //   "Được xem nhiều nhất",
  // ];
  // List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  //   'Item5',
  //   'Item6',
  //   'Item7',
  //   'Item8',
  // ];
  String? selectedValue;

  String category = '';

  @override
  void initState() {
    GetListCategoriesBloc.of(context).add(InitGetListCategoriesEvent());
    GetListProductByCategoriesBloc.of(context).add(InitGetListProductByCategoriesEvent('', '', '', 0, 0));
    CategorySelectBloc.of(context).add(InitCategorySelectEvent());
    FilterProductBloc.of(context).add(InitFilterProductEvent());
    super.initState();
  }

  String selectedValue1 = "";
  String selectedValue3 = "";
  List<String> selectedValueList = [];

  int indexCategory1 = -1;
  int indexCategory2 = -1;
  int indexCategory3 = -1;
  int indexmenu = -1;
  int index1 = -1;
  List<String> data = [];

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
      index1 = -1;
      GetListCategoriesBloc.of(context).add(InitGetListCategoriesEvent());
      //  UnreadNotifiBloc.of(context).add(InitGetUnreadNotifiEvent());
      GetListProductByCategoriesBloc.of(context).add(
          InitGetListProductByCategoriesEvent('', '', '', 0, 0));
      CategorySelectBloc.of(context).add(InitCategorySelectEvent());
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
          children: [_renderHeader(), Expanded(child: _renderContent())],
        ),
      ),
    );
  }

  Widget _renderHeader() {
    return Container(
      width: Get.width,
      height: Get.height / 2.5 + Spacing.viewPadding.top,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/img_home.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                right: 16, top: 16 + Spacing.viewPadding.top, left: 5),
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
          BlocBuilder<GetListCategoriesBloc, ListCategotiesState>(
              builder: (context, state) {
            if (state is UpdateGetListCategotiesState) {
              final listCategory1 = state.dataCategory[0];
              final listCategory2 = state.dataCategory[1];
              final listCategory3 = state.dataCategory[2];
              return Container(
                padding: const EdgeInsets.only(top: 16, bottom: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: WidgetText(
                            title: 'Chọn đề mục',
                            style: AppStyle.DEFAULT_18.copyWith(
                                color: COLORS.WHITE,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: InkWell(
                            onTap: () => AppNavigator.navigateSearch(),
                            child: Container(
                              width: AppValue.widths * 0.52,
                              height: 38,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: COLORS.WHITE,
                                  border:
                                      Border.all(width: 1, color: COLORS.WHITE),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    WidgetText(
                                      title: 'Nhập từ khóa',
                                      style: AppStyle.DEFAULT_14
                                          .copyWith(color: COLORS.GREY),
                                      overflow: TextOverflow.clip,
                                    ),
                                    AppValue.hSpaceTiny,
                                    const Icon(
                                      Icons.search,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppValue.vSpaceSmall,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Row(
                              children: List.generate(
                                  listCategory1.length,
                                  (index) => (listCategory1[index].parent ==
                                          null)
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: WidgetButtonCategory2(
                                            image: 'assets/icons/open-book.png',
                                            title: listCategory1[index]
                                                    .childs!
                                                    .isNotEmpty
                                                ? DropdownButtonHideUnderline(
                                                    child: DropdownButton2(
                                                      dropdownWidth:
                                                          AppValue.widths * 0.7,
                                                      buttonHeight: 20,
                                                      hint: WidgetText(
                                                        title:
                                                            listCategory1[index]
                                                                    .name ??
                                                                '',
                                                        style:
                                                            AppStyle.DEFAULT_16,
                                                      ),
                                                      items: listCategory1[
                                                              index]
                                                          .childs!
                                                          .map((item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value:
                                                                    item.name,
                                                                child: Text(
                                                                  item.name!,
                                                                  style: AppStyle
                                                                      .DEFAULT_16,
                                                                ),
                                                                onTap: () {
                                                                  if (data.length ==
                                                                      1) {
                                                                    data.removeAt(
                                                                        0);
                                                                    data.insert(
                                                                        0,
                                                                        item.id!);
                                                                  } else {
                                                                    data.add(item
                                                                        .id!);
                                                                  }
                                                                },
                                                              ))
                                                          .toList(),
                                                      // value: listCategory1[index].childs![index].name,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          indexCategory1 =
                                                              index;
                                                          indexCategory2 = -1;
                                                          indexCategory3 = -1;
                                                          indexmenu = 0;
                                                          category = '';
                                                          selectedValue1 =
                                                              value.toString();
                                                          FilterProductBloc.of(
                                                                  context)
                                                              .add(FilterProductSubmitted(
                                                                  data,
                                                                  category));
                                                        });
                                                      },
                                                    ),
                                                  )
                                                : WidgetText(
                                                    title: listCategory1[index]
                                                        .name,
                                                    style: AppStyle.DEFAULT_16
                                                        .copyWith(
                                                            color: index ==
                                                                    indexCategory1
                                                                ? COLORS.WHITE
                                                                : COLORS.BLACK),
                                                  ),
                                            index: index,
                                            select: indexCategory1,
                                            onClick: () {
                                              setState(() {
                                                if (data.length == 1) {
                                                  data.removeAt(0);
                                                  data.insert(0,
                                                      listCategory1[index].id!);
                                                } else {
                                                  data.add(
                                                      listCategory1[index].id!);
                                                }
                                                indexCategory2 = -1;
                                                indexCategory3 = -1;
                                                indexmenu = 0;
                                                category = '';
                                                indexCategory1 = index;
                                              });
                                              FilterProductBloc.of(context).add(
                                                  FilterProductSubmitted(
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
                                          child: WidgetButtonCategory2(
                                            image: 'assets/icons/open-book.png',
                                            title: listCategory2[index]
                                                    .childs!
                                                    .isNotEmpty
                                                ? DropdownButtonHideUnderline(
                                                    child: DropdownButton2(
                                                      dropdownWidth:
                                                          AppValue.widths * 0.7,
                                                      buttonHeight: 20,
                                                      hint: WidgetText(
                                                        title:
                                                            listCategory2[index]
                                                                    .name ??
                                                                '',
                                                        style:
                                                            AppStyle.DEFAULT_16,
                                                      ),
                                                      items: listCategory2[
                                                              index]
                                                          .childs!
                                                          .map((item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value:
                                                                    item.name,
                                                                child: Text(
                                                                  item.name!,
                                                                  style: AppStyle
                                                                      .DEFAULT_16,
                                                                ),
                                                                onTap: () {
                                                                  if (data.length ==
                                                                      1) {
                                                                    data.removeAt(
                                                                        0);
                                                                    data.insert(
                                                                        0,
                                                                        item.id!);
                                                                  } else {
                                                                    data.add(item
                                                                        .id!);
                                                                  }
                                                                },
                                                              ))
                                                          .toList(),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          indexCategory1 = -1;
                                                          indexCategory3 = -1;
                                                          indexCategory2 =
                                                              index;
                                                          selectedValue =
                                                              value.toString();
                                                          indexmenu = 0;
                                                          category = '';
                                                          FilterProductBloc.of(
                                                                  context)
                                                              .add(FilterProductSubmitted(
                                                                  data,
                                                                  category));
                                                        });
                                                      },
                                                    ),
                                                  )
                                                : WidgetText(
                                                    title: listCategory2[index]
                                                        .name,
                                                    style: AppStyle.DEFAULT_16
                                                        .copyWith(
                                                            color: index ==
                                                                    indexCategory2
                                                                ? COLORS.WHITE
                                                                : COLORS.BLACK),
                                                  ),
                                            index: index,
                                            select: indexCategory2,
                                            onClick: () {
                                              if (data.length == 1) {
                                                data.removeAt(0);
                                                data.insert(0,
                                                    listCategory2[index].id!);
                                              } else {
                                                data.add(
                                                    listCategory2[index].id!);
                                              }
                                              setState(() {
                                                indexCategory1 = -1;
                                                indexCategory3 = -1;
                                                indexmenu = 0;
                                                category = '';
                                                indexCategory2 = index;
                                              });
                                              FilterProductBloc.of(context).add(
                                                  FilterProductSubmitted(
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
                                          child: WidgetButtonCategory2(
                                            image: 'assets/icons/open-book.png',
                                            title: listCategory3[index]
                                                    .childs!
                                                    .isNotEmpty
                                                ? DropdownButtonHideUnderline(
                                                    child: DropdownButton2(
                                                      dropdownWidth:
                                                          AppValue.widths * 0.7,
                                                      buttonHeight: 20,
                                                      hint: WidgetText(
                                                        title:
                                                            listCategory3[index]
                                                                    .name ??
                                                                '',
                                                        style:
                                                            AppStyle.DEFAULT_16,
                                                      ),
                                                      items: List.generate(
                                                          listCategory3[index]
                                                              .childs!
                                                              .length,
                                                          (index12) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: listCategory3[
                                                                        index]
                                                                    .childs![
                                                                        index12]
                                                                    .name!,
                                                                child: Text(
                                                                    listCategory3[
                                                                            index]
                                                                        .childs![
                                                                            index12]
                                                                        .name!),
                                                                onTap: () {
                                                                  if (data.length ==
                                                                      1) {
                                                                    data.removeAt(
                                                                        0);
                                                                    data.insert(
                                                                        0,
                                                                        listCategory3[index]
                                                                            .childs![index12]
                                                                            .id!);
                                                                  } else {
                                                                    data.add(listCategory3[
                                                                            index]
                                                                        .childs![
                                                                            index12]
                                                                        .id!);
                                                                  }
                                                                },
                                                              )),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          indexCategory3 =
                                                              index;
                                                          indexCategory2 = -1;
                                                          indexCategory1 = -1;
                                                          selectedValue3 =
                                                              value.toString();
                                                          indexmenu = 0;
                                                          category = '';
                                                          FilterProductBloc.of(
                                                                  context)
                                                              .add(FilterProductSubmitted(
                                                                  data,
                                                                  category));
                                                        });
                                                      },
                                                    ),
                                                  )
                                                : WidgetText(
                                                    title: listCategory3[index]
                                                        .name,
                                                    style: AppStyle.DEFAULT_16
                                                        .copyWith(
                                                            color: index ==
                                                                    indexCategory3
                                                                ? COLORS.WHITE
                                                                : COLORS.BLACK),
                                                  ),
                                            index: index,
                                            select: indexCategory3,
                                            onClick: () {
                                              if (data.length == 1) {
                                                data.removeAt(0);
                                                data.insert(0,
                                                    listCategory3[index].id!);
                                              } else {
                                                data.add(
                                                    listCategory3[index].id!);
                                              }
                                              setState(() {
                                                indexCategory2 = -1;
                                                indexCategory1 = -1;
                                                indexmenu = 0;
                                                category = '';
                                                indexCategory3 = index;
                                              });
                                              FilterProductBloc.of(context).add(
                                                  FilterProductSubmitted(
                                                      data, category));
                                            },
                                          ),
                                        )
                                      : Container()),
                            ),
                          ),
                        ],
                      ),
                    )
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
    );
  }

  Widget _renderContent() {
    return Container(
      margin: const EdgeInsets.only(top: 11),
      child: Column(
        children: [
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
                              FilterProductBloc.of(context)
                                  .add(FilterProductSubmitted(data, category));
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
          BlocBuilder<FilterProductBloc, FilterProductState>(
              builder: (context, state) {
            if (state is SuccessFilterProductState &&
                (indexCategory1 != -1 ||
                    indexCategory2 != -1 ||
                    indexCategory3 != -1)) {
              return Expanded(
                  child: state.data.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.only(
                              top: 8, left: 16, right: 16),
                          child: GridView.builder(
                            itemCount: state.data.length,
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
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
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                          width: Get.width / 2 - 36,
                                          height: 220,
                                          child: Image.network(
                                            state.data[index].images![0],
                                            fit: BoxFit.fill,
                                          ),
                                        ),
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
                        ));
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
                      title: 'Lưa chọn danh mục để tìm kiếm',
                    )
                  ],
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
