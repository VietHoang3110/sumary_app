import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/screens/account_information/information_list/history/history_buy.dart';
import 'package:sumary_app/screens/account_information/information_list/history/history_receive.dart';
import 'package:sumary_app/screens/account_information/information_list/history/history_top_up.dart';

import '../../../src/src_index.dart';
import '../../../widgets/widgets.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: COLORS.BACKGROUND,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: WidgetText(
            title: 'Lịch sử giao dịch',
            style: AppStyle.DEFAULT_16.copyWith(
                fontWeight: FontWeight.w500
            ),
          ),
          leading: InkWell(
              onTap: ()=> AppNavigator.navigateBack(),
              child: const Icon(Icons.arrow_back,color: Colors.black,)
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1, color: COLORS.GREY_E7)
                    )
                ),
                child: TabBar(
                    isScrollable: true,
                    labelPadding: const EdgeInsets.all(0),
                    indicatorPadding: const EdgeInsets.all(0),
                    automaticIndicatorColorAdjustment: false,
                    unselectedLabelColor: HexColor('#777777'),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    overlayColor: MaterialStateColor.resolveWith((states) => Colors.white),
                    labelColor: HexColor('#EE4D2C'),
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#EE4D2C')
                    ),
                    indicatorColor: HexColor('#EE4D2C'),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          color: HexColor('#EE4D2C'), width: 1.0),
                      insets: const EdgeInsets.symmetric(horizontal: 15),
                    ),
                    tabs: [
                      Container(
                          width: AppValue.widths*0.35,
                          decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(width: 1,color: COLORS.GREY_400),
                              )
                          ),
                           child: const Text(' Lịch sử mua sách',
                               textAlign: TextAlign.center,
                             overflow: TextOverflow.ellipsis,)
                      ),
                      Container(
                          width: AppValue.widths*0.35,
                          decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(width: 1,color: COLORS.GREY_400),
                              )
                          ),
                          child: const Text(' Lịch sử nạp tiền',
                              textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,)
                      ),
                      SizedBox(
                          width: AppValue.widths*0.35,
                          child: const Text(' Lịch sử nhận coin',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                          )
                      ),
                    ]
                ),
              ),
              const Expanded(
                  child: TabBarView(
                    children: [
                      HistoryBuy(),
                      HistoryTopUp(),
                      HistoryReceive(),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}