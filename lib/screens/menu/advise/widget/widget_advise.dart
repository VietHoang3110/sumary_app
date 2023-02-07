import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sumary_app/bloc/create_advise/create_advise_bloc.dart';
import 'package:sumary_app/bloc/list_issue/list_issue_bloc.dart';
import '../../../../bloc/blocs.dart';
import '../../../../bloc/user_info/user_info_bloc.dart';
import '../../../../src/src_index.dart';
import '../../../../storages/storages.dart';
import '../../../../widgets/widgets.dart';

class widget_advise extends StatefulWidget {
  const widget_advise({
    Key? key,
  }) : super(key: key);

  @override
  State<widget_advise> createState() => _widget_adviseState();
}

class _widget_adviseState extends State<widget_advise> {


  String keyword = 'john cena';
  int pageSize = 10;
  int page = 1;

  @override
  void initState() {
    ListIssueBloc.of(context).add(InitGetListIssueEvent(page, pageSize, keyword));
    UserInfoBloc.of(context).add(InitUserInfoEvent());
    super.initState();
  }

  late String _date = 'Thời gian';
  final TextEditingController _editingController=TextEditingController();
  final TextEditingController _editingController1=TextEditingController();
  final TextEditingController _editingController2=TextEditingController();
  final TextEditingController _editingController3=TextEditingController();
  final TextEditingController _editingController4=TextEditingController();

  String issue = "Chọn nguyên nhân";
  String _idIssue = '';
  String name = '';
  String contact = '';
  String content = '';
  String phone = '';
  String email = '';

  @override
  void dispose() {
    _editingController1.dispose();
    _editingController2.dispose();
    _editingController3.dispose();
    _editingController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = CreateAdviseBloc.of(context);
    return BlocListener<CreateAdviseBloc, CreateAdviseState>(
      listener: (context, state) {
        if (state is SuccessCreateAdvideState) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WidgetDialog(
                  title: MESSAGES.NOTIFICATION,
                  content: "Tạo lịch tư vấn thành công !!",
                  onTap1: (){
                    Get.back();
                    setState((){
                      _editingController1.clear();
                      issue = "Chọn nguyên nhân";
                      _editingController.clear();
                      _editingController2.clear();
                      _editingController3.clear();
                      _editingController4.clear();
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
                child: AvoidKeyboard(
                  child: FocusTraversalGroup(
                    policy: OrderedTraversalPolicy(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppValue.vSpace(10),
                        ((shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null)) ? BlocBuilder<UserInfoBloc, UserInfoState>(
                          builder: (context, state) {
                            if(state is UpdateUserInfoState){
                              return _buildTextFieldAdvise(state.data.name);
                            }
                            else{
                              return Container();
                            }
                          },
                        ) : _buildTextFieldAdviseNoUser(),
                        AppValue.vSpace(24),
                        _buildTextFieldAdvise2(),
                        AppValue.vSpace(24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildTextFieldAdvise4(),
                            _buildTextFieldAdvisePhone(),
                          ],
                        ),
                        AppValue.vSpace(24),
                        ((shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null)) ? BlocBuilder<UserInfoBloc, UserInfoState>(
                          builder: (context, state) {
                            if(state is UpdateUserInfoState){
                              return _buildTextFieldAdvise5(state.data.email);
                            }
                            else{
                              return Container();
                            }
                          },
                        ) : _buildTextFieldAdvise5NoUser(),
                        AppValue.vSpace(24),
                        _buildTextFieldAdvise3(),
                        AppValue.vSpace(20),
                        _buildButtonAdvise(bloc)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextFieldAdvise(String nameUser) {
    name = nameUser;
    return WidgetInput5(
      // inputController: _editingController1,
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
      // hint: 'Nhập tên',
      fix: Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: const Text('Tên của bạn', style: AppStyle.DEFAULT_16),
      ),
    );
  }

  _buildTextFieldAdviseNoUser() {
    name = '';
    return WidgetInput5(
      inputController: _editingController1,
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
      hint: 'Nhập tên',
      fix: Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: const Text('Tên của bạn', style: AppStyle.DEFAULT_16),
      ),
    );
  }

  _buildTextFieldAdvise2() {
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
            // initialValue: issue,
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
            //   errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
          );
        }
        else{
          return Container();
        }
      },
    );
  }

  _buildTextFieldAdvise3() {
    return WidgetInput5(
      inputController: _editingController2,
      maxLine: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      height: 120,
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
      hint: 'Tóm tắt câu chuyện của bạn',
      fix: Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: const Text('Nội dung tư vấn', style: AppStyle.DEFAULT_16),
      ),
      //   errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
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
              color: COLORS.GREY_400, //                   <--- border color
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5),
            color: COLORS.WHITE
        ),
        inputController: _editingController,
        endIcon: const Icon(Icons.date_range, color: COLORS.GREY_400
        ),
        hint: _date,
        fix: Container(
          decoration: const BoxDecoration(
              color: Colors.white
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: const Text('Đặt lịch tư vấn', style: AppStyle.DEFAULT_16),
        ),
        //   errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
      ),
    );
  }

  _buildTextFieldAdvise5(String emailUser) {
    email = emailUser;
    return WidgetInput2(
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
      //   errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
    );
  }

  _buildTextFieldAdvisePhone() {
    return WidgetInput2(
      inputController: _editingController4,
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
      hint: 'Nhập số điện thoại',
      fix: Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: const Text('Số điện thoại', style: AppStyle.DEFAULT_16),
      ),
      //   errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
    );
  }

  _buildTextFieldAdvise5NoUser() {
    return WidgetInput2(
      inputController: _editingController3,
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
      hint: 'Nhập email',
      fix: Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: const Text('Email', style: AppStyle.DEFAULT_16),
      ),
      //   errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
    );
  }

  _buildButtonAdvise(CreateAdviseBloc bloc) {
    return BlocBuilder<CreateAdviseBloc, CreateAdviseState>(
        builder: (context, state) {
          return WidgetButton(
            height: 48,
            onTap: (){
              if(shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null){
                if(name != '' && email != '' && content != '' && phone != ''){
                  bloc.add(CreateAdviseSubmitted(name: name, issueType: _idIssue, appointmentDate: _editingController.text, email: email, content: content, phoneNumber: phone.toInt(),note: ''));
                }
                else{
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
              }
              else{
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const WidgetDialog(
                      title: MESSAGES.NOTIFICATION,
                      content: "Bạn cần đăng nhập để đặt lịch tư vấn !!",
                    );
                  },
                );
              }
            },
            backgroundColor: HexColor('#FF9F00'),
            text: 'Đặt lịch tư vấn',
          );
        }
    );
  }
}