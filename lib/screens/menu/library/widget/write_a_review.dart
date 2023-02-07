import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/src/spacing.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../../../bloc/blocs.dart';
import '../../../../bloc/create_rate_product/create_rate_product_bloc.dart';
import '../../../../bloc/detail_product/detail_product_bloc.dart';
import '../../../../bloc/detail_product_view/detail_product_view_bloc.dart';
import '../../../../bloc/list_rate_product/list_rate_product_bloc.dart';
import '../../../../widgets/widget_slider.dart';
import '../../../../widgets/widgets.dart';

class WriteAReview extends StatefulWidget {
  const WriteAReview({Key? key}) : super(key: key);

  @override
  State<WriteAReview> createState() => _WriteAReviewState();
}

class _WriteAReviewState extends State<WriteAReview> {

  final String _id = Get.arguments;
  double _valueVoice = 80;
  double _valueContent = 80;
  String _content = '';

  @override
  Widget build(BuildContext context) {
      final bloc = CreateRateBloc.of(context);
      return BlocListener<CreateRateBloc, CreateRateState>(
        listener: (context, state) {
          if (state is SuccessCreateRateState) {
            GetSnackBarUtils.removeSnackBar();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return WidgetDialog(
                    title: MESSAGES.NOTIFICATION,
                    content: MESSAGES.SUCCESS,
                    textButton1: "Thoát",
                    onTap1: () {
                      Get.back();
                      Get.back();
                      Get.back();
                      AppNavigator.navigateBookDetailMain(_id);
                      // ListRateProductBloc.of(context).add(InitGetListRateProductEvent(_id, 0, 0));
                      // DetailProductBloc.of(context).add(InitDetailProductEvent(_id));
                      // DetailProductViewBloc.of(context).add(InitDetailProductViewEvent(_id));
                    }
                );
              },
            );
          }
          if (state is InProgressCreateRateState) {
            GetSnackBarUtils.createProgress();
          }
          if (state is FailureCreateRateState) {
            GetSnackBarUtils.removeSnackBar();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return WidgetDialog(
                  title: MESSAGES.NOTIFICATION,
                  content: state.message,
                  onTap1: (){
                    Get.back();
                    Get.back();
                  },
                );
              },
            );
          }
        },
        child: Scaffold(
        backgroundColor: COLORS.WHITE,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: WidgetText(
            title: 'Viết đánh giá',
            style: AppStyle.DEFAULT_16.copyWith(
                fontWeight: FontWeight.w500
            ),
          ),
          leading: InkWell(
              onTap: ()=> AppNavigator.navigateBack(),
              child: const Icon(Icons.arrow_back,color: Colors.black,)
          ),
        ),
        body: SizedBox(
          height: AppValue.heights-60-Spacing.viewPadding.top,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:AppValue.heights-48-60-Spacing.viewPadding.top,
                      ),
                      _buildButtonReview(bloc)
                    ],
                  )
              ),
              SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: COLORS.GREY_400),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15, left: 15, top: 17),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      WidgetText(
                                        title: 'Giọng đọc',
                                        style: AppStyle.DEFAULT_14.copyWith(
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          WidgetText(
                                            title: '${(_valueVoice/20).round()}',
                                            style: AppStyle.DEFAULT_14.copyWith(
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          const Padding(
                                            padding:  EdgeInsets.only(bottom: 3),
                                            child: Icon(Icons.star, color: Colors.amber,size: 15,),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SliderTheme(
                                      data: SliderThemeData(
                                          trackHeight: 3,
                                          trackShape: CustomTrackShape(),
                                          thumbShape: const RoundSliderThumbShape(
                                              enabledThumbRadius: 7
                                          )
                                      ),
                                      child: Slider(
                                        min: 0,
                                        max: 100,
                                        divisions: 5,
                                        thumbColor: COLORS.GREY_400,
                                        activeColor: COLORS.PRIMARY_COLOR,
                                        inactiveColor: COLORS.GREY_400,
                                        onChanged: (value) {
                                          setState(() {
                                            _valueVoice = value;
                                          });
                                        },
                                        value: _valueVoice,
                                      )
                                  )
                                ],
                              ),
                            )
                        ),
                        AppValue.vSpaceSmall,
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: COLORS.GREY_400),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15, left: 15, top: 17),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      WidgetText(
                                        title: 'Nội dung',
                                        style: AppStyle.DEFAULT_14.copyWith(
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          WidgetText(
                                            title: '${(_valueContent/20).round()}',
                                            style: AppStyle.DEFAULT_14.copyWith(
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          const Padding(
                                            padding:  EdgeInsets.only(bottom: 3),
                                            child: Icon(Icons.star, color: Colors.amber,size: 15,),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SliderTheme(
                                      data: SliderThemeData(
                                          trackHeight: 3,
                                          trackShape: CustomTrackShape(),
                                          thumbShape: const RoundSliderThumbShape(
                                              enabledThumbRadius: 7,
                                          )
                                      ),
                                      child: Slider(
                                        min: 0,
                                        max: 100,
                                        divisions: 5,
                                        thumbColor: COLORS.GREY_400,
                                        activeColor: COLORS.PRIMARY_COLOR,
                                        inactiveColor: COLORS.GREY_400,
                                        onChanged: (value) {
                                          setState(() {
                                            _valueContent = value;
                                          });
                                        },
                                        value: _valueContent,
                                      )
                                  )
                                ],
                              ),
                            )
                        ),
                        AppValue.vSpaceMedium,
                        _buildTextFieldReview(),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
      );
  }
  _buildTextFieldReview() {
          return WidgetInput5(
            maxLine: 10,
            onChanged: (value){
              setState(() {
                _content = value;
              });
            },
            crossAxisAlignment: CrossAxisAlignment.start,
            height: 200,
            boxDecoration: BoxDecoration(
                border: Border.all(
                  color: COLORS.GREY_400, //                   <--- border color
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE
            ),
            hint: 'Nhập đánh giá',
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: const Text('Đánh giá của bạn', style: AppStyle.DEFAULT_16),
            ),
          );
  }

  _buildButtonReview(CreateRateBloc bloc) {
    return WidgetButton3(
      height: 48,
      width: AppValue.widths,
      onTap: (){
        bloc.add(CreateRateSubmitted(voiceStar: (_valueVoice/20).toInt(), contentStar: (_valueContent/20).toInt(),content: _content, id: _id));
      },
      backgroundColor: HexColor('#FF9F00'),
      text: 'Gửi đánh giá',
    );
  }
}
