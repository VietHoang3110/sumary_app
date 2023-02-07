import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/create_ask/create_ask_bloc.dart';
import 'package:sumary_app/bloc/list_ask/list_ask_bloc.dart';
import 'package:sumary_app/bloc/updateProfile/update_profile_bloc.dart';

import '../../bloc/blocs.dart';
import '../../bloc/user_info/user_info_bloc.dart';
import '../../src/spacing.dart';
import '../../src/src_index.dart';
import '../../widgets/widgets.dart';

class MakeAQuestion2 extends StatefulWidget {
  const MakeAQuestion2({Key? key}) : super(key: key);

  @override
  State<MakeAQuestion2> createState() => _MakeAQuestion2State();
}

class _MakeAQuestion2State extends State<MakeAQuestion2> {
  final String _id = Get.arguments;
  late String _name = '';
  late String _question = '';

  @override
  void initState() {
    super.initState();
    UserInfoBloc.of(context).add(InitUserInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = CreateAskBloc.of(context);
    return BlocListener<CreateAskBloc, CreateAskState>(
      listener: (context, state) {
        if (state is SuccessCreateAskState) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WidgetDialog(
                  title: MESSAGES.NOTIFICATION,
                  content: MESSAGES.SUCCESS,
                  onTap1: (){
                    Get.back();
                    Get.back();
                    ListAskBloc.of(context).add(InitGetListAskEvent(_id, 0, 0));
                    AppNavigator.navigateMakeAQuestion(_id);
                  }
              );
            },
          );
        }
        if (state  is InProgressCreateAskState) {
          GetSnackBarUtils.createProgress();
        }
        if (state is FailureCreateAskState) {
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
        }
      },
      child: Scaffold(
        backgroundColor: COLORS.BACKGROUND,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: WidgetText(
            title: 'Đặt câu hỏi',
            style: AppStyle.DEFAULT_16.copyWith(
                fontWeight: FontWeight.w500
            ),
          ),
          leading: InkWell(
              onTap: ()=> AppNavigator.navigateBack(),
              child: const Icon(Icons.arrow_back,color: Colors.black,)
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: Get.height-60-Spacing.viewPadding.top,
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height:Get.height-48-60-Spacing.viewPadding.top,
                        ),
                        _buildButtonQuestion(bloc)
                      ],
                    )
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppValue.vSpaceTiny,
                        BlocBuilder<UserInfoBloc, UserInfoState>(
                          builder: (context, state) {
                            if(state is UpdateUserInfoState){
                              return _buildTextFieldName(state.data.name);
                            }
                            else{
                              return Container();
                            }
                          },
                        ),
                        AppValue.vSpace(24),
                        _buildTextFieldQuestion(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // _buildTextFieldName() {
  //   return WidgetInput5(
  //     height: 48,
  //     onChanged: (value){
  //       _name = value;
  //     },
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     inputType: TextInputType.emailAddress,
  //     boxDecoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(5),
  //         color: COLORS.WHITE,
  //         border: Border.all(
  //             color: COLORS.GREY_400,
  //             width: 1
  //         )
  //     ),
  //     hint: 'Nhập tên của bạn',
  //     fix: Container(
  //       decoration: const BoxDecoration(
  //           color: Colors.white
  //       ),
  //       padding: const EdgeInsets.symmetric(horizontal: 6),
  //       child: const Text('Tên của bạn', style: AppStyle.DEFAULT_16),
  //     ),
  //   );
  // }


  _buildTextFieldName(String initialValue) {
    _name = initialValue;
      return WidgetInput5(
        height: 48,
        onChanged: (value) => _name = value,
        boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: COLORS.WHITE,
            border: Border.all(
                color: COLORS.GREY_400,
                width: 1
            )
        ),
        initialValue: initialValue,
        fix: Container(
          decoration: const BoxDecoration(
              color: Colors.white
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text('Tên của bạn', style: AppStyle.DEFAULT_16),
        ),
      );
  }

  _buildTextFieldQuestion() {
      return WidgetInput5(
        onChanged: (value){
          _question = value;
        },
        height: 200,
        crossAxisAlignment: CrossAxisAlignment.start,
        inputType: TextInputType.emailAddress,
        boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: COLORS.WHITE,
            border: Border.all(
                color: COLORS.GREY_400,
                width: 1
            )
        ),
        hint: 'Nhập nội dung',
        fix: Container(
          decoration: const BoxDecoration(
              color: Colors.white
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: const Text('Nhập câu hỏi', style: AppStyle.DEFAULT_16),
        ),
      );
  }

  _buildButtonQuestion(CreateAskBloc bloc) {
    return BlocBuilder<CreateAskBloc, CreateAskState>(
        builder: (context, state) {
          return WidgetButton3(
            height: 48,
            onTap: ()=>bloc.add(CreateAskSubmitted(id: _id, name: _name, question: _question)),
            //enable: state.status.isValidated,
            backgroundColor: HexColor('#FF9F00'),
            text: 'Gửi câu hỏi',
          );
        }
    );
  }
}

