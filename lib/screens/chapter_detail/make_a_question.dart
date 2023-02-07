import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/list_ask/list_ask_bloc.dart';

import '../../bloc/blocs.dart';
import '../../src/src_index.dart';
import '../../widgets/widgets.dart';

class MakeAQuestion extends StatefulWidget {
  const MakeAQuestion({Key? key}) : super(key: key);

  @override
  State<MakeAQuestion> createState() => _MakeAQuestionState();
}

class _MakeAQuestionState extends State<MakeAQuestion> {
  final String _id = Get.arguments;

  @override
  void initState() {
    ListAskBloc.of(context).add(InitGetListAskEvent(_id, 0, 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.BACKGROUND,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Danh sách câu hỏi',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: () => AppNavigator.navigateBack(),
            child: const Icon(Icons.arrow_back, color: Colors.black,)
        ),
      ),
      body: BlocBuilder<ListAskBloc, ListAskState>(
          builder: (context, state) {
            if (state is UpdateGetListAskState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: AppValue.heights * 0.85 - 40,
                    child:  SingleChildScrollView(
                      child: state.data.records.isNotEmpty ? Column(
                          children:  List.generate(
                              state.data.records.length,
                                  (index) => Column(
                                    children: [
                                      AppValue.vSpaceTiny,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipOval(
                                              child: Image.asset('assets/images/img.png',
                                                width: 30,
                                                height: 30,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    WidgetText(
                                                      title:state.data.records[index].name,
                                                      style: AppStyle.DEFAULT_14.copyWith(
                                                          fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                    AppValue.hSpaceTiny,
                                                    WidgetText(
                                                      title: AppValue.formatDate(state.data.records[index].createdAt.toString()),
                                                      style: AppStyle.DEFAULT_14.copyWith(
                                                          fontSize: 10,
                                                          color: COLORS.RED
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: AppValue.widths * 0.85,
                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      WidgetText(
                                                        title: state.data.records[index].question,
                                                        style: AppStyle.DEFAULT_12.copyWith(
                                                          color: HexColor('#707070'),
                                                        ),
                                                        textAlign: TextAlign
                                                            .justify,
                                                      ),
                                                      AppValue.vSpace(5),
                                                      Container(
                                                        width: AppValue.widths,
                                                        height: 1,
                                                        color: COLORS
                                                            .GREY_400,
                                                      ),
                                                      AppValue.vSpace(5),
                                                      RichText(
                                                        text: TextSpan(text: 'Admin: ',
                                                          style: AppStyle.DEFAULT_12,
                                                          children: [
                                                            TextSpan(
                                                                text: state.data.records[index].answer ?? "",
                                                                style: AppStyle.DEFAULT_12.copyWith(
                                                                    color: HexColor('#707070')
                                                                )
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      AppValue.vSpaceTiny,
                                      Container(
                                        width: AppValue.widths,
                                        height: 1,
                                        color: COLORS.GREY_400,
                                      )
                                    ],
                                  )
                          )
                      ) :  SizedBox(
                          height: AppValue.heights,
                          child: Center(
                              child: Column(
                                children: const [
                                  AppValue.vSpaceLarge,
                                  WidgetContainerImage(
                                    image: 'assets/images/no_item.png',
                                    width: 146,
                                    height: 146,
                                    fit: BoxFit.contain,
                                  ),
                                  Text('Chưa có câu hỏi !!!'),
                            ],
                          ))),
                    ),
                  ),
                  _buildButtonQuestion()
                ],
              );
            }
            else {
              return Container();
            }
          }
      ),
    );
  }

  _buildButtonQuestion() {
    return WidgetButton3(
      height: 45,
      // onTap: () => state.status.isValidated ? bloc.add(FormSubmitted()) : null,
      onTap: () => AppNavigator.navigateMakeAQuestion2(_id),
      //enable: state.status.isValidated,
      backgroundColor: HexColor('#FF9F00'),
      text: 'Đặt câu hỏi',
    );
  }
}
