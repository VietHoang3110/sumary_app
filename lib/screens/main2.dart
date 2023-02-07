
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumary_app/models/index.dart';
import 'package:sumary_app/screens/dialogLogin.dart';
import 'package:sumary_app/screens/menu/advise/advise_screen_new.dart';
import 'package:sumary_app/screens/menu/library/library_screen.dart';
import 'package:sumary_app/screens/menu/library/library_screen_new.dart';
import 'package:sumary_app/screens/menu/relieve/discover_screen.dart';
import 'package:sumary_app/screens/screens.dart';
import 'package:sumary_app/src/spacing.dart';
import 'package:sumary_app/src/src_index.dart';

import '../storages/storages.dart';
import 'account_information/infor_main.dart';

class Main2Screen extends StatefulWidget {

  @override
  _Main2ScreenState createState() => _Main2ScreenState();
}

class _Main2ScreenState extends State<Main2Screen> {


  //GlobalKey pageView = GlobalKey();
  PageController controller = PageController(initialPage: 0, keepPage: false);

  List<ButtonMenuModel> listMenu = [
    ButtonMenuModel(title: MESSAGES.MENU_ADVISE, image: ICONS.MENU_ADVISE, isSelect: false),
    ButtonMenuModel(title: MESSAGES.MENU_RELIEVE, image: ICONS.MENU_RELIEVE, isSelect: false),
    // ButtonMenuModel(title: MESSAGES.MENU_ELECTIVE, image: ICONS.MENU_ELECTIVE, isSelect: false),
    ButtonMenuModel(title: MESSAGES.MENU_HOME, image: ICONS.MENU_HOME, isSelect: false),
    ButtonMenuModel(title: MESSAGES.MENU_LIBRARY, image: ICONS.MENU_LIBRARY, isSelect: false),
    ButtonMenuModel(title: MESSAGES.INFOR, image: ICONS.ICON_INFOR_2, isSelect: false),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text(MESSAGES.BACK_TO_EXIT, style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: PageView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    // AdviseScreen(),
                    Advise_Screen_New(),
                    // RelieveScreen(),
                    // ElectiveScreen(),
                    DiscoverScreen(),
                    NewsScreen(),
                    LibraryScreenNew(),
                    InforScreenMain(),
                  ],
                )

            ),
            _buildMenu()
          ],
        ),
      ),
    );
  }

  int page = 0;

  _buildMenu(){
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
          color: COLORS.WHITE,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: COLORS.GREY_E5,
                blurRadius: 8.0,
                offset: Offset(0.2, 0.0)
            )
          ]
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      padding: EdgeInsets.only(left: 16,right: 16,bottom: 5 + Spacing.viewPadding.bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(listMenu.length, (index) {
          List<ButtonMenuModel> list = [];
          return GestureDetector(
              onTap: () {
                setState(() {
                  page = index;
                });
                if(page == 3 || page == 4){
                  if(shareLocal.getString(PreferencesKey.TOKEN) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null){
                    controller.jumpToPage(index);
                  }
                  else{
                    page = -1;
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const dialogLogin(),
                    );
                  }
                }else{
                  controller.jumpToPage(index);
                }
              },
              child: _buildItemMenu(data: listMenu[index], index: index)
          );
        }),
      ),
    );
  }

  _buildItemMenu({required ButtonMenuModel data, required int index}){
    return Container(
      width:index==2? Get.width*0.2:Get.width*0.15,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 3,
            // width: 50,
            decoration: BoxDecoration(
              color: page==index ? COLORS.PRIMARY_COLOR : COLORS.WHITE,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 8,),
          WidgetContainerImage(
            image: data.image,
            colorImage: page==index ? COLORS.PRIMARY_COLOR : COLORS.BLACK ,
            width: 20,
            height: 20,
          ),
          AppValue.vSpaceTiny,
          Text(data.title, style: AppStyle.DEFAULT_12.copyWith(color: page==index ? COLORS.PRIMARY_COLOR : COLORS.BLACK), overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }

}