import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sumary_app/bloc/buy_book/buy_book_bloc.dart';
import 'package:sumary_app/bloc/my_rank_member/my_rank_member_bloc.dart';
import 'package:sumary_app/src/spacing.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../../../../src/color.dart';
import '../../bloc/blocs.dart';
import '../../bloc/user_info/user_info_bloc.dart';
import '../../widgets/widgets.dart';
import '../account_information/top_up/modal_top_up.dart';

class Modal_Sheet extends StatefulWidget {
  Modal_Sheet({Key? key,
    required this.changeStatus,
    required this.name,
    required this.price,
    required this.id,
  }) : super(key: key);

  Function? changeStatus;
  String name;
  int price;
  String id;

  @override
  State<Modal_Sheet> createState() => _Modal_SheetState();
}
enum SingingCharacter { BUY_USE_WALLET, BUY_USE_CARD, BUY_PACK }

class _Modal_SheetState extends State<Modal_Sheet> {
  SingingCharacter? _character = SingingCharacter.BUY_USE_WALLET;

  @override
  void initState() {
    super.initState();
    UserInfoBloc.of(context).add(InitUserInfoEvent());
    MyRankBloc.of(context).add(InitGetMyRankEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset('assets/images/clip3.png',fit: BoxFit.contain),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20,right: 15, left: 15,bottom: Spacing.viewPadding.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: WidgetText(
                          title: widget.name,
                          style: AppStyle.DEFAULT_16_BOLD.copyWith(
                              fontWeight: FontWeight.w600
                          ),
                          maxLine: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: WidgetText(
                          title: '${widget.price.round().toString()} Bcoin',
                          style: AppStyle.DEFAULT_14.copyWith(
                              color: HexColor('#EE4D2C')
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset('assets/icons/icon_exit.svg')
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(width: AppValue.widths, height: 1, color: COLORS.GREY_400,),
                  ),

                  WidgetText(
                    title: 'Thanh toán bằng',
                    style: AppStyle.DEFAULT_18,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                BlocBuilder<UserInfoBloc, UserInfoState>(
                  builder: (context, state) {
                    if(state is UpdateUserInfoState){
                      return RadioListTile(
                        title: Row(
                          children: [
                            WidgetText(
                              title: 'Ví của tôi',
                              style: AppStyle.DEFAULT_14,
                            ),
                            AppValue.hSpaceTiny,
                            WidgetText(
                              title: '(${state.data.bcoin!.round()} Bcoin)',
                              style: AppStyle.DEFAULT_12.copyWith(
                                  color: COLORS.GREY
                              ),
                            )
                          ],
                        ),
                        activeColor: COLORS.PRIMARY_COLOR,
                        value: SingingCharacter.BUY_USE_WALLET,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      );
                    }
                    else{
                      return Container();
                    }
                  },
                ),
                BlocBuilder<MyRankBloc, MyRankState>(
                  builder: (context, state) {
                    if(state is UpdateGetMyRankState){
                      return RadioListTile(
                        title: Row(
                          children: [
                            WidgetText(
                              title: 'Thẻ hội viên',
                              style: AppStyle.DEFAULT_14,
                            ),
                            AppValue.hSpaceTiny,
                            WidgetText(
                              title: '(còn ${state.data.book_for_free??0} cuốn)',
                              style: AppStyle.DEFAULT_12.copyWith(
                                  color: COLORS.GREY
                              ),
                            )
                          ],
                        ),
                        activeColor: COLORS.PRIMARY_COLOR,
                        value: SingingCharacter.BUY_USE_CARD,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      );
                    }
                    else{
                      return Container();
                    }
                  },
                ),
                RadioListTile(
                  title: Row(
                    children: [
                      WidgetText(
                        title: 'Gói dịch vụ tâm sách',
                        style: AppStyle.DEFAULT_14,
                      ),
                      AppValue.hSpaceTiny,
                      WidgetText(
                        title: '(chưa đăng ký)',
                        style: AppStyle.DEFAULT_12.copyWith(
                            color: COLORS.GREY
                        ),
                      )
                    ],
                  ),
                  activeColor: COLORS.PRIMARY_COLOR,
                  value: SingingCharacter.BUY_PACK,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                )
              ],
            ),

            _buildButtonPayment()
          ],
        ),
      ],
    );
  }
  _buildButtonPayment() {
    return WidgetButton3(
      height: 48,
      onTap: (){
        if(_character != SingingCharacter.BUY_PACK){
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                DialogPayment(
                  changeStatus: (){
                    widget.changeStatus!();
                  },
                  price: widget.price,
                  id: widget.id,
                  typePay: _character.toString().split(".").last,
                ),
          );
        }else{
          AppNavigator.navigateSevice_Pack1();
        }
      },
      backgroundColor: HexColor('#FF9F00'),
      text: 'Thanh toán',
    );
  }
}

class DialogPayment extends StatefulWidget {
  DialogPayment({
    Key? key,
    required this.changeStatus,
    required this.price,
    required this.id,
    required this.typePay,

  }) : super(key: key);

  Function? changeStatus;
  int price;
  String id;
  String typePay;

  @override
  State<DialogPayment> createState() => _DialogPaymentState();
}

class _DialogPaymentState extends State<DialogPayment> {
  bool check = false;

  @override
  void initState() {
    super.initState();
    if(widget.typePay == "BUY_USE_WALLET"){
      check = true;
    }else{
      check = false;
    };
  }
  @override
  Widget build(BuildContext context) {
    final bloc = BuyBookBloc.of(context);
    return BlocListener<BuyBookBloc, BuyBookState>(
      listener: (context, state) {
        if (state is SuccessBuyBookState) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                // actionsPadding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                content: WidgetText(
                  title: 'Đã mua Tâm sách, bạn có thể đọc/nghe ngoại tuyến (offline) ở Kệ sách',
                  style: AppStyle.DEFAULT_18.copyWith(
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.back();
                      Get.back();
                      Get.back();
                      Get.back();
                      AppNavigator.navigateBookDetailMain(widget.id);
                    },
                    child: Container(
                      width: Get.width,
                      height: 45,
                      decoration: BoxDecoration(
                          color: COLORS.PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: WidgetText(
                          title: 'Đã hiểu',
                          style: AppStyle.DEFAULT_18.copyWith(
                              color: COLORS.WHITE
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
        else if (state is InProgressBuyBookState) {
          GetSnackBarUtils.createProgress();
        }
        else if (state is FailureBuyBookState) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actionsPadding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                content: check ? SizedBox(
                  width: Get.width,
                  height: 50,
                  child: Column(
                    children: [
                      WidgetText(
                        title: 'Thanh toán thất bại',
                        style: AppStyle.DEFAULT_18.copyWith(
                            fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.center,
                      ),
                      WidgetText(
                        title: 'Số tiền trong ví của bạn không đủ!',
                        style: AppStyle.DEFAULT_16.copyWith(
                            fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ) : SizedBox(
                  width: Get.width*0.9,
                  height: 70,
                  child: Column(
                    children: [
                      WidgetText(
                        title: 'Thanh toán thất bại',
                        style: AppStyle.DEFAULT_18.copyWith(
                            fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.center,
                      ),
                      WidgetText(
                        title: state.message,
                        style: AppStyle.DEFAULT_16.copyWith(
                            fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  check ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                          Get.back();
                          Get.back();
                          Get.back();
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (context) => SingleChildScrollView(
                              controller: ModalScrollController.of(context),
                              child: const modal_top_up(),
                            ),
                          );
                        },
                        child: Container(
                          width: Get.width/3,
                          height: 45,
                          decoration: BoxDecoration(
                              color: COLORS.PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: WidgetText(
                              title: 'Nạp ngay',
                              style: AppStyle.DEFAULT_18.copyWith(
                                  color: COLORS.WHITE
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                          Get.back();
                          Get.back();
                        },
                        child: Container(
                          width: Get.width/3,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: COLORS.WHITE,
                              border: Border.all(width: 1,color: COLORS.PRIMARY_COLOR)
                          ),
                          child: Center(
                            child: WidgetText(
                              title: 'Hủy',
                              style: AppStyle.DEFAULT_18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ) : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                          Get.back();
                          Get.back();
                        },
                        child: Container(
                          width: Get.width/3,
                          height: 45,
                          decoration: BoxDecoration(
                              color: COLORS.PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: WidgetText(
                              title: 'Đồng ý',
                              style: AppStyle.DEFAULT_18.copyWith(
                                  color: COLORS.WHITE
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                          Get.back();
                          Get.back();
                        },
                        child: Container(
                          width: Get.width/3,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: COLORS.WHITE,
                              border: Border.all(width: 1,color: COLORS.PRIMARY_COLOR)
                          ),
                          child: Center(
                            child: WidgetText(
                              title: 'Hủy',
                              style: AppStyle.DEFAULT_18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
          GetSnackBarUtils.createFailure(message: state.message);
        }
      },
      child: AlertDialog(
        actionsPadding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: SizedBox(
          height: 50,
          width: Get.width*0.9,
          child: Column(
            children: [
              WidgetText(
                title: 'Xác nhận thanh toán',
                style: AppStyle.DEFAULT_18.copyWith(
                    fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
              check ? WidgetText(
                title: '${widget.price} Bcoin',
                style: AppStyle.DEFAULT_18.copyWith(
                    fontWeight: FontWeight.w500,
                    color: COLORS.RED
                ),
                textAlign: TextAlign.center,
              ) : WidgetText(
                title: 'Sử dụng lượt mua sách miễn phí',
                style: AppStyle.DEFAULT_18.copyWith(
                    fontWeight: FontWeight.w500,
                    color: COLORS.RED
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAgree(bloc),
              AppValue.hSpaceSmall,
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: Get.width/3,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: COLORS.WHITE,
                      border: Border.all(width: 1,color: COLORS.PRIMARY_COLOR)
                  ),
                  child: Center(
                    child: WidgetText(
                      title: 'Hủy',
                      style: AppStyle.DEFAULT_18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  _buildAgree(BuyBookBloc bloc) {
    return GestureDetector(
      onTap: (){
        // Get.back();
        // Get.back();
        bloc.add(BuyBookSubmitted(id: widget.id, payment_type: widget.typePay));
        // showDialog<String>(context: context,
        //   builder: (BuildContext context) => DialogSuccess(
        //     check: (){
        //       widget.changeStatus!();
        //     },
        //   ),
        //   // builder: (BuildContext context) => DialogFail(),
        // );
      },
      child: Container(
        width: Get.width/3,
        height: 45,
        decoration: BoxDecoration(
            color: COLORS.PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: WidgetText(
            title: 'Đồng ý',
            style: AppStyle.DEFAULT_18.copyWith(
                color: COLORS.WHITE
            ),
          ),
        ),
      ),
    );
  }
}



class DialogSuccess extends StatefulWidget {
  DialogSuccess({
    Key? key,
    required this.check,
  }) : super(key: key);
  Function check;

  @override
  State<DialogSuccess> createState() => _DialogSuccessState();
}

class _DialogSuccessState extends State<DialogSuccess> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Container(
        child: WidgetText(
          title: 'Thanh toán thành công',
          style: AppStyle.DEFAULT_18.copyWith(
              fontWeight: FontWeight.w500
          ),
          textAlign: TextAlign.center,
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            widget.check();
          },
          child: Container(
            width: Get.width,
            height: 45,
            decoration: BoxDecoration(
                color: COLORS.PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
              child: WidgetText(
                title: 'Đọc sách',
                style: AppStyle.DEFAULT_18.copyWith(
                    color: COLORS.WHITE
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DialogFail extends StatelessWidget {
  const DialogFail  ({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: SizedBox(
        width: Get.width*0.65,
        height: 50,
        child: Column(
          children: [
            WidgetText(
              title: 'Thanh toán thất bại',
              style: AppStyle.DEFAULT_18.copyWith(
                  fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
            WidgetText(
              title: 'Số tiền trong ví của bạn không đủ!',
              style: AppStyle.DEFAULT_18.copyWith(
                  fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: Get.width/3,
                height: 45,
                decoration: BoxDecoration(
                    color: COLORS.PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: WidgetText(
                    title: 'Nạp ngay',
                    style: AppStyle.DEFAULT_18.copyWith(
                        color: COLORS.WHITE
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: Get.width/3,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: COLORS.WHITE,
                    border: Border.all(width: 1,color: COLORS.PRIMARY_COLOR)
                ),
                child: Center(
                  child: WidgetText(
                    title: 'Hủy',
                    style: AppStyle.DEFAULT_18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
