import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumary_app/bloc/list_notification/list_notification_bloc.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../bloc/unread_notifi/unread_notifi_bloc.dart';
import '../../src/navigator.dart';
import '../../src/styles.dart';
import '../../widgets/widgets.dart';

class NotificationDetail extends StatefulWidget {
  const NotificationDetail({Key? key}) : super(key: key);

  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  String id = Get.arguments[0];
  String title = Get.arguments[1];
  String content = Get.arguments[2];
  String description =  Get.arguments[3];
  bool isRead =  Get.arguments[4];
  bool isActivated = Get.arguments[5];
  String author =  Get.arguments[6];
  String createdAt =  Get.arguments[7];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Chi tiết thông báo',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: (){
              AppNavigator.navigateBack();
              GetListNotificationBloc.of(context).add(InitGetListNotificationEvent(1, 20));
            },
            child: const Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetText(
                  title: title,
                  style: AppStyle.DEFAULT_16_BOLD,
                ),
                AppValue.vSpaceTiny,
                Container(
                  width: AppValue.widths,
                  height: 1,
                  color: COLORS.GREY_400,
                ),
                AppValue.vSpaceTiny,
                SizedBox(
                  width: AppValue.widths,
                  child: WidgetText(
                    title: description,
                    style: AppStyle.DEFAULT_16,
                    maxLine: 10,
                  ),
                ),
                AppValue.vSpaceTiny,
                SizedBox(
                  width: AppValue.widths,
                    child: Image.network('https://api.tiemnangmaster.com/static/166019638211866203-[converted]-copy-1.png/high'),
                ),
                AppValue.vSpaceSmall,
                SizedBox(
                  width: AppValue.widths,
                  child: WidgetText(
                    title: content,
                    style: AppStyle.DEFAULT_16,
                    maxLine: 10,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
