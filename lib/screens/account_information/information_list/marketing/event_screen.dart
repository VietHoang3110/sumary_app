import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sumary_app/widgets/widgets.dart';

import '../../../../src/src_index.dart';
import '../../../../widgets/widget_text.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.BACKGROUND,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Sự kiện',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: ()=> Get.back(),
            child: const Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: const Color(0xff01A358),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("20/05/2022-30/05/2022",style: AppStyle.DEFAULT_16.copyWith(color: white),),
                Text('Chưa tham gia',style: AppStyle.DEFAULT_16.copyWith(color: white))
              ],
            ),
          ),
          SvgPicture.asset('assets/images/event_marketing.svg'),
          AppValue.vSpaceSmall,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sự kiện: Chia sẻ bạn bè - nhận quà liền tay',style: AppStyle.DEFAULT_16_BOLD,),
                AppValue.vSpaceTiny,
                const Text(
                  'Chia sẻ mã giới thiệu cho 5 bạn bè đăng ký tài khoản thành công. bạn sẽ nhận được 10 Vcoin',
                  style: AppStyle.DEFAULT_16,
                ),
                AppValue.vSpaceSmall,
                Text('Thời gian: từ 20/05/2022 - 30/05/2022',style: AppStyle.DEFAULT_16_BOLD,),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: WidgetButton(
        height: 45,
        padding: EdgeInsets.all(0),
        onTap: (){},
        text: 'Đăng ký tham gia',
      ),
    );
  }
}
