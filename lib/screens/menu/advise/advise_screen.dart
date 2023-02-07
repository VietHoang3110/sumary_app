import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/screens/menu/advise/widget/index.dart';

import '../../../src/spacing.dart';
import '../../../src/src_index.dart';
import '../../topHeader.dart';

class AdviseScreen extends StatefulWidget {
  const AdviseScreen({Key? key}) : super(key: key);

  @override
  State<AdviseScreen> createState() => _AdviseScreenState();
}

class _AdviseScreenState extends State<AdviseScreen> {

  late StreamSubscription<bool> keyboardSubscription;
  bool keyboard = true;

  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    print('Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    // Subscribe
    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      print('Keyboard visibility update. Is visible: $visible');
      setState(() {
        if (visible == true){
          keyboard = false;
        }
        else keyboard = true;
      });
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // resizeToAvoidBottomPadding:false,
        resizeToAvoidBottomInset: false,
        backgroundColor: COLORS.WHITE,
        body: Column(
          children: [
            !keyboard ?  Container(): _renderHeader() ,
            Container(
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: COLORS.GREY_E7)
                  )
              ),
              child: TabBar(
                  labelPadding: const EdgeInsets.all(0),
                  indicatorPadding: const EdgeInsets.all(0),
                  automaticIndicatorColorAdjustment: false,
                  unselectedLabelColor: HexColor('#777777'),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  overlayColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  labelColor: HexColor('#EE4D2C'),
                  labelStyle: TextStyle(
                      fontSize: 16,
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
                        width: AppValue.widths*0.5,
                        decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 1,color: COLORS.GREY_400),
                            )
                        ),
                        child: Text("Tư vấn",textAlign: TextAlign.center),
                    ),
                    SizedBox(
                        width: AppValue.widths*0.5,
                        child: const Text("Khóa học",textAlign: TextAlign.center)
                    ),
                  ]
              ),
            ),
            const Expanded(
                child:
                TabBarView(
                  children: [
                    widget_advise(),
                    widget_course()
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
  Widget _renderHeader() {
    return (Container(
      width: Get.width,
      height: Get.height / 2.65+Spacing.viewPadding.top,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/advise.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(right: 16,top: 16+Spacing.viewPadding.top,left: 5),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.9),
                    Color.fromRGBO(0, 0, 0, 0)
                  ],
                )),
            child: topHeader(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10,bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [SvgPicture.asset('assets/images/comma1.svg')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SvgPicture.asset('assets/images/text_advise.svg')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [SvgPicture.asset('assets/images/comma2.svg')],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

