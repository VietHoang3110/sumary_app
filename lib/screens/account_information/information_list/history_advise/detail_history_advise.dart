import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../bloc/create_advise/create_advise_bloc.dart';
import '../../../../bloc/list_history_advise/list_history_advise_bloc.dart';
import '../../../../bloc/list_issue/list_issue_bloc.dart';
import '../../../../bloc/user_info/user_info_bloc.dart';
import '../../../../src/color.dart';
import '../../../../src/src_index.dart';
import '../../../../widgets/widget_dialog.dart';
import '../../../../widgets/widget_text.dart';
import '../../../../widgets/widgets.dart';

class DetailHistoryAdvise extends StatefulWidget {
  const DetailHistoryAdvise({Key? key,}) : super(key: key);

  @override
  State<DetailHistoryAdvise> createState() => _DetailHistoryAdviseState();
}

class _DetailHistoryAdviseState extends State<DetailHistoryAdvise> {
  String keyword = 'john cena';
  int pageSize = 0;
  int page = 0;

  @override
  void initState() {
    ListIssueBloc.of(context).add(InitGetListIssueEvent(page, pageSize, keyword));
    UserInfoBloc.of(context).add(InitUserInfoEvent());
    super.initState();
  }


  final TextEditingController _editingController=TextEditingController();

  String name = Get.arguments[0];
  String issue = Get.arguments[1];
  String _date = Get.arguments[2];
  String phone = Get.arguments[3];
  String email = Get.arguments[4];
  String content = Get.arguments[5];
  String _idIssue = Get.arguments[6];

  @override
  void dispose() {
    super.dispose();
  }

  bool isSelect = false;
  bool isDate = true;

  @override
  Widget build(BuildContext context) {
    final bloc = CreateAdviseBloc.of(context);
    return Scaffold(
      backgroundColor: COLORS.BACKGROUND,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Chi tiết tham vấn',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              setState(() {
                isSelect = true;
              });
            },
            child: Center(
              child: WidgetText(
                title: 'Sửa',
                style: AppStyle.DEFAULT_16.copyWith(
                  fontWeight: FontWeight.w500,
                  color: COLORS.PRIMARY_COLOR
                ),
              ),
            ),
          ),
          AppValue.hSpaceSmall
        ],
        leading: InkWell(
            onTap: ()=> AppNavigator.navigateBack(),
            child: const Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),
      body: BlocListener<CreateAdviseBloc, CreateAdviseState>(
        listener: (context, state) {
          if (state is SuccessCreateAdvideState) {
            GetSnackBarUtils.removeSnackBar();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return WidgetDialog(
                    title: MESSAGES.NOTIFICATION,
                    content: "Đã chỉnh sửa lịch tư vấn thành công !!",
                    onTap1: (){
                      setState(() {
                        Get.back();
                        Get.back();
                        ListHistoryAdviseBloc.of(context).add(InitGetListHistoryAdviseEvent(1, 10));
                      });
                    }
                );
              },
            );
          }
          if (state is InProgressCreateAdvideState) {
            GetSnackBarUtils.createProgress();
          }
          if (state is FailureCreateAdvideState) {
            GetSnackBarUtils.removeSnackBar();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const WidgetDialog(
                  title: MESSAGES.NOTIFICATION,
                  content: "Kiểm tra lại thông tin tư vấn !!",
                );
              },
            );
          }
        },
        child: Container(
              color: COLORS.WHITE,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 1,
                      color: COLORS.GREY.withOpacity(0.15),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 15,left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppValue.vSpace(20),
                          _buildTextFieldAdvise(name),
                          AppValue.vSpace(24),
                          _buildTextFieldAdvise2(issue),
                          AppValue.vSpace(24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildTextFieldAdvise4(),
                              _buildTextFieldAdvisePhone(phone),
                            ],
                          ),
                          AppValue.vSpace(24),
                          _buildTextFieldAdvise5(email),
                          AppValue.vSpace(24),
                          _buildTextFieldAdvise3(content),
                          AppValue.vSpace(20),
                          isSelect ? _buildButtonAdvise(bloc) : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  _buildTextFieldAdvise(String nameUser) {
    name = nameUser;
    return WidgetInput5(
      readOnly: !isSelect,
      height: 48,
      boxDecoration: BoxDecoration(
          border: Border.all(
            color: COLORS.GREY_400,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5),
          color: COLORS.WHITE
      ),
      onChanged: (value){
        name = value;
      },
      initialValue: nameUser,
      fix: Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: const Text('Tên của bạn', style: AppStyle.DEFAULT_16),
      ),
    );
  }

  _buildTextFieldAdvise2(String issueName) {
    issue = issueName;
    return BlocBuilder<ListIssueBloc, ListIssueState>(
      builder: (context, state) {
        if(state is UpdateGetListIssueState){
          return WidgetInput5(
            height: 48,
            readOnly: true,
            boxDecoration: BoxDecoration(
                border: Border.all(
                  color: COLORS.GREY_400,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE
            ),
            hint: issue,
            endIcon: DropdownButtonHideUnderline(
              child: DropdownButton2(
                barrierDismissible: false,
                onChanged: (value) {
                  setState(() {
                    issue = value.toString();
                  });
                },
                dropdownWidth: AppValue.widths*0.9,
                items: List.generate(state.dataIssue.length, (index) =>
                    DropdownMenuItem<String>(
                        onTap: (){
                          setState(() {
                            _idIssue = state.dataIssue[index].id!;
                            issue = state.dataIssue[index].name!;
                          });
                        },
                        value: state.dataIssue[index].name!,
                        child: Text(state.dataIssue[index].name!)
                    )
                ),
              ),
            ),
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: const Text('Vấn đề gặp phải', style: AppStyle.DEFAULT_16),
            ),
          );
        }
        else{
          return Container();
        }
      },
    );
  }

  _buildTextFieldAdvise3(String content1) {
    content = content1;
    return WidgetInput5(
      readOnly: !isSelect,
      maxLine: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      height: 150,
      onChanged: (value){
        setState(() {
          content = value;
        });
      },
      boxDecoration: BoxDecoration(
          border: Border.all(
            color: COLORS.GREY_400, //                   <--- border color
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5),
          color: COLORS.WHITE
      ),
      initialValue: content,
      fix: Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: const Text('Nội dung tư vấn', style: AppStyle.DEFAULT_16),
      ),
    );
  }

  _buildTextFieldAdvise4() {
    return InkWell(
      onTap: (){
        setState(() {
          DatePicker.showDateTimePicker(context,
              showTitleActions: true,
              minTime: DateTime.now(),
              maxTime: DateTime(2050, 12, 31),
              onChanged: (date) {
                isDate = false;
                setState(() {
                  _editingController.text=AppValue.formatStringDate(date.toString());
                });
              },
              onConfirm: (date) {
                _editingController.text=AppValue.formatStringDate(date.toString());
              },
              currentTime: DateTime.now(),
              locale: LocaleType.vi);
        });
      },
      child: WidgetInput2(
        height: 48,
        enabled: false,
        crossAxisAlignment: CrossAxisAlignment.start,
        width: Get.width*0.5-20,
        boxDecoration: BoxDecoration(
            border: Border.all(
              color: COLORS.GREY_400,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5),
            color: COLORS.WHITE
        ),
        inputController: _editingController,
        endIcon: const Icon(Icons.date_range, color: COLORS.GREY_400
        ),
        // initialValue: _date,
        hint: _date,
        fix: Container(
          decoration: const BoxDecoration(
              color: Colors.white
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: const Text('Đặt lịch tư vấn', style: AppStyle.DEFAULT_16),
        ),
      ),
    );
  }

  _buildTextFieldAdvise5(String emailUser) {
    email = emailUser;
    return WidgetInput2(
      readOnly: !isSelect,
      onChanged: (value){
        setState(() {
          email = value;
        });
      },
      crossAxisAlignment: CrossAxisAlignment.start,
      height: 48,
      boxDecoration: BoxDecoration(
          border: Border.all(
            color: COLORS.GREY_400, //                   <--- border color
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5),
          color: COLORS.WHITE
      ),
      initialValue: emailUser,
      fix: Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: const Text('Email', style: AppStyle.DEFAULT_16),
      ),
    );
  }

  _buildTextFieldAdvisePhone(String nbPhone) {
    phone = nbPhone;
    return WidgetInput2(
      readOnly: !isSelect,
      onChanged: (value){
        setState(() {
          phone = value;
        });
      },
      inputType: TextInputType.phone,
      crossAxisAlignment: CrossAxisAlignment.start,
      height: 48,
      width: Get.width*0.5-20,
      boxDecoration: BoxDecoration(
          border: Border.all(
            color: COLORS.GREY_400, //                   <--- border color
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5),
          color: COLORS.WHITE
      ),
      initialValue: phone,
      fix: Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: const Text('Số điện thoại', style: AppStyle.DEFAULT_16),
      ),
    );
  }


  _buildButtonAdvise(CreateAdviseBloc bloc) {
    return BlocBuilder<CreateAdviseBloc, CreateAdviseState>(
        builder: (context, state) {
          return WidgetButton(
            height: 48,
            onTap: (){
              if(isDate){
                bloc.add(CreateAdviseSubmitted(name: name, issueType: _idIssue, appointmentDate: AppValue.formatStringDate(_date), email: email, content: content, phoneNumber: phone.toInt(),note: ''));
              }else{
                bloc.add(CreateAdviseSubmitted(name: name, issueType: _idIssue, appointmentDate: _editingController.text, email: email, content: content, phoneNumber: phone.toInt(),note: ''));
              }
            },
            backgroundColor: HexColor('#FF9F00'),
            text: 'Đặt lịch tư vấn',
          );
        }
    );
  }
}
