import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sumary_app/bloc/check_chapter_done/check_chapter_done_bloc.dart';
import 'package:sumary_app/bloc/detail_product_view/detail_product_view_bloc.dart';
import 'package:sumary_app/bloc/done_book/done_book_bloc.dart';
import 'package:sumary_app/screens/chapter_detail/book_pdf.dart';
import 'package:sumary_app/screens/chapter_detail/modal_sheet_book_same.dart';
import 'package:sumary_app/screens/chapter_detail/play_audio.dart';
import 'package:sumary_app/screens/chapter_detail/widget_drawer.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_appbar.dart';
import 'package:sumary_app/widgets/widget_text.dart';
import '../../bloc/detail_product/detail_product_bloc.dart';
import '../../bloc/get_content_file_pdf/get_content_file_pdf_bloc.dart';
import '../../src/models/model_generator/detail_productt.dart';
import '../../src/spacing.dart';
import '../../storages/share_local.dart';
import '../../widgets/widget_button.dart';
import '../../widgets/widget_dialog.dart';
import 'modal_sheet_setting.dart';

class ChapterDetailScreen extends StatefulWidget {
  const ChapterDetailScreen({Key? key}) : super(key: key);

  @override
  State<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}


class _ChapterDetailScreenState extends State<ChapterDetailScreen>  with TickerProviderStateMixin {
  String id = Get.arguments[0];

  ScrollController scrollController = ScrollController();


  var scaffoldKey = GlobalKey<ScaffoldState>();
  double fontSize = 18;
  double space = 1.5;
  String bgr = 'https://api.tiemnangmaster.com/static/1660036131416bgr3.png/high';
  bool isSelect = true;
  bool checkBought = false;
  int indexBgr = 2;


  String title = '';
  int bookSelect = Get.arguments[1]??0;

  @override
  void initState()  {
    DetailProductBloc.of(context).add(InitDetailProductEvent(id));
    super.initState();
  }


  changeSelect(bool x) {
    setState(() {
      isSelect = x;
    });
  }

  changeBookSelect(int index,String book) {
    setState(() {
      bookSelect = index;
    });
    ContentFileBloc.of(context).add(InitContentFileEvent(book.split("/").last));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: widget_drawer(
        scaffoldKey: scaffoldKey,
        change: changeBookSelect,
        offAudio: () => changeSelect(true),),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(bgr), fit: BoxFit.cover)),
        child: ((shareLocal.getString(PreferencesKey.TOKEN) == '') || (shareLocal.getString(PreferencesKey.TOKEN) == null)) ? BlocBuilder<DetailProductViewBloc, DetailProductViewState>(
            builder: (context, state) {
              if (state is UpdateDetailProductViewState) {
                DataDetailProduct data = state.data;
                List<DataFile> listFile = state.listFile;
                List<DataVoice> listVoice = state.listVoice;
                title = "Tâm mục ${bookSelect + 1}";
                return buildDetail(context,data, listFile, listVoice);
              }
              else{
                return Container();
              }
            }
        ) :
        BlocBuilder<DetailProductBloc, DetailProductState>(
          builder: (context, state) {
            if (state is UpdateGetDetailProductState) {
              DataDetailProduct data = state.data;
              List<DataFile> listFile = state.listFile;
              List<DataVoice> listVoice = state.listVoice;
              title = "Tâm mục ${bookSelect + 1}";
              return buildDetail(context,data, listFile,listVoice);
            }
            else{
               return Container();
            }
          }
          ),
      ));
  }

  buildDetail(BuildContext context,DataDetailProduct data,List<DataFile> listFile,List<DataVoice> listVoice) {
    // final _player = AudioPlayer();
    return Padding(
      padding: EdgeInsets.only(top: Spacing.viewPadding.top),
      child: Column(
            children: [
              WidgetAppbar(
                isTitleCenter: true,
                widgetTitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    WidgetText(
                      title: title,
                      style: AppStyle.DEFAULT_18
                          .copyWith(fontWeight: FontWeight.w500),
                      maxLine: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppValue.hSpaceSmall,
                    GestureDetector(
                        onTap: (){
                          if(data.book!.voice!.isNotEmpty){
                            AppNavigator.navigateAudioScreen(data, bookSelect);
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
                        child: SvgPicture.asset('assets/icons/headphone.svg')
                    )
                  ],
                ),
                left: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                        width: 26,
                        height: 26,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: COLORS.WHITE,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Icon(Icons.arrow_back_sharp)),
                  ),
                ),
                right: Row(
                  children: [
                    // GestureDetector(
                    //     onTap: () {
                    //       setState(() {
                    //         // _player.stop();
                    //         isSelect = !isSelect;
                    //       });
                    //     },
                    //     child: isSelect
                    //         ? SvgPicture.asset('assets/icons/headphone.svg')
                    //         : SvgPicture.asset('assets/icons/headphone.svg',
                    //         color: const Color(0xffFF9F00))),
                    AppValue.hSpace(12),
                    GestureDetector(
                        onTap: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                SingleChildScrollView(
                                  controller: ModalScrollController.of(context),
                                  child: Modal_Sheet_Setting(
                                    onChangeSize: (value) {
                                      setState(() {
                                        fontSize = value;
                                      });
                                    },
                                    onChangeSpace: (value) {
                                      setState(() {
                                        space = value;
                                      });
                                    },
                                    onChangeBgr: (value,index) {
                                      setState(() {
                                        bgr = value;
                                      });
                                      indexBgr=index;
                                    },
                                    size: fontSize,
                                    space: space,
                                    bgr: indexBgr,
                                  ),
                                ),
                          );
                        },
                        child:
                        SvgPicture.asset('assets/icons/setting2.svg')),
                    AppValue.hSpace(12),
                    GestureDetector(
                        onTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: SvgPicture.asset('assets/icons/list2.svg'))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                isSelect ? const SizedBox()
                    : TranslationAnimatedWidget.tween(
                      translationDisabled: const Offset(0, -40),
                      translationEnabled: const Offset(0, 0),
                      child: OpacityAnimatedWidget.tween(
                          opacityEnabled: 1, //define start value
                          opacityDisabled: 0, //// and end value
                          enabled: !isSelect, //bind with the boolean
                          curve: Curves.slowMiddle,
                          child: Audio(
                              id: id,
                              file: listFile,
                              voice: listVoice,
                              title: title,
                              urlBook: data.book!.images![0],
                              changeBookSelect: changeBookSelect,
                              bookSelect: bookSelect,
                              isBuy: data.is_buy,
                              isSave: data.is_save
                            ),
                       ),
                    ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),
                    child:  BlocListener<DoneBookBloc, DoneBookState>(
                      listener: (context, state) {
                        if (state is SuccessDoneBookState) {
                          GetSnackBarUtils.removeSnackBar();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return WidgetDialog(
                                  title: MESSAGES.NOTIFICATION,
                                  content: 'Chúc mừng bạn đã hoàn thành tâm sách!!',
                                  onTap1: (){
                                    Get.back();
                                    Get.back();
                                  }
                              );
                            },
                          );
                        }
                        if (state is InProgressDoneBookState) {
                          GetSnackBarUtils.createProgress();
                        }
                        if (state is FailureDoneBookState) {
                          GetSnackBarUtils.removeSnackBar();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return WidgetDialog(
                                title: MESSAGES.NOTIFICATION,
                                content: state.message,
                              );
                            },
                          );
                          GetSnackBarUtils.createFailure(message: state.message);
                        }
                      },
                      child: Column(
                      children: [
                        book_pdf(
                          isPrevious: (bookSelect > 0) ? true : false,
                          isNext: (bookSelect < (listFile.length-1)) ? true : false,
                          title: listFile[bookSelect].name.toString(),
                          fontSize: fontSize,
                          space: space,
                          name: (listFile[bookSelect].src.toString().split("/").last),
                          isSave: data.is_save,
                          isBuy: data.is_buy,
                          nextChapter: (){
                            CheckChapterDoneBloc.of(context).add(DoneChapterSubmitted(id: id, chapter: bookSelect));
                            setState(() {
                              if(bookSelect < (listFile.length-1)){
                                bookSelect++;
                                scrollController.animateTo(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve:Curves.fastOutSlowIn
                                );
                              }else{
                                DoneBookBloc.of(context).add(DoneBookSubmitted(id: id));
                              }
                            });
                          },
                          previousChapter: (){
                            setState(() {
                              if(bookSelect>0){
                                bookSelect--;
                                scrollController.animateTo(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve:Curves.fastOutSlowIn
                                );
                              }
                            });
                          },
                        ),
                        AppValue.vSpaceMedium,
                      ],
                    ),
                    ),
                  ),
                ),
              ),
              AppValue.vSpace(4),
              GestureDetector(
                onTap: (){
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return  ModalSheetBookSame(id: id);
                    },
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Lottie.asset(
                    //   'assets/lottie/yo-top.json',
                    //   height: 40,
                    //   width: 40,
                    // ),
                    Image.asset('assets/icons/hiensachsame.png',height: 24,width: 24,),
                    AppValue.vSpace(5),
                    Container(
                      height: 3,
                      width: AppValue.widths*0.25,
                      decoration: BoxDecoration(
                          color: COLORS.PRIMARY_COLOR.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                    AppValue.vSpace(4)
                  ],
                ),
              ),
              // data.is_buy ? Container(
              //   height: 45,
              //   width: AppValue.widths,
              //   decoration: const BoxDecoration(
              //     color: COLORS.PRIMARY_COLOR,
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 15, left: 15),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         InkWell(
              //           onTap: () =>
              //               AppNavigator.navigateWriteAReview(id),
              //           child: WidgetText(
              //             title: 'Viết cảm nhận',
              //             style: AppStyle.DEFAULT_18.copyWith(
              //                 color: COLORS.WHITE,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //         ),
              //         Container(
              //           width: 2,
              //           height: 20,
              //           color: COLORS.GREY_400,
              //         ),
              //         InkWell(
              //           onTap: () =>
              //               AppNavigator.navigateMakeAQuestion(id),
              //           child: WidgetText(
              //             title: 'Đặt câu hỏi',
              //             style: AppStyle.DEFAULT_18.copyWith(
              //                 color: COLORS.WHITE,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
              //     : InkWell(
              //   onTap: () {
              //     ((shareLocal.getString(PreferencesKey.TOKEN)) == '' || shareLocal.getString(PreferencesKey.TOKEN) == null) ? showDialog(
              //       context: context,
              //       barrierDismissible: false,
              //       builder: (BuildContext context) {
              //         return WidgetDialog(
              //             title: MESSAGES.NOTIFICATION,
              //             content: "Bạn cần đăng nhập để mua sách !!",
              //             onTap1: () {
              //               setState((){
              //                 Get.back();
              //               });
              //             }
              //         );
              //       },
              //     ) :
              //     showMaterialModalBottomSheet(
              //       context: context,
              //       builder: (context) =>
              //           SingleChildScrollView(
              //             controller: ModalScrollController.of(context),
              //             child: Modal_Sheet(
              //               changeStatus: () {
              //                 setState(() {
              //                   checkBought = true;
              //                 });
              //               },
              //               name: data.book!.name.toString(),
              //               price: data.book!.price!.toInt(),
              //               id: id,
              //             ),
              //           ),
              //     );
              //   },
              //   child: Container(
              //     alignment: AlignmentDirectional.center,
              //     height: 45,
              //     width: AppValue.widths,
              //     decoration: const BoxDecoration(
              //       color: COLORS.PRIMARY_COLOR,
              //     ),
              //     child: WidgetText(
              //       title: 'Thanh toán để tiếp tục đọc',
              //       style: AppStyle.DEFAULT_18.copyWith(
              //           color: COLORS.WHITE,
              //           fontWeight: FontWeight.w400),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
            ],
          ),
    );
   }
  }


