import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sumary_app/bloc/authen/authentication_bloc.dart';
import 'package:sumary_app/bloc/blocs.dart';
import 'package:sumary_app/bloc/my_rank_member/my_rank_member_bloc.dart';
import 'package:sumary_app/screens/account_information/top_up/modal_top_up.dart';
import 'package:sumary_app/src/spacing.dart';

import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/storages/storages.dart';
import 'package:sumary_app/widgets/widget_back_button.dart';
import 'package:sumary_app/widgets/widget_button.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../bloc/user_info/user_info_bloc.dart';
import '../../widgets/widgets.dart';

class InforScreenMain extends StatefulWidget {
  const InforScreenMain({Key? key}) : super(key: key);

  @override
  State<InforScreenMain> createState() => _InforScreenMainState();
}

class _InforScreenMainState extends State<InforScreenMain> {


  @override
  void initState() {
    super.initState();
    UserInfoBloc.of(context).add(InitUserInfoEvent());
    MyRankBloc.of(context).add(InitGetMyRankEvent());
  }


  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  _onRefresh() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    setState((){
      UserInfoBloc.of(context).add(InitUserInfoEvent());
      MyRankBloc.of(context).add(InitGetMyRankEvent());
    });
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['https://www.googleapis.com/auth/plus.login']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetTouchHideKeyBoard(
        child: SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              BlocBuilder<UserInfoBloc, UserInfoState>(
                  builder: (context, state) {
                    if (state is UpdateUserInfoState) {
                      return Container(
                          alignment: Alignment.topCenter,
                          width: AppValue.widths,
                          height: AppValue.heights - 5 - Spacing.viewPadding.bottom,
                          child: Stack(
                            children: [
                              SizedBox(
                                  width: AppValue.widths,
                                  height: AppValue.heights*0.43,
                                  child: Image.asset('assets/images/infor.png',fit: BoxFit.cover,)),
                              Padding(
                                padding: EdgeInsets.only(top: Spacing.viewPadding.top,right: 20,left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // AppValue.vSpace(10),
                                    // const WidgetBackButton2(
                                    //   colorIcon:  COLORS.WHITE,
                                    // ),
                                    AppValue.vSpaceMedium,
                                    Row(
                                      children: [
                                        CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(state.data.avatar=='' ? "https://api.tiemnangmaster.com/static/1658480314678group-14578.png/high": state.data.avatar.toString()),
                                        ),
                                        AppValue.hSpaceSmall,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            WidgetText(
                                              title: state.data.name,
                                              style: AppStyle.DEFAULT_18_BOLD.copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                            InkWell(
                                                onTap: ()=> AppNavigator.navigateRankMember(state.data.name),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: HexColor("#C4C4C4").withOpacity(0.8),
                                                    borderRadius: BorderRadius.circular(15)
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                                    children: [
                                                      BlocBuilder<MyRankBloc, MyRankState>(
                                                        builder: (context, state) {
                                                          if(state is UpdateGetMyRankState){
                                                            return Row(
                                                              crossAxisAlignment:  CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top: 3,left: 5),
                                                                  child: Image.asset('assets/icons/crown_rank.png',width: 25,height: 25,fit: BoxFit.fill,),
                                                                ),
                                                                WidgetText(
                                                                    title: state.data.name,
                                                                    style: AppStyle.DEFAULT_14
                                                                ),
                                                                AppValue.hSpace(4),
                                                                SvgPicture.asset('assets/icons/r1.svg',),
                                                                AppValue.hSpaceTiny
                                                              ],
                                                            );
                                                          }
                                                          else{
                                                            return Row(
                                                              crossAxisAlignment:  CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top: 3,left: 5),
                                                                  child: Image.asset('assets/icons/crown_rank.png',width: 25,height: 25,fit: BoxFit.fill,),
                                                                ),
                                                                WidgetText(
                                                                    title: "Hạng thành viên",
                                                                    style: AppStyle.DEFAULT_14
                                                                ),
                                                                AppValue.hSpaceTiny
                                                              ],
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                )
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    AppValue.vSpaceTiny,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      child: Container(width: AppValue.widths,height: 1, color: HexColor('#FF9F00'),),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                showMaterialModalBottomSheet(
                                                  context: context,
                                                  builder: (context) => SingleChildScrollView(
                                                    controller: ModalScrollController.of(context),
                                                    child: const modal_top_up(),
                                                  ),
                                                );
                                              },
                                              child: WidgetText(
                                                title: 'Ví của tôi',
                                                style: AppStyle.DEFAULT_16.copyWith(
                                                    color: Colors.white
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset('assets/icons/bcoin.svg'),
                                                AppValue.hSpaceTiny,
                                                WidgetText(
                                                  title: state.data.bcoin!.round().toString(),
                                                  style: AppStyle.DEFAULT_24_BOLD.copyWith(
                                                      color: Colors.white
                                                  ),
                                                ),
                                                AppValue.hSpaceTiny,
                                                WidgetText(
                                                  title: 'Bcoin',
                                                  style: AppStyle.DEFAULT_16.copyWith(
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        WidgetButton(
                                          padding: const EdgeInsets.all(0),
                                          onTap: (){
                                            showMaterialModalBottomSheet(
                                              context: context,
                                              builder: (context) => SingleChildScrollView(
                                                controller: ModalScrollController.of(context),
                                                child: const modal_top_up(),
                                              ),
                                            );
                                          },
                                          text: 'Nạp ngay',
                                          textColor: COLORS.WHITE,
                                          width: 100,
                                          height: 40,
                                          boxDecoration: BoxDecoration(
                                            color: HexColor('#FF9F00'),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.white,
                                              style: BorderStyle.solid,
                                              width: 1.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    AppValue.vSpaceTiny,
                                    BlocBuilder<MyRankBloc, MyRankState>(
                                      builder: (context, state) {
                                        if(state is UpdateGetMyRankState){
                                          return WidgetText(
                                            title:"Số sách ưu đãi: ${(state.data.book_for_free ?? 0)} ",
                                            style: AppStyle.DEFAULT_16.copyWith(
                                                color: COLORS.WHITE,
                                                fontWeight: FontWeight.w600
                                            ),
                                          );
                                        }
                                        else{
                                          return Container();
                                        }
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                      );
                    }else {
                      return Container();
                    }
                  }),
              Positioned(
                top: AppValue.heights*0.34,
                child: Container(
                  width: AppValue.widths,
                  height: AppValue.heights,
                  decoration: const BoxDecoration(
                      color: COLORS.WHITE,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, -2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AppValue.vSpace(25),
                        build_click_cate(
                          image: 'assets/icons/user.svg',
                          title: 'Thông tin tài khoản',
                          onClick: () => AppNavigator.navigateAccountDetail(),
                        ),
                        build_click_cate(
                          image: 'assets/icons/loca.svg',
                          title: 'Về chúng tôi',
                          onClick: () => AppNavigator.navigateAboutUs(),
                        ),
                        build_click_cate(
                          image: 'assets/icons/reload.svg',
                          title: 'Lịch sử giao dịch',
                          onClick:  ()=> AppNavigator.navigateHistory(),
                        ),
                        build_click_cate(
                          image: 'assets/icons/iconchat.svg',
                          title: 'Lịch sử tư vấn',
                          onClick:  ()=> AppNavigator.navigateListHistoryAdvise(),
                        ),
                        build_click_cate(
                          image: 'assets/icons/tiep_thi_lien_ket.svg',
                          title: 'Tiếp thị liên kết',
                          onClick: ()=> AppNavigator.navigateMarketing() ,
                        ),
                        build_click_cate(
                          image:'assets/icons/question.svg' ,
                          title: 'Những câu hỏi thường gặp',
                          onClick: ()=> AppNavigator.navigateQuestion() ,
                        ),
                        build_click_cate(
                          image: 'assets/icons/list.svg',
                          title: 'Điều khoản và chính sách',
                          onClick: ()=>AppNavigator.navigateTerm() ,
                        ),
                        build_click_cate(
                          image:'assets/icons/lock.svg' ,
                          title: 'Chính sách bảo mật',
                          onClick:()=> AppNavigator.navigateTerm() ,
                        ),
                        build_click_cate(
                          image: 'assets/icons/logout.svg',
                          title: 'Đăng xuất',
                          onClick: ()=> showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              content: SizedBox(
                                width: AppValue.widths*0.9,
                                child: WidgetText(
                                  title: 'Đăng xuất tài khoản?',
                                  style: AppStyle.DEFAULT_18.copyWith(
                                      fontWeight: FontWeight.w500
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        print("Login_type: ${shareLocal.getString(PreferencesKey.LOGIN_TYPE)}");
                                        AuthenticationBloc.of(context).add(AuthenticationLogoutRequested());
                                        if(shareLocal.getString(PreferencesKey.LOGIN_TYPE) == 'Google' ){
                                          await _googleSignIn.signOut();
                                          AppNavigator.navigateLogin();
                                        }
                                        else {
                                          if(shareLocal.getString(PreferencesKey.LOGIN_TYPE) == 'Facebook'){
                                            await FacebookAuth.instance.logOut();
                                            AppNavigator.navigateLogin();
                                          }else{
                                            LoginBloc.of(context).add(const EmailChanged(email: ""));
                                            AppNavigator.navigateLogin();
                                          }
                                        }
                                      },
                                      child: Container(
                                        width: Get.width*0.35,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            color: COLORS.PRIMARY_COLOR,
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Center(
                                          child: WidgetText(
                                            title: 'Đồng ý',
                                            style: AppStyle.DEFAULT_18.copyWith(
                                                color: COLORS.WHITE
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    AppValue.hSpaceSmall,
                                    GestureDetector(
                                      onTap: () async {
                                        print(shareLocal.getString(PreferencesKey.TOKEN));
                                        print('tokennn: ${shareLocal.getString(PreferencesKey.TOKEN)==''}');
                                        Navigator.pop(context);

                                      },
                                      child: Container(
                                        width: Get.width*0.35,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: COLORS.WHITE,
                                            border: Border.all(width: 1,color: COLORS.PRIMARY_COLOR)
                                        ),
                                        child: Center(
                                          child: WidgetText(
                                            title: 'Hủy',
                                            style: AppStyle.DEFAULT_18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ) ,
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class build_click_cate extends StatelessWidget {
  String image;
  String title;
  Function onClick;
  build_click_cate({
    Key? key,
    required this.image,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ()=> onClick(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20,left: 20,bottom: 10),
            child: Row(
              children: [
                SvgPicture.asset(image),
                AppValue.hSpaceSmall,
                WidgetText(
                  title: title,
                  style: AppStyle.DEFAULT_14,
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios,size: 15,)
              ],
            ),
          ),
        ),
        Container(height: 1,width: AppValue.widths,color: HexColor('#E0E0E0'),),
        AppValue.vSpaceSmall,
      ],
    );
  }
}
