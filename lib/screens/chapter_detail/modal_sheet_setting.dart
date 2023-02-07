import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sumary_app/bloc/list_background/list_background_bloc.dart';

import '../../src/src_index.dart';
import '../../widgets/widget_button_category.dart';
import '../../widgets/widgets.dart';

class Modal_Sheet_Setting extends StatefulWidget {
  Modal_Sheet_Setting({Key? key,
    required this.onChangeSize,
    required this.onChangeSpace,
    required this.onChangeBgr,
    required this.size,
    required this.space,
    required this.bgr
  }) : super(key: key);

  Function onChangeSize;
  Function onChangeSpace;
  Function onChangeBgr;
  double size;
  double space;
  int bgr;

  @override
  State<Modal_Sheet_Setting> createState() => _Modal_Sheet_SettingState();
}

class _Modal_Sheet_SettingState extends State<Modal_Sheet_Setting> {
  double? _valueSize ;
  double? _valueSpace ;
  int? indexBackground;

  @override
  void initState() {
    setState(() {
      _valueSize=widget.size;
      _valueSpace=widget.space;
      indexBackground=widget.bgr;
    });
    ListBackgroundBloc.of(context).add(InitGetListBackgroundEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset('assets/images/clip3.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15, bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 16,width: 16),
                          WidgetText(
                            title: 'Cài đặt',
                            style: AppStyle.DEFAULT_18.copyWith(
                            ),
                          ),
                          InkWell(
                              onTap: () => Navigator.pop(context),
                              child: SvgPicture.asset('assets/icons/icon_exit.svg')
                          )
                        ],
                      ),
                      AppValue.vSpaceTiny,
                      Container(width: AppValue.widths, height: 1, color: COLORS.GREY_400,),
                      AppValue.vSpaceSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WidgetText(
                            title: 'Kích thước chữ',
                            style: AppStyle.DEFAULT_16,
                          ),
                          SliderTheme(
                              data: const SliderThemeData(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 7
                                  )
                              ),
                              child: SizedBox(
                                height: 20,
                                width: AppValue.widths,
                                child: Slider(
                                  min: 10,
                                  max: 20,
                                  activeColor: COLORS.PRIMARY_COLOR,
                                  inactiveColor: COLORS.GREY_400,
                                  divisions: 10,
                                  label: _valueSize.toString(),
                                  onChangeEnd: (value) {
                                    setState(() {
                                      _valueSize = value;
                                    });
                                    widget.onChangeSize(value);
                                  },
                                  value: _valueSize!, onChanged: (double value) {  },
                                ),
                              )
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WidgetText(
                                title: '10',
                                style: AppStyle.DEFAULT_16,
                              ),
                              WidgetText(
                                title: '20',
                                style: AppStyle.DEFAULT_16,
                              ),
                            ],
                          ),
                          AppValue.vSpaceMedium,
                          WidgetText(
                            title: 'Khoảng cách dòng',
                            style: AppStyle.DEFAULT_16,
                          ),
                          SliderTheme(
                              data: const SliderThemeData(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 7
                                  )
                              ),
                              child: SizedBox(
                                height: 20,
                                width: AppValue.widths,
                                child: Slider(
                                  min: 1,
                                  max: 5,
                                  activeColor: COLORS.PRIMARY_COLOR,
                                  inactiveColor: COLORS.GREY_400,
                                  divisions: 20,
                                  label: _valueSpace.toString(),
                                  onChangeEnd: (value) {
                                    setState(() {
                                      _valueSpace = value;
                                    });
                                    widget.onChangeSpace(value);
                                  },
                                  value: _valueSpace!,
                                  onChanged: (double value) {},
                                ),
                              )
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WidgetText(
                                title: '1',
                                style: AppStyle.DEFAULT_16,
                              ),
                              WidgetText(
                                title: '5',
                                style: AppStyle.DEFAULT_16,
                              ),
                            ],
                          ),
                          AppValue.vSpaceSmall,
                          WidgetText(
                            title: 'Background',
                            style: AppStyle.DEFAULT_16,
                          ),
                          AppValue.vSpaceTiny,
                          BlocBuilder<ListBackgroundBloc, ListBackgroundState>(
                            builder: (context, state) {
                              if(state is UpdateGetListBackgroundState){
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(state.data.length,
                                          (index) => WidgetBackground(
                                        image: state.data[index].imageUrl,
                                        index: index,
                                        select: indexBackground!,
                                        onClick: (){
                                          setState(() {
                                            indexBackground = index;
                                          });
                                          widget.onChangeBgr(state.data[index].imageUrl,index);
                                        },
                                      )
                                  ),
                                );
                              }
                              else{
                                return Container();
                              }
                            },
                          ),
                          AppValue.vSpaceSmall
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        )
    );
  }
}

