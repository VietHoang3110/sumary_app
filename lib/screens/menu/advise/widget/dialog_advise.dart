import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../bloc/create_advise/create_advise_bloc.dart';
import '../../../../bloc/list_issue/list_issue_bloc.dart';
import '../../../../src/src_index.dart';
import '../../../../storages/share_local.dart';
import '../../../../widgets/widgets.dart';

class DialogAdvise extends StatefulWidget {
  String? name;
  String? email;
  String? phone;
  DialogAdvise({
    Key? key,
    this.name,
    this.email,
    this.phone
  }) : super(key: key);

  @override
  State<DialogAdvise> createState() => _DialogAdviseState();
}

class _DialogAdviseState extends State<DialogAdvise> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _issueController = TextEditingController();


  int indexIssue = -1;
  String idIssue = '';
  String _date = '';

  @override
  void initState() {
    _nameController.text = (widget.name ?? '').toString();
    _emailController.text = (widget.email ?? '').toString();
    _phoneController.text = (widget.phone ?? '').toString();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    _issueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        content: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Image.asset("assets/icons/diaLog_t.png",
                        height: AppValue.heights*0.171,
                      ),
                    ),
                    Container(
                      width: AppValue.widths,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              colors: [
                                COLORS.PRIMARY_COLOR,
                                COLORS.PRIMARY_COLOR2,
                              ]
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text("ĐẶT LỊCH TƯ VẤN", style: AppStyle.DEFAULT_16.copyWith(fontSize: 23, fontWeight: FontWeight.w600, color: COLORS.WHITE), textAlign: TextAlign.center,),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: AppValue.heights*0.08),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WidgetText(
                            title: "Tên của bạn",
                            style: AppStyle.DEFAULT_14,
                          ),
                          WidgetInputkk(
                            inputController: _nameController,
                            hint: "Nhập tên",
                          ),

                          Container(
                            width: AppValue.widths,
                            height: 1,
                            color:  COLORS.PRIMARY_COLOR,
                          ),
                          AppValue.vSpaceTiny,
                          AppValue.vSpaceVrTiny,

                          WidgetText(
                            title: "Liên hệ",
                            style: AppStyle.DEFAULT_14,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width:AppValue.widths*0.415,
                                child: WidgetInputkk(
                                  inputController: _emailController,
                                  hint: "Email của bạn",
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset("assets/icons/gold_phone.svg"),
                              AppValue.hSpaceTiny,
                              SizedBox(
                                width:AppValue.widths*0.2,
                                child: WidgetInputkk(
                                  inputController: _phoneController,
                                  hint: "Số điện thoại",
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: AppValue.widths,
                            height: 1,
                            color:  COLORS.PRIMARY_COLOR,
                          ),
                          AppValue.vSpaceTiny,
                          AppValue.vSpaceVrTiny,
                          WidgetText(
                            title: "Vấn đề gặp phải",
                            style: AppStyle.DEFAULT_14,
                          ),
                          InkWell(
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DialogIssue(
                                    onChangeIssue: (value){
                                      setState(() {
                                        _issueController.text = value;
                                      });
                                    },
                                    onChangeIdIssue: (value){
                                      setState(() {
                                        idIssue = value;
                                      });
                                    },
                                    onChangeIndexIssue: (value){
                                      setState(() {
                                        indexIssue = value;
                                      });
                                    },
                                    indexIssue: indexIssue,
                                    idIssue: idIssue,
                                    issue: _issueController.text,
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: AppValue.widths*0.55,
                                  child: WidgetInputkk(
                                    enabled: false,
                                    inputController: _issueController,
                                    hint: "Chọn nguyên nhân",
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                    child: SvgPicture.asset("assets/icons/drd.svg")),
                                AppValue.hSpaceTiny
                              ],
                            ),
                          ),
                          Container(
                            width: AppValue.widths,
                            height: 1,
                            color:  COLORS.PRIMARY_COLOR,
                          ),
                          AppValue.vSpaceTiny,
                          AppValue.vSpaceVrTiny,
                          WidgetText(
                            title: "Ngày đặt hẹn",
                            style: AppStyle.DEFAULT_14,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: AppValue.widths*0.5,
                                child: WidgetInputkk(
                                  enabled: false,
                                  inputController: _dateController,
                                  hint: "Thời gian",
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                  onTap: (){
                                    setState(() {
                                      DatePicker.showDateTimePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime.now(),
                                          maxTime: DateTime(2050, 12, 31),
                                          onChanged: (date) {
                                            setState(() {
                                              _date=AppValue.formatStringDate(date.toString());
                                              _dateController.text=AppValue.formatStringDate1(date.toString());
                                            });
                                          },
                                          onConfirm: (date) {
                                            _date=AppValue.formatStringDate(date.toString());
                                            _dateController.text=AppValue.formatStringDate1(date.toString());
                                          },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.vi);
                                    });
                                  },
                                  child: SvgPicture.asset("assets/icons/calculator.svg")
                              ),
                              AppValue.hSpaceTiny
                            ],
                          ),
                          Container(
                            width: AppValue.widths,
                            height: 1,
                            color:  COLORS.PRIMARY_COLOR,
                          ),
                        ],
                      ),
                    )

                  ],
                ),

                AppValue.vSpaceTiny,

                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset("assets/icons/Vector 12.png",),
                    ),
                    buildSubmitAdvise(),
                  ],
                ),
              ],
            ),
          ),

        )
    );
  }

   buildSubmitAdvise() {
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
                  content: state.message,
                  onTap1: (){
                    Get.back();
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
              return WidgetDialog(
                title: MESSAGES.NOTIFICATION,
                content: state.message,
              );
            },
          );
        }
      },
      child: InkWell(
          onTap:  (){
            if(((shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null))){
              CreateAdviseBloc.of(context).add(CreateAdviseSubmitted(
                  name: _nameController.text,
                  email: _emailController.text,
                  phoneNumber: _phoneController.text.toInt(),
                  issueType: idIssue,
                  appointmentDate: _date,
                  note: '',
                  content: ''
              ));
            }else{
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
          child: Container(
            width: AppValue.widths*0.55,
            height: 40 ,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1,color: COLORS.PRIMARY_COLOR.withOpacity(0.5)),
                color: COLORS.PRIMARY_COLOR
            ),
            child: Center(
              child: Text("XÁC NHẬN", style: AppStyle.DEFAULT_14.copyWith(fontSize: 18, color: COLORS.WHITE, fontWeight: FontWeight.w500, height: 1 ),textAlign: TextAlign.center,),
            ),
          ),
        ),
    );
  }
}

class DialogIssue extends StatefulWidget {
  DialogIssue({
    Key? key,
    required this.onChangeIssue,
    required this.onChangeIdIssue,
    required this.onChangeIndexIssue,
    required this.indexIssue,
    required this.idIssue,
    required this.issue
  }) : super(key: key);

  Function onChangeIssue;
  Function onChangeIdIssue;
  Function onChangeIndexIssue;
  String idIssue;
  String issue;
  int indexIssue;

  @override
  State<DialogIssue> createState() => _DialogIssueState();
}

class _DialogIssueState extends State<DialogIssue> {

  @override
  void initState() {
    ListIssueBloc.of(context).add(InitGetListIssueEvent(0, 0, 'john cena'));
    super.initState();
  }

  // int indexIssue = -1;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: EdgeInsets.only(left: AppValue.widths*0.31, right: AppValue.widths*0.2, top: AppValue.heights*0.28),
        contentPadding: EdgeInsets.zero,
        //clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        content: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
          ),
          child: SingleChildScrollView(
            child: BlocBuilder<ListIssueBloc, ListIssueState>(
              builder: (context, state) {
                if(state is UpdateGetListIssueState){
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(state.dataIssue.length,
                            (index) => selectIssue(
                          onClick: (){
                            setState(() {
                              widget.indexIssue = index;
                            });
                            widget.issue = state.dataIssue[index].name.toString();
                            widget.idIssue = state.dataIssue[index].id.toString();
                            widget.onChangeIssue(state.dataIssue[index].name.toString());
                            widget.onChangeIdIssue(state.dataIssue[index].id.toString());
                            widget.onChangeIndexIssue(index);
                          },
                          title: state.dataIssue[index].name.toString(),
                          index: index,
                          select: widget.indexIssue,
                        )
                    ),
                  );
                }
                else{
                  return Container();
                }
              },
            ),
          ),
        )
    );
  }
}


class selectIssue extends StatelessWidget {
  final String? title;
  final Function onClick;
  final int index;
  final int select;
  selectIssue({
    Key? key,
    this.title,
    required this.onClick,
    required this.index,
    required this.select
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
          onClick();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        child: Container(
          decoration: BoxDecoration(
            color: COLORS.WHITE,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 8,),
                  index != select
                      ? SvgPicture.asset("assets/icons/unchoosen.svg")
                      : SvgPicture.asset("assets/icons/choosenItem.svg"),
                  AppValue.hSpaceSmall,
                  WidgetText(
                    title: title,
                    style: index != select
                        ? AppStyle.DEFAULT_14
                        : AppStyle.DEFAULT_14.copyWith(color:COLORS.PRIMARY_COLOR),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Container(
                color: COLORS.GREY_EB,
                width: AppValue.widths,
                height: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
