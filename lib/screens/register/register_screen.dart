import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/screens/login/index.dart';
import 'package:sumary_app/src/spacing.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {

  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  PageController controller = PageController(initialPage: 0, keepPage: true);

  bool isSelect = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: WidgetTouchHideKeyBoard(
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
                              )),
                          Column(
                            children: [
                              SizedBox(height: AppValue.heights*0.1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  WidgetText(
                                    title: 'Bạn đã có tài khoản?',
                                    style: AppStyle.DEFAULT_16.copyWith(
                                        color: Colors.black
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => AppNavigator.navigateLogin(),
                                    child: WidgetText(
                                      title: ' Đăng nhập',
                                      style: AppStyle.DEFAULT_16.copyWith(
                                          color: HexColor('#FF9F00')
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
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
                          padding: EdgeInsets.only(left: 20,top: Spacing.viewPadding.top+10),
                          child: const WidgetBackButton(
                            color: COLORS.BLACK,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: AppValue.heights*0.1),
                          child: const Center(
                            child: WidgetContainerImage(
                                image: IMAGES.LOGO_APP,
                                height: 110,
                                width: 140,
                                fit: BoxFit.contain
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                      child: WidgetRegisterForm(),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

  int page = 0;

  _buildLoginOrRegister(){
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: COLORS.BACKGROUND,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                isSelect = true;
                //controller.jumpToPage(0);
              });
            },
            child: Column(
              children: [
                Text(
                  MESSAGES.LOGIN,
                  style: isSelect ? AppStyle.DEFAULT_20_BOLD : AppStyle.DEFAULT_20,
                ),
                isSelect ? Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(
                    color: COLORS.PRIMARY_COLOR,
                    shape: BoxShape.circle
                  ),
                ) : const SizedBox(
                  height: 5,
                  width: 5,
                )
              ],
            ),
          ),
          AppValue.hSpaceSmall,
          GestureDetector(
            onTap: (){
              setState(() {
                isSelect = false;
                //controller.jumpToPage(1);
              });
            },
            child: Column(
              children: [
                Text(
                  MESSAGES.REGISTER,
                  style: !isSelect ? AppStyle.DEFAULT_20_BOLD : AppStyle.DEFAULT_20,
                ),
                !isSelect ? Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(
                      color: COLORS.PRIMARY_COLOR,
                      shape: BoxShape.circle
                  ),
                ) : const SizedBox(
                  height: 5,
                  width: 5,
                )
              ],
            ),
          ),
        ],

        // List.generate(listMenu.length, (index) {
        //   List<ButtonMenuModel> list = [];
        //   return GestureDetector(
        //       onTap: () {
        //         for (var itemData in listMenu) {
        //           if (itemData.title == listMenu[index].title) {
        //             itemData = ButtonMenuModel(
        //                 image: itemData.image,
        //                 title: itemData.title,
        //                 isSelect: true);
        //             setState(() {
        //               page = index;
        //               print('abc category page = $page');
        //             });
        //             list.add(itemData);
        //           } else {
        //             itemData = ButtonMenuModel(
        //                 image: itemData.image,
        //                 title: itemData.title,
        //                 isSelect: false);
        //             list.add(itemData);
        //           }
        //         }
        //         setState(() => listMenu = list);
        //         //controller.jumpToPage(index);
        //       },
        //       child: Text(
        //         listMenu[index].title,
        //         style: listMenu[index].isSelect ? AppStyle.DEFAULT_20_BOLD : AppStyle.DEFAULT_20,
        //       )
        //   );
        // }),
      ),
    );
  }
}
