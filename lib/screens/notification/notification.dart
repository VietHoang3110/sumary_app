import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/list_notification/list_notification_bloc.dart';
import 'package:sumary_app/bloc/read_noti/read_noti_bloc.dart';
import 'package:sumary_app/bloc/unread_notifi/unread_notifi_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_notification.dart';

import '../../src/src_index.dart';
import '../../widgets/widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ScrollController _scrollController = ScrollController();
  late int page = 1;
  @override

  void initState() {
    GetListNotificationBloc.of(context).add(InitGetListNotificationEvent(page, 20));
    _scrollController.addListener(() async {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        GetListNotificationBloc.of(context).add(InitGetListNotificationEvent(page+1, 20));
        page=page+1;
      } else {}
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final bloc = ReadNotiBloc.of(context);
    return Scaffold(
      backgroundColor: COLORS.BACKGROUND,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Thông báo',
          style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
        ),
        leading: InkWell(
            onTap: () {
              AppNavigator.navigateBack();
              UnreadNotifiBloc.of(Get.context!).add(InitGetUnreadNotifiEvent());
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: BlocBuilder<GetListNotificationBloc, ListNotificationState>(
          builder: (context, state) {
            if (state is UpdateGetListNotificationState) {
              // List<DataNotification> listNoti = state.dataNotification;
              return ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: state.dataNotification.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // print('noooo: ${listNoti[index].id??""}');
                        bloc.add(ReadNotiEventSubmitted(id: state.dataNotification[index].id));
                        AppNavigator.navigateNotificationDetail(
                            state.dataNotification[index].id,
                            state.dataNotification[index].title,
                            state.dataNotification[index].content,
                            state.dataNotification[index].description,
                            state.dataNotification[index].isRead,
                            state.dataNotification[index].isActivated,
                            state.dataNotification[index].author,
                            state.dataNotification[index].createdAt,
                        );
                      },
                      child: Container(
                        width: AppValue.widths,
                        padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                        decoration: BoxDecoration(
                            color:state.dataNotification[index].isRead! ? null : const Color.fromRGBO(238, 77, 44, 0.05),
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: HexColor('#D8D9DB')))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/logo_notification.png',
                              height: 23,
                              width: 23,
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                            SizedBox(
                              width: Get.width * 0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  WidgetText(
                                    title:  state.dataNotification[index].title?? '',
                                    style: AppStyle.DEFAULT_18.copyWith(
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  WidgetText(
                                    title:  state.dataNotification[index].description?? '',
                                    style: AppStyle.DEFAULT_16,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    maxLine: 10,
                                  ),
                                  AppValue.vSpaceTiny,
                                ],
                              ),
                            ),
                            AppValue.hSpaceTiny,
                            const Icon(Icons.keyboard_arrow_right_outlined)
                          ],
                        ),
                      ),
                    );
                  });
            }
            else {
              return const Center(
                child: Text("Không có dữ liệu"),
              );
            }
          }),
    );
  }
}
