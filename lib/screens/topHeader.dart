import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumary_app/bloc/unread_notifi/unread_notifi_bloc.dart';
import 'package:sumary_app/storages/storages.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../src/src_index.dart';
import 'dialogLogin.dart';


class topHeader extends StatefulWidget {
  const topHeader({Key? key}) : super(key: key);

  @override
  State<topHeader> createState() => _topHeaderState();
}

class _topHeaderState extends State<topHeader> {

  int countNoti = 0;


  @override
  void initState(){
    if(shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null) {
      UnreadNotifiBloc.of(Get.context!).add(InitGetUnreadNotifiEvent());
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const WidgetContainerImage(
          image: 'assets/images/logo_home.png',
          width: 160,
          height: 50,
          fit: BoxFit.contain,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if(shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null) {
                  AppNavigator.navigateNotificationScreen();
                }
                else{
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => const dialogLogin(),
                  );
                }
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const WidgetContainerImage(
                    image: 'assets/icons/bell.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                  (shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null) ? BlocBuilder<UnreadNotifiBloc, UnreadNotifiState>(
                    builder: (context, state) {
                      if(state is UpdateUnreadNotifiState){
                        countNoti = state.data;
                        return (countNoti != 0) ? Positioned(
                          right: -2,
                          top: -2,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 11,
                              minHeight: 11,
                            ),
                            child: Text( (countNoti > 9) ? '9+' :  countNoti.toString(),
                              style: const TextStyle(color: Colors.white, fontSize: 8,),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ) : Container() ;
                      }
                      else{
                        return Container();
                      }
                    },
                  ) : Container()
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            // GestureDetector(
            //   onTap: () {
            //     if (shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null) {
            //       AppNavigator.navigateInfo();
            //     }
            //     else {
            //       showDialog(
            //         context: context,
            //         builder: (BuildContext context) =>
            //             AlertDialog(
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(15)),
            //               content: SizedBox(
            //                 width: AppValue.widths * 0.9,
            //                 child: WidgetText(
            //                   title: 'B???n c???n ????ng nh???p !!',
            //                   style: AppStyle.DEFAULT_18.copyWith(
            //                       fontWeight: FontWeight.w500
            //                   ),
            //                   textAlign: TextAlign.center,
            //                 ),
            //               ),
            //               actions: <Widget>[
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                   children: [
            //                     GestureDetector(
            //                       onTap: () async {
            //                         AppNavigator.navigateLogin();
            //                       },
            //                       child: Container(
            //                         width: Get.width * 0.35,
            //                         height: 48,
            //                         decoration: BoxDecoration(
            //                             color: COLORS.PRIMARY_COLOR,
            //                             borderRadius: BorderRadius.circular(5)
            //                         ),
            //                         child: Center(
            //                           child: WidgetText(
            //                             title: '?????ng ??',
            //                             style: AppStyle.DEFAULT_18.copyWith(
            //                                 color: COLORS.WHITE
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     AppValue.hSpaceSmall,
            //                     GestureDetector(
            //                       onTap: () {
            //                         Navigator.pop(context);
            //                       },
            //                       child: Container(
            //                         width: Get.width * 0.35,
            //                         height: 48,
            //                         decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(5),
            //                             color: COLORS.WHITE,
            //                             border: Border.all(width: 1,
            //                                 color: COLORS.PRIMARY_COLOR)
            //                         ),
            //                         child: Center(
            //                           child: WidgetText(
            //                             title: 'H???y',
            //                             style: AppStyle.DEFAULT_18,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //       );
            //     }
            //   },
            //   child: const WidgetContainerImage(
            //     image: 'assets/icons/settings.png',
            //     width: 20,
            //     height: 20,
            //     fit: BoxFit.contain,
            //   ),
            // )
          ],
        )
      ],
    );
  }
}


class widget_seach_1 extends StatelessWidget {
  const widget_seach_1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: InkWell(
        onTap: () => AppNavigator.navigateSearch(),
        child: Container(
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: COLORS.WHITE,
            border: Border.all(width: 1, color: COLORS.GREY_A6),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                spreadRadius: 0,
                blurRadius: 3,
                offset: Offset(1, 2), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppValue.hSpace(10),
              WidgetText(
                title: 'Nh???p t??n T??m S??ch',
                style: AppStyle.DEFAULT_14.copyWith(
                    color: COLORS.GREY_ACB,
                    fontWeight: FontWeight.w400
                ),
                overflow: TextOverflow.clip,
              ),
              const Spacer(),
              SvgPicture.asset('assets/icons/timkiem.svg'),
              AppValue.hSpace(8)
            ],
          ),
        ),
      ),
    );
  }
}

