import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/buy_rank_member/buy_rank_member_bloc.dart';
import '../../bloc/my_rank_member/my_rank_member_bloc.dart';
import '../../bloc/user_info/user_info_bloc.dart';
import '../../src/src_index.dart';
import '../../widgets/widgets.dart';


class DialogUpRank extends StatefulWidget {
  const DialogUpRank({
    Key? key,
    required this.name,
    required this.mid,
    required this.bcoin,
  }) : super(key: key);
  final String mid;
  final String name;
  final double bcoin;

  @override
  State<DialogUpRank> createState() => _DialogUpRankState();
}

class _DialogUpRankState extends State<DialogUpRank> {

  @override
  void initState() {
    MyRankBloc.of(context).add(InitGetMyRankEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BuyRankMemberBloc.of(context);
    return BlocListener<BuyRankMemberBloc, BuyRankMemberState>(
      listener: (context, state) {
        if (state is SuccessBuyRankMemberState) {
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
                    Get.back();
                    MyRankBloc.of(context).add(InitGetMyRankEvent());
                    UserInfoBloc.of(context).add(InitUserInfoEvent());
                  }
              );
            },
          );
        }
        if (state is InProgressBuyRankMemberState) {
          GetSnackBarUtils.createProgress();
        }
        if (state is FailureBuyRankMemberState) {
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
                  }
              );
            },
          );
          GetSnackBarUtils.createFailure(message: state.message);
        }
      },
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: SizedBox(
          width: AppValue.widths*0.9,
          height: 50,
          child: Column(
            children: [
              WidgetText(
                title: 'Nâng "${widget.name}" với:',
                style: AppStyle.DEFAULT_18.copyWith(
                    fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
              WidgetText(
                title: '${widget.bcoin.round()} Bcoin',
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
              _buildClickConfirm(bloc),
              AppValue.hSpaceSmall,
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: Get.width*0.34,
                  height: 48,
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

  _buildClickConfirm(BuyRankMemberBloc bloc) {
    return GestureDetector(
      onTap: (){
        bloc.add(BuyRankMemberSubmitted(mid: widget.mid));
        },
      child: Container(
        width: Get.width*0.34,
        height: 48,
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