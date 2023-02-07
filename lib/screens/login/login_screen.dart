import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/screens/login/index.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';

import '../../src/spacing.dart';

class LoginScreen extends StatefulWidget {

  final String? email;
  const LoginScreen(
      {Key? key, this.email}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  PageController controller = PageController(initialPage: 0, keepPage: true);

  bool isSelect = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text(MESSAGES.BACK_TO_EXIT, style: AppStyle.DEFAULT_16.copyWith(color: COLORS.WHITE),),
        ),
        child: WidgetTouchHideKeyBoard(
          child: Container(
            height: AppValue.heights,
            decoration: const BoxDecoration(
              color: COLORS.BACKGROUND
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height:AppValue.heights*0.85,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                                height: AppValue.heights*0.15,
                                width: AppValue.widths,
                                child: Image.asset('assets/images/clip2.png',
                                    fit: BoxFit.cover,
                                    // color: COLORS.RED1
                                )),
                            Column(
                              children: [
                                SizedBox(height: AppValue.heights*0.1),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    WidgetText(
                                      title: 'Bạn chưa có tài khoản?',
                                      style: AppStyle.DEFAULT_16.copyWith(
                                          color: Colors.black
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => AppNavigator.navigateRegister(),
                                      child: WidgetText(
                                        title: ' Đăng ký ngay',
                                        style: AppStyle.DEFAULT_16.copyWith(
                                            color: HexColor('#FF9F00')
                                        ),
                                      ),
                                    ),
                                    AppValue.vSpace(5),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                              width: double.infinity,
                              height: AppValue.heights*0.3,
                              child: Image.asset('assets/images/clip1.png',fit: BoxFit.fill)),
                          Padding(
                            padding: EdgeInsets.only(top: AppValue.heights*0.1),
                            child: const Center(
                              child: WidgetContainerImage(
                                image: IMAGES.LOGO_APP,
                                height: 110,
                                width: 145,
                                fit: BoxFit.contain
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        child: WidgetLoginForm(emailRegister: widget.email,),
                      ),
                      // AppValue.vSpaceMedium,
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }

  int page = 0;

  // _buildLoginOrRegister(){
  //   return Container(
  //     width: Get.width,
  //     decoration: BoxDecoration(
  //       color: COLORS.BACKGROUND,
  //     ),
  //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //     child: Row(
  //       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         GestureDetector(
  //           onTap: (){
  //             setState(() {
  //               isSelect = true;
  //               //controller.jumpToPage(0);
  //             });
  //           },
  //           child: Column(
  //             children: [
  //               Text(
  //                 MESSAGES.LOGIN,
  //                 style: isSelect ? AppStyle.DEFAULT_20_BOLD : AppStyle.DEFAULT_20,
  //               ),
  //               isSelect ? Container(
  //                 height: 5,
  //                 width: 5,
  //                 decoration: BoxDecoration(
  //                   color: COLORS.PRIMARY_COLOR,
  //                   shape: BoxShape.circle
  //                 ),
  //               ) : Container(
  //                 height: 5,
  //                 width: 5,
  //               )
  //             ],
  //           ),
  //         ),
  //         AppValue.hSpaceSmall,
  //         GestureDetector(
  //           onTap: (){
  //             setState(() {
  //               isSelect = false;
  //               //controller.jumpToPage(1);
  //             });
  //           },
  //           child: Column(
  //             children: [
  //               Text(
  //                 MESSAGES.REGISTER,
  //                 style: !isSelect ? AppStyle.DEFAULT_20_BOLD : AppStyle.DEFAULT_20,
  //               ),
  //               !isSelect ? Container(
  //                 height: 5,
  //                 width: 5,
  //                 decoration: BoxDecoration(
  //                     color: COLORS.PRIMARY_COLOR,
  //                     shape: BoxShape.circle
  //                 ),
  //               ) : Container(
  //                 height: 5,
  //                 width: 5,
  //               )
  //             ],
  //           ),
  //         ),
  //       ],
  //
  //       // List.generate(listMenu.length, (index) {
  //       //   List<ButtonMenuModel> list = [];
  //       //   return GestureDetector(
  //       //       onTap: () {
  //       //         for (var itemData in listMenu) {
  //       //           if (itemData.title == listMenu[index].title) {
  //       //             itemData = ButtonMenuModel(
  //       //                 image: itemData.image,
  //       //                 title: itemData.title,
  //       //                 isSelect: true);
  //       //             setState(() {
  //       //               page = index;
  //       //               print('abc category page = $page');
  //       //             });
  //       //             list.add(itemData);
  //       //           } else {
  //       //             itemData = ButtonMenuModel(
  //       //                 image: itemData.image,
  //       //                 title: itemData.title,
  //       //                 isSelect: false);
  //       //             list.add(itemData);
  //       //           }
  //       //         }
  //       //         setState(() => listMenu = list);
  //       //         //controller.jumpToPage(index);
  //       //       },
  //       //       child: Text(
  //       //         listMenu[index].title,
  //       //         style: listMenu[index].isSelect ? AppStyle.DEFAULT_20_BOLD : AppStyle.DEFAULT_20,
  //       //       )
  //       //   );
  //       // }),
  //     ),
  //   );
  // }
}
