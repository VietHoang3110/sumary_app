import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sumary_app/bloc/list_rate_product/list_rate_product_bloc.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../../../bloc/avg_rate/avg_rate_bloc.dart';
import '../../../../widgets/widgets.dart';

class FeelingBook extends StatefulWidget {
  String id;
  bool isBuy;

  FeelingBook(this.id,this.isBuy, {Key? key}) : super(key: key);

  @override
  State<FeelingBook> createState() => _FeelingBookState();
}

class _FeelingBookState extends State<FeelingBook> {
  String id = Get.arguments;
  double? avgRate;

  @override
  void initState() {
    AvgRateBloc.of(context).add(InitAvgRateEvent(id));
    ListRateProductBloc.of(context).add(InitGetListRateProductEvent(id, 0, 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<ListRateProductBloc, ListRateProductState>(
                          builder: (context, state) {
                            if(state is UpdateGetListRateProductState){
                              return WidgetText(
                                title: 'Đánh giá & nhận xét  (${state.dataRateProduct.length})',
                                style: AppStyle.DEFAULT_16
                                    .copyWith(fontWeight: FontWeight.w600),
                              );
                            }
                            else{
                              return Container();
                            }
                          },
                        ),
                        InkWell(
                          onTap: (){
                            if(widget.isBuy == true){
                              AppNavigator.navigateWriteAReview(id);
                            }
                            else{
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const WidgetDialog(
                                    title: MESSAGES.NOTIFICATION,
                                    content: "Bạn cần mua sách để viết đánh giá",
                                  );
                                },
                              );
                            }
                          },
                          child: WidgetText(
                            title: 'Viết đánh giá',
                            style: AppStyle.DEFAULT_16.copyWith(
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline),
                          ),
                        ),
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
                                    title: avgRate!.toStringAsFixed(1),
                                    style: AppStyle.DEFAULT_16_BOLD.copyWith(
                                        fontSize: 38, color: COLORS.RED),
                                  ),
                                  RatingBarIndicator(
                                    rating: avgRate!,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 17.0,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.9 - 115,
                              height: 100,
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
                                        title: (state.data.avgVoiceRate??0.0).toStringAsFixed(1),
                                        style: AppStyle.DEFAULT_14.copyWith(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  StepProgressIndicator(
                                    totalSteps: 100,
                                    currentStep: (((state.data.avgVoiceRate??0.0)/5)*100).toInt(),
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
                                    unselectedGradientColor: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.white, Colors.white],
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
                                        title: (state.data.avgContentRate??0.0).toStringAsFixed(1),
                                        style: AppStyle.DEFAULT_14.copyWith(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  StepProgressIndicator(
                                    totalSteps: 100,
                                    currentStep: (((state.data.avgContentRate??0.0)/5)*100).toInt(),
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
                                    unselectedGradientColor: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.white, Colors.white],
                                    ),
                                  ),
                                  AppValue.vSpaceTiny,
                                ],
                              ),
                            )
                          ],
                        );
                      }
                      else{return Container();}
                  },
                  )
                  ],
                ),
              ),
              Container(
                width: AppValue.widths,
                height: 1,
                color: COLORS.GREY_400,
              ),
              //TODO: List rate
              BlocBuilder<ListRateProductBloc, ListRateProductState>(
                builder: (context, state) {
                  if(state is UpdateGetListRateProductState){
                    final listRateProduct = state.dataRateProduct;
                    return Column(
                      children: List.generate(
                          listRateProduct.length,
                              (index) => Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 15, left: 15),
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: COLORS.GREY_400))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child:
                                    // Image.network(listRateProduct[index].user!.avatar.toString(),
                                    //   width: 30,
                                    //   height: 30,
                                    //   fit: BoxFit.fill,
                                    // )
                                    Image.asset('assets/images/img.png',
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  AppValue.hSpaceSmall,
                                  SizedBox(
                                    width: Get.width * 0.8-10,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                WidgetText(
                                                  title: listRateProduct[index].user!.name ?? "",
                                                  style: AppStyle.DEFAULT_14
                                                      .copyWith(
                                                      fontWeight:
                                                      FontWeight.w500),
                                                ),
                                                AppValue.hSpaceTiny,
                                                WidgetText(
                                                  title: AppValue.formatDateMonthYear(listRateProduct[index].createdAt.toString()),
                                                  style: AppStyle.DEFAULT_14
                                                      .copyWith(
                                                      fontSize: 10,
                                                      color: COLORS.RED),
                                                ),
                                              ],
                                            ),
                                            RatingBarIndicator(
                                              rating: (listRateProduct[index].voiceStar!.toDouble()+listRateProduct[index].contentStar!.toDouble())/2,
                                              itemBuilder: (context, index) =>
                                              const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 17,
                                            ),
                                          ],
                                        ),
                                        AppValue.vSpaceTiny,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 22,
                                              decoration: BoxDecoration(
                                                  color: HexColor('#FFF2DD'),
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              child: Center(
                                                child: WidgetText(
                                                  title: 'Sách rất hay',
                                                  style: AppStyle.DEFAULT_12,
                                                ),
                                              ),
                                            ),
                                            AppValue.hSpaceTiny,
                                            Container(
                                              width: 80,
                                              height: 22,
                                              decoration: BoxDecoration(
                                                  color: HexColor('#FFF2DD'),
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              child: Center(
                                                child: WidgetText(
                                                  title: 'Hấp dẫn',
                                                  style: AppStyle.DEFAULT_12,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        AppValue.vSpaceTiny,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            WidgetText(
                                              title: listRateProduct[index].content??'',
                                              style: AppStyle.DEFAULT_12,
                                              textAlign: TextAlign.justify,
                                            ),
                                          ],
                                        ),
                                        AppValue.vSpaceTiny,
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    );
                  }
                  else {return Container();}
              },
            ),
            ],
          ),
    );
  }

}
