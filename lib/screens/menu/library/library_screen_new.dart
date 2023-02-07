import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/list_book_bought/list_book_bought_bloc.dart';
import 'package:sumary_app/bloc/list_book_reading/list_book_reading_bloc.dart';
import 'package:sumary_app/bloc/list_book_save/list_book_save_bloc.dart';
import 'package:sumary_app/screens/menu/library/buildDropdown/dropdown_book_bought.dart';
import 'package:sumary_app/screens/menu/library/buildDropdown/dropdown_book_reading.dart';
import 'package:sumary_app/screens/menu/library/buildDropdown/dropdown_book_save.dart';
import 'package:sumary_app/src/spacing.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_slider.dart';
import '../../../bloc/my_armorial/my_armorial_bloc.dart';
import '../../../src/color.dart';
import '../../../widgets/widgets.dart';
import '../../topHeader.dart';
import 'buildDropdown/dropdown_book_done.dart';

class LibraryScreenNew extends StatefulWidget {
  const LibraryScreenNew({Key? key}) : super(key: key);

  @override
  State<LibraryScreenNew> createState() => _LibraryScreenNewState();
}

class _LibraryScreenNewState extends State<LibraryScreenNew> {


  @override
  void initState() {
    MyArmorialBloc.of(context).add(InitGetMyArmorialEvent());
    ListBookBoughtBloc.of(context).add(InitGetListBookBoughtEvent('john cena', 1, 10));
    ListBookSaveBloc.of(context).add(InitGetListBookSaveEvent('john cena',1,10));
    ListBookReadingBloc.of(context).add(InitGetListBookReadingEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.WHITE,
      body: Column(
        children: [
          _renderHeader(),
          Expanded(
              child: _renderContent()
          )
        ],
      ),
    );
  }

  _renderContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppValue.vSpaceSmall,
          buildDropdownListBookBought(),
          AppValue.vSpaceSmall,
          buildDropdownListBookSave(),
          AppValue.vSpaceSmall,
          buildDropdownListBookReading(),
          AppValue.vSpaceSmall,
          buildDropdownListBookDone()
        ],
      ),
    );
  }

  _renderHeader() {
    return (Container(
      // width: Get.width,
      // height: Get.height*0.4,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/thuvien_bgr.png"),
            fit: BoxFit.fill,
          ),
      ),
      child: Column(
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
                )
            ),
            child: const topHeader(),
          ),
          AppValue.vSpace(10),
          const widget_seach_1(),
          AppValue.vSpace(25),
          BlocBuilder<MyArmorialBloc, MyArmorialState>(
            builder: (context, state) {
              if(state is UpdateGetMyArmorialState){
                return SizedBox(
                  width: AppValue.widths*0.92,
                  child: Stack(
                    children: [
                      Image.asset('assets/images/labrary_new_image.png'),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 8),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    WidgetText(
                                      title: 'Tên thành viên',
                                      style: AppStyle.DEFAULT_14.copyWith(
                                          color: COLORS.WHITE,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                    const Spacer(),
                                    WidgetText(
                                      title: 'Danh hiệu',
                                      style: AppStyle.DEFAULT_14.copyWith(
                                          color: COLORS.WHITE,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: WidgetText(
                                        title: state.data.username,
                                        style: AppStyle.DEFAULT_16.copyWith(
                                            color: COLORS.WHITE,
                                            fontWeight: FontWeight.w500
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    WidgetText(
                                      title: "${state.data.name}",
                                      style: AppStyle.DEFAULT_16.copyWith(
                                          color: COLORS.WHITE,
                                          fontWeight: FontWeight.w500
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                SliderTheme(
                                    data: SliderThemeData(
                                        trackHeight: 1.5,
                                        trackShape: CustomTrackShape(),
                                        thumbShape: const RoundSliderThumbShape(
                                            enabledThumbRadius: 5
                                        ),
                                        overlayShape:  SliderComponentShape.noOverlay
                                    ),
                                    child: Slider(
                                      min: 0,
                                      max: 100,
                                      thumbColor: COLORS.PRIMARY_COLOR,
                                      activeColor: COLORS.PRIMARY_COLOR,
                                      inactiveColor: COLORS.GREY_400,
                                      onChanged: (value) {},
                                      value: (state.data.myBook! / state.data.myBookRequireForUpAppellation!)*100,
                                    )
                                ),
                                AppValue.vSpace(12),
                                Container(
                                  height: 38,
                                  width: Get.width,
                                  decoration:  BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        HexColor('#EE4D2C'),
                                        HexColor('#FF9F00'),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: InkWell(
                                    onTap: ()=> AppNavigator.navigateArmorialPage(),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 2),
                                            child: SvgPicture.asset('assets/icons/i.svg',height: 15,width: 15,fit: BoxFit.fill,),
                                          ),
                                          AppValue.hSpaceTiny,
                                          WidgetText(
                                            title: '“Đọc Tâm sách - Thưởng Bookcoin!”',
                                            style: AppStyle.DEFAULT_14.copyWith(
                                              color: COLORS.WHITE,
                                              fontWeight: FontWeight.w500
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                          const Spacer(),
                                          WidgetText(
                                            title: '${state.data.myBook}/${state.data.myBookRequireForUpAppellation}',
                                            style: AppStyle.DEFAULT_14.copyWith(
                                              color: COLORS.WHITE,
                                              fontWeight: FontWeight.w500
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
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
          AppValue.vSpace(15),
        ],
      ),
    )
    );
  }
}

