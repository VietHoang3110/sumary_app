import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_text.dart';


class modal_top_up extends StatelessWidget {
  const modal_top_up({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/clip3.png',),
              alignment: Alignment.bottomCenter
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WidgetText(
                  title: 'Chọn phương thức thanh toán',
                  style: AppStyle.DEFAULT_18.copyWith(
                    fontWeight: FontWeight.w600
                  ),
                ),
                InkWell(
                  onTap:(){
                    Get.back();
                  },
                    child: SvgPicture.asset('assets/icons/icon_exit.svg'))
              ],
            ),
            AppValue.vSpaceSmall,
            Container(color: COLORS.GREY_E7,width: AppValue.widths,height: 1,),
            AppValue.vSpaceSmall,
            InkWell(
              onTap: ()=> AppNavigator.navigateTopUp(),
              child: Container(
                width: AppValue.widths,
                height: 42,
                decoration: BoxDecoration(
                  color: COLORS.WHITE,
                  border: Border.all(
                    color: COLORS.GREY_E7,
                    width: 1
                  ),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppValue.hSpace(20),
                    WidgetText(
                      title: 'Chuyển khoản ngân hàng',
                      style: AppStyle.DEFAULT_16,
                    ),
                  ],
                ),
              ),
            ),
            AppValue.vSpaceSmall,
            InkWell(
              onTap: (){
                print('VNpay');
              },
              child: Container(
                width: AppValue.widths,
                height: 42,
                decoration: BoxDecoration(
                    color: COLORS.WHITE,
                    border: Border.all(
                        color: COLORS.GREY_E7,
                        width: 1
                    ),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppValue.hSpace(9),
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset('assets/icons/vnPay.png',fit: BoxFit.contain,),
                    ),
                    AppValue.hSpaceSmall,
                    WidgetText(
                      title: 'VNpay',
                      style: AppStyle.DEFAULT_16,
                    ),
                  ],
                ),
              ),
            ),
            AppValue.vSpaceSmall,
            InkWell(
              onTap: (){
                print('Viettel pay');
              },
              child: Container(
                width: AppValue.widths,
                height: 42,
                decoration: BoxDecoration(
                    color: COLORS.WHITE,
                    border: Border.all(
                        color: COLORS.GREY_E7,
                        width: 1
                    ),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppValue.hSpace(9),
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset('assets/icons/vtPay.png',fit: BoxFit.contain,),
                    ),
                    AppValue.hSpaceSmall,
                    WidgetText(
                      title: 'Viettel pay',
                      style: AppStyle.DEFAULT_16,
                    ),
                  ],
                ),
              ),
            ),
            AppValue.vSpaceSmall,
            InkWell(
              onTap: (){
                print('Momo');
              },
              child: Container(
                width: AppValue.widths,
                height: 42,
                decoration: BoxDecoration(
                    color: COLORS.WHITE,
                    border: Border.all(
                        color: COLORS.GREY_E7,
                        width: 1
                    ),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppValue.hSpace(9),
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset('assets/icons/momo.png',fit: BoxFit.contain,),
                    ),
                    AppValue.hSpaceSmall,
                    WidgetText(
                      title: 'Momo',
                      style: AppStyle.DEFAULT_16,
                    ),
                  ],
                ),
              ),
            ),
            AppValue.vSpaceSmall,
            WidgetText(
              title: 'Lưu ý: quy đổi 1.000 vnđ = 1 Bcoin ',
              style: AppStyle.DEFAULT_16,
            ),
            AppValue.vSpaceSmall,
          ],
        ),
      ),
    );
  }
}