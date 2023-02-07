import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../../bloc/blocs.dart';
import '../../../bloc/detail_banking/detail_banking_bloc.dart';
import '../../../src/styles.dart';
import '../../../widgets/widgets.dart';

class TopUpDetail extends StatefulWidget {
  const TopUpDetail({Key? key}) : super(key: key);

  @override
  State<TopUpDetail> createState() => _TopUpDetailState();
}

class _TopUpDetailState extends State<TopUpDetail> {
  String id = Get.arguments;


  @override
  void initState() {
    super.initState();
    DetailDataBankingBloc.of(context).add(InitDetailDataBankingEvent(id));
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.WHITE,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Thông tin chuyển khoản',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: () => AppNavigator.navigateBack(),
            child: Icon(Icons.arrow_back, color: Colors.black,)
        ),
      ),
      body: BlocBuilder<DetailDataBankingBloc, DetailDataBankingState>(
        builder: (context, state) {
          if(state is UpdateGetDetailDataBankingState){
            return SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppValue.vSpaceTiny,
                          _buildTextFieldTransfer(state.data.transfer_content),
                          AppValue.vSpaceMedium,
                          _buildTextFieldNameAccount(state.data.owner_name),
                          AppValue.vSpaceMedium,
                          _buildTextFieldNumberAccount(state.data.bank_account),
                          AppValue.vSpaceMedium,
                          _buildTextFieldNameBank(state.data.bank_name)
                        ],
                      ),
                    ),
                  ),
                  _buildButtonTopUp(),
                ],
              ),
            );
          }
          else{
            return Container();
          }
        },
      ),
    );
  }

   _buildTextFieldTransfer(String transferContent) {
    return WidgetInput5(
      height: 66,
      maxLine: 2,
      inputType: TextInputType.emailAddress,
      boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: COLORS.WHITE,
          border: Border.all(
              color: COLORS.GREY_400,
              width: 1
          )
      ),
      // inputController: _textController1,
      initialValue: transferContent,
      enabled: false,
      endIcon: InkWell(
        onTap: (){
          Clipboard.setData(ClipboardData(text: transferContent));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Đã sao chép!!'),
          ));
        },
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/copy.svg'),
            AppValue.hSpaceTiny,
            WidgetText(
              title: 'Copy',
              style: AppStyle.DEFAULT_16.copyWith(
                  color: COLORS.PRIMARY_COLOR
              ),
            )
          ],
        ),
      ),
      fix: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Text('Nội dung chuyển khoản', style: AppStyle.DEFAULT_16),
      ),
    );
  }
  _buildTextFieldNameAccount(String ownerName) {
    return WidgetInput5(
      height: 48,
      inputType: TextInputType.emailAddress,
      boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: COLORS.WHITE,
          border: Border.all(
              color: COLORS.GREY_400,
              width: 1
          )
      ),
      initialValue: ownerName,
      fix: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Text('Tên chủ tài khoản', style: AppStyle.DEFAULT_16),
      ),
    );
  }

  _buildTextFieldNumberAccount(String bankAccount) {
    return WidgetInput5(
      height: 48,
      inputType: TextInputType.emailAddress,
      boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: COLORS.WHITE,
          border: Border.all(
              color: COLORS.GREY_400,
              width: 1
          )
      ),
      // inputController: _textController2,
      initialValue: bankAccount,
      endIcon: InkWell(
        onTap: (){
          Clipboard.setData(ClipboardData(text: bankAccount));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Đã sao chép!!'),
          ));
        },
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/copy.svg'),
            AppValue.hSpaceTiny,
            WidgetText(
              title: 'Copy',
              style: AppStyle.DEFAULT_16.copyWith(
                  color: COLORS.PRIMARY_COLOR
              ),
            )
          ],
        ),
      ),
      fix: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Text('Số tài khoản', style: AppStyle.DEFAULT_16),
      ),
    );
  }

  _buildTextFieldNameBank(String bankName) {
    return WidgetInput5(
      height: 48,
      inputType: TextInputType.emailAddress,
      boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: COLORS.WHITE,
          border: Border.all(
              color: COLORS.GREY_400,
              width: 1
          )
      ),
      initialValue: bankName??"",
      fix: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Text('Tên ngân hàng', style: AppStyle.DEFAULT_16),
      ),
    );
  }

  _buildButtonTopUp() {
    return WidgetButton3(
      height: 48,
      onTap: () => AppNavigator.navigateMain(),
      backgroundColor: HexColor('#FF9F00'),
      text: MESSAGES.TOP_UP_DETAIL,
    );
  }
}

class DialogConfirm extends StatelessWidget {
  const DialogConfirm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: SizedBox(
        width: AppValue.widths * 0.65,
        height: 60,
        child: Column(
          children: [
            WidgetText(
              title: 'Xác nhận nạp vào ví của bạn',
              style: AppStyle.DEFAULT_18.copyWith(
                  fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetText(
                  title: '99 Bcoin',
                  style: AppStyle.DEFAULT_18.copyWith(
                      fontWeight: FontWeight.w500,
                      color: COLORS.RED
                  ),
                ),
                AppValue.hSpaceSmall,
                WidgetText(
                  title: '(99.000 vnđ)',
                  style: AppStyle.DEFAULT_12.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: Get.width * 0.3,
                height: 50,
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
            AppValue.hSpaceSmall,
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: Get.width * 0.3,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: COLORS.WHITE,
                    border: Border.all(width: 1, color: COLORS.PRIMARY_COLOR)
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
