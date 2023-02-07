import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sumary_app/screens/book_detail/widget_tabbar/widget_comment.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../../bloc/avg_rate/avg_rate_bloc.dart';
import '../../../src/src_index.dart';


class commentBook extends StatelessWidget {
  String id;

  commentBook({
    Key? key,
    required this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const widgetRate(),
        AppValue.vSpaceSmall,
        Comment_Book(id: id,)
      ],
    );
  }
}

class widgetRate extends StatelessWidget {
  const widgetRate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double avgRate ;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              WidgetText(
                title: 'Tổng đánh giá',
                style: AppStyle.DEFAULT_16.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              // const Spacer(),
              // Image.asset('assets/icons/ibox_icon2.png',width: 20, height: 18,),
              // AppValue.hSpace(5),
              // WidgetText(
              //   title: '35 Nhận xét',
              //   style: AppStyle.DEFAULT_16.copyWith(
              //       fontWeight: FontWeight.w400,
              //       color: COLORS.GREY,
              //       fontSize: 14
              //   ),
              // ),
            ],
          ),
          AppValue.vSpaceTiny,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: COLORS.PRIMARY_COLOR),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetText(
                            title: avgRate.toStringAsFixed(1),
                            style: AppStyle.DEFAULT_16_BOLD.copyWith(
                                fontSize: 38, color: COLORS.RED),
                          ),
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
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppValue.vSpaceTiny,
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                WidgetText(
                                  title: 'Giọng đọc',
                                  style: AppStyle.DEFAULT_14.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                                WidgetText(
                                  title: (state.data.avgVoiceRate ?? 0.0).toStringAsFixed(1),
                                  style: AppStyle.DEFAULT_14.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            StepProgressIndicator(
                              totalSteps: 100,
                              currentStep: (((state.data.avgVoiceRate ?? 0.0) / 5) * 100).toInt(),
                              size: 3,
                              padding: 0,
                              roundedEdges: const Radius.circular(15),
                              selectedGradientColor: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('#EE4D2C'),
                                  HexColor('#EE4D2C')
                                ],
                              ),
                              unselectedGradientColor: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    HexColor('#D5DCF8'),
                                    HexColor('#D5DCF8'),
                                  ]
                              ),
                            ),
                            AppValue.vSpaceTiny,
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                WidgetText(
                                  title: 'Nội dung',
                                  style: AppStyle.DEFAULT_14.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                                WidgetText(
                                  title: (state.data.avgContentRate ?? 0.0).toStringAsFixed(1),
                                  style: AppStyle.DEFAULT_14.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            StepProgressIndicator(
                              totalSteps: 100,
                              currentStep: (((state.data.avgContentRate ?? 0.0) / 5) * 100).toInt(),
                              size: 3,
                              padding: 0,
                              roundedEdges: const Radius.circular(15),
                              selectedGradientColor: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('#EE4D2C'),
                                  HexColor('#EE4D2C')
                                ],
                              ),
                              unselectedGradientColor: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    HexColor('#D5DCF8'),
                                    HexColor('#D5DCF8'),
                                  ]
                              ),
                            ),
                            AppValue.vSpaceTiny,
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}