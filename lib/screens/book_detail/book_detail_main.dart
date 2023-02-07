import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sumary_app/bloc/avg_rate/avg_rate_bloc.dart';
import 'package:sumary_app/bloc/detail_product/detail_product_bloc.dart';
import 'package:sumary_app/bloc/save_book/save_book_bloc.dart';
import 'package:sumary_app/screens/book_detail/modal_sheet_buy.dart';
import 'package:sumary_app/src/models/model_generator/detail_productt.dart';
import '../../../../src/src_index.dart';
import '../../../../widgets/widgets.dart';
import '../../bloc/detail_product_view/detail_product_view_bloc.dart';
import '../../bloc/list_book_save/list_book_save_bloc.dart';
import '../../bloc/list_rate_product/list_rate_product_bloc.dart';
import '../../bloc/unsave_book/unsave_book_bloc.dart';
import '../../storages/share_local.dart';
import '../menu/library/book_detail/feeling_book.dart';
import '../menu/library/book_detail/introduce_book.dart';


class BookDetailMain extends StatefulWidget {
  const BookDetailMain({Key? key}) : super(key: key);

  @override
  State<BookDetailMain> createState() => _BookDetailMainState();
}

class _BookDetailMainState extends State<BookDetailMain> {
  String id = Get.arguments;
  double avgRate = 0;
  double contentRate = 0;
  double voiceRate = 0;


  @override
  void initState() {
    initData();
    super.initState();
  }
  initData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    DetailProductBloc.of(context).add(InitDetailProductEvent(id));
    DetailProductViewBloc.of(context).add(InitDetailProductViewEvent(id));
    if(connectivityResult == ConnectivityResult.none) {
      return;
    } else {
      AvgRateBloc.of(context).add(InitAvgRateEvent(id));
      ListBookSaveBloc.of(context).add(InitGetListBookSaveEvent('john cena',1,10));
    }
  }
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    ListRateProductBloc.of(context).add(InitGetListRateProductEvent(id, 0, 0));
    AvgRateBloc.of(context).add(InitAvgRateEvent(id));
  }

  void _onLoading() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    items.add((items.length+1).toString());
    if(mounted) {
      _refreshController.loadComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = SaveBookBloc.of(context);
    final bloc1 = UnsaveBookBloc.of(context);
    return DefaultTabController(
      length: 2,
      child: ((shareLocal.getString(PreferencesKey.TOKEN)) == '' || shareLocal.getString(PreferencesKey.TOKEN) == null) ? BlocBuilder<DetailProductViewBloc, DetailProductViewState>(
        builder: (context, state) {
          if(state is UpdateDetailProductViewState) {
            DataDetailProduct data = state.data;
            return buildDetailBook(bloc1, bloc, data);
          }
          else{
            return Container();
          }
        },
      ) : BlocBuilder<DetailProductBloc, DetailProductState>(
        builder: (context, state) {
          if(state is UpdateGetDetailProductState) {
            DataDetailProduct data = state.data;
            return buildDetailBook(bloc1, bloc, data);
          }
          else{
            return Container();
          }
        },
      ) ,
    );
  }

  buildDetailBook(UnsaveBookBloc bloc1, SaveBookBloc bloc, DataDetailProduct data) {
    return Scaffold(
      backgroundColor: COLORS.WHITE,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Thư viện tâm sách',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: () => AppNavigator.navigateBack(),
            child: const Icon(Icons.arrow_back, color: Colors.black,)
        ),
        actions: [
          InkWell(
              onTap: () => AppNavigator.navigateMain(),
              child: SvgPicture.asset('assets/icons/home.svg')
          ),
          AppValue.hSpace(20),

          (shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null) ? (data.is_save ?
          BlocListener<UnsaveBookBloc, UnsaveBookState>(
            listener: (context, state) {
              if (state is SuccessUnsaveBookState) {
                GetSnackBarUtils.removeSnackBar();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return WidgetDialog(
                        title: MESSAGES.NOTIFICATION,
                        content: "Đã bỏ lưu sách",
                        onTap1: () {
                          setState((){
                            Get.back();
                            Get.back();
                            AppNavigator.navigateBookDetailMain(id);
                          });
                        }
                    );
                  },
                );
              }
              if (state is InProgressUnsaveBookState) {
                GetSnackBarUtils.createProgress();
              }
              if (state is FailureUnsaveBookState) {
                GetSnackBarUtils.removeSnackBar();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return WidgetDialog(
                      title: MESSAGES.NOTIFICATION,
                      content: state.message,
                      onTap1: () => Get.back(),
                    );
                  },
                );
              }
            },
            child: _buildUnSaveBook(bloc1, data),
          ) :
          BlocListener<SaveBookBloc, SaveBookState>(
            listener: (context, state) {
              if (state is SuccessSaveBookState) {
                GetSnackBarUtils.removeSnackBar();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return WidgetDialog(
                        title: MESSAGES.NOTIFICATION,
                        content: "Sách đã được lưu, vào thư viện sách đã lưu để xem sách đã lưu",
                        onTap1: () {
                          setState((){
                            Get.back();
                            Get.back();
                            AppNavigator.navigateBookDetailMain(id);
                          });
                        }
                    );
                  },
                );
              }
              if (state is InProgressSaveBookState) {
                GetSnackBarUtils.createProgress();
              }
              if (state is FailureSaveBookState) {
                GetSnackBarUtils.removeSnackBar();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return WidgetDialog(
                      title: MESSAGES.NOTIFICATION,
                      content: state.message,
                      onTap1: () => Get.back(),
                    );
                  },
                );
              }
            },
            child: _buildSaveBook(bloc, data),
          )) : Container(),
          AppValue.hSpaceSmall
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        enablePullDown: true,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: AppValue.widths,
                  height: AppValue.heights * 0.3,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          HexColor('#2896FF'),
                          HexColor('#6EE1FF')
                        ],
                      )
                  ),
                ),
                ImageSlideshow(
                  height: 180,
                  width: AppValue.widths*0.36,
                  autoPlayInterval: 5000,
                  isLoop: true,
                  children: List.generate(data.book!.images!.length,
                          (index) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          data.book!.images![index],fit: BoxFit.fill,),
                      )
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: AppValue.widths*0.6,
                          child: WidgetText(
                            title: data.book!.name.toString(),
                            style: AppStyle.DEFAULT_18.copyWith(
                                fontWeight: FontWeight.w600
                            ),
                          )
                      ),
                      BlocBuilder<AvgRateBloc, AvgRateState>(
                        builder: (context, state) {
                          if(state is UpdateAvgRateState){
                            if(state.data.avgContentRate == null || state.data.avgContentRate == null){
                              avgRate = 0.0;
                            }
                            else{
                              avgRate = ((state.data.avgContentRate! + state.data.avgVoiceRate!) / 2);
                            }
                            return Row(
                              children: [
                                WidgetText(
                                  title: avgRate.toStringAsFixed(1),
                                  style: AppStyle.DEFAULT_16.copyWith(
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                AppValue.hSpace(3),
                                RatingBarIndicator(
                                  rating: avgRate.toDouble(),
                                  itemBuilder: (context, index) =>
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 17.0,
                                ),
                              ],
                            );
                          }
                          else{
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                  AppValue.vSpace(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetText(
                        title: data.book!.author!.name.toString(),
                        style: AppStyle.DEFAULT_14.copyWith(
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/hourglass.svg',height: 13,width: 13,),
                          AppValue.hSpace(3),
                          WidgetText(
                            title: AppValue.intToTimeLeft(data.book!.voiceTime ?? 0).toString(),
                            style: AppStyle.DEFAULT_14.copyWith(
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppValue.vSpace(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/bcoin.svg'),
                          AppValue.hSpaceTiny,
                          WidgetText(
                            title: '${data.book!.price} Bcoin',
                            style: AppStyle.DEFAULT_16_BOLD.copyWith(
                                color: COLORS.RED
                            ),
                          ),
                          // AppValue.hSpaceTiny,
                          AppValue.hSpaceTiny,
                          (data.book!.price != data.book!.prePrice)
                              ?  RichText(
                            text: TextSpan(
                              text: '${data.book!.prePrice}',
                              style: const TextStyle(
                                  fontSize: 10, color: COLORS.GREY_400,
                                  decoration: TextDecoration.lineThrough),
                              children: const <TextSpan>[
                                TextSpan(text: ' Bcoin'),
                              ],
                            ),
                          ) : Container(),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/reading-book.svg',height: 15,width: 15),
                          AppValue.hSpace(3),
                          WidgetText(
                            title: data.book!.viewCount.toString(),
                            style: AppStyle.DEFAULT_14.copyWith(
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  data.is_buy ? Container()
                      : Column(
                        children: [
                          AppValue.vSpaceTiny,
                          InkWell(
                          onTap: () {
                          ((shareLocal.getString(PreferencesKey.TOKEN)) == '' || shareLocal.getString(PreferencesKey.TOKEN) == null) ? showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return WidgetDialog(
                                  title: MESSAGES.NOTIFICATION,
                                  content: "Bạn cần đăng nhập để mua sách !!",
                                  onTap1: () {
                                    setState((){
                                      Get.back();
                                    });
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
                                      setState(() {
                                        // checkBought = true;
                                      });
                                    },
                                    name: data.book!.name.toString(),
                                    price: data.book!.price!.toInt(),
                                    id: id,
                                  ),
                                ),
                            );
                          },
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            height: 30,
                            width: AppValue.widths*0.3,
                            decoration: BoxDecoration(
                              color: COLORS.PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: WidgetText(
                              title: 'Mua sách',
                              style: AppStyle.DEFAULT_18.copyWith(
                                  color: COLORS.WHITE,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                          ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Container(width: AppValue.widths,
                height: 1,
                color: COLORS.GREY_E7),
            Container(
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
                  indicatorColor: HexColor('#EE4D2C'),
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
                        child: const Text('Giới thiệu',textAlign: TextAlign.center)
                    ),
                    SizedBox(
                        width: AppValue.widths*0.5,
                        child: const Text('Cảm nhận',textAlign: TextAlign.center)
                    ),
                  ]
              ),
            ),
            Expanded(
                child: TabBarView(
                  children: [
                    IntroduceBook(data.book!.file!, data.book!.description!, data.is_buy, data.book!),
                    FeelingBook(data.book!.Id!, data.is_buy)
                  ],
                )
            ),
            _buildButtonRead(),
          ],
        ),
      ),
    );
  }

  _buildSaveBook(SaveBookBloc bloc, DataDetailProduct data) {
    return InkWell(
        onTap: (){
          bloc.add(SaveBookSubmitted(id: id, data: data));
        },
        child: SvgPicture.asset('assets/icons/save.svg'));
  }

  _buildUnSaveBook(UnsaveBookBloc bloc1, DataDetailProduct data) {
    return InkWell(
      onTap: ()=>bloc1.add(UnsaveBookSubmitted(id: id, data: data)),
      child: SvgPicture.asset('assets/icons/save1.svg'),);
  }

  _buildButtonRead() {
    return WidgetButton3(
      height: 48,
      onTap: () {
        AppNavigator.navigateChapterDetail(id,0);
      },
      //enable: state.status.isValidated,
      backgroundColor: HexColor('#FF9F00'),
      text: 'Đọc tâm sách',
    );
  }
}