import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/list_rank_member/list_rank_member_bloc.dart';
import 'package:sumary_app/bloc/my_rank_member/my_rank_member_bloc.dart';
import 'package:sumary_app/screens/account_information/dialog_up_rank.dart';

import '../../bloc/login/login_bloc.dart';
import '../../bloc/user_info/user_info_bloc.dart';
import '../../src/models/model_generator/list_rank_member_user.dart';
import '../../src/src_index.dart';
import '../../widgets/widgets.dart';

class RankMember extends StatefulWidget {
  const RankMember({Key? key,
  }) : super(key: key);


  @override
  State<RankMember> createState() => _RankMemberState();
}

class _RankMemberState extends State<RankMember> {
  String name = Get.arguments;
  int? myLv ;
  List<DataListRank>? listRank;

  @override
  void initState() {
    super.initState();
    MyRankBloc.of(context).add(InitGetMyRankEvent());
    ListRankMemberBloc.of(context).add(InitGetListRankMemberEvent('', 1, 10));
  }

  @override
  Widget build(BuildContext context) {
    bool isShow = false;
    return Scaffold(
      // backgroundColor: COLORS.BACKGROUND,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Thẻ thành viên',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: (){
              Get.back();
              Get.back();
            },
            child: const Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),
      body: BlocBuilder<MyRankBloc, MyRankState>(
          builder: (context, state) {
            if(state is UpdateGetMyRankState ){
              if(state.data.level==null){
                myLv = 0;
              }else{
                myLv = state.data.level;
              }
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppValue.vSpace(5),
                      Container(
                        decoration: const BoxDecoration(
                          color: COLORS.WHITE,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,right: 10,left: 10),
                          child: Align(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(width: AppValue.widths,
                                    child: Image.asset('assets/images/img_card.png',fit: BoxFit.fill,)),
                                Column(
                                  children: [
                                    AppValue.vSpace(10),
                                    Row(
                                      children: [
                                        AppValue.hSpaceSmall,
                                        Image.asset('assets/images/logo.png',
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            WidgetText(
                                              title: 'Tên thành viên',
                                              style: AppStyle.DEFAULT_14.copyWith(
                                                  color: COLORS.WHITE,
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                            WidgetText(
                                              title: name,
                                              style: AppStyle.DEFAULT_16.copyWith(
                                                  color: COLORS.WHITE,
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                          ],
                                        ),
                                        AppValue.hSpaceSmall
                                      ],
                                    ),
                                    AppValue.vSpaceMedium,
                                    Row(
                                      children: [
                                        AppValue.hSpaceSmall,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            WidgetText(
                                              title: 'Thành viên',
                                              style: AppStyle.DEFAULT_16.copyWith(
                                                  color: COLORS.WHITE,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                            WidgetText(
                                              title: state.data.name??"Hạng thành viên",
                                              style: AppStyle.DEFAULT_20.copyWith(
                                                  color: COLORS.WHITE,
                                                  fontWeight: FontWeight.w700
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                         WidgetButton(
                                          onTap: (){
                                            if(listRank!.last.level==myLv){
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (BuildContext context) {
                                                  return const WidgetDialog(
                                                    title: MESSAGES.NOTIFICATION,
                                                    content: 'Bạn đã đạt hạng tối đa',
                                                  );
                                                },
                                              );
                                            }
                                            else{
                                              for(int i=0;i<listRank!.length;i++){
                                                if(listRank![i].level==(myLv!+1)){
                                                  showDialog<String>(
                                                    context: context,
                                                    builder: (BuildContext context) => DialogUpRank(
                                                        mid: listRank![i].id,
                                                        bcoin: listRank![i].bcoin!.toDouble(),
                                                        name: listRank![i].name,
                                                    ),
                                                  );
                                                  break;
                                                }
                                              }
                                            }
                                          },
                                          text: 'Thăng hạng',
                                          textColor: COLORS.WHITE,
                                          width: Get.width*0.3,
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
                                        ),
                                        AppValue.hSpaceSmall
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: COLORS.WHITE,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,right: 15,left: 15,bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WidgetText(
                                title: 'Ưu đãi thành viên hiện tại: ${state.data.name}',
                                style: AppStyle.DEFAULT_16.copyWith(
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              WidgetText(
                                title: '(còn lại: ${state.data.book_for_free??0} cuốn sách tự chọn)',
                                style: AppStyle.DEFAULT_14.copyWith(
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 5),
                                child: Container(color: HexColor('#D8D9DB'),height: 1,width: AppValue.widths),
                              ),
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/images/icons_crown.png'),
                                      SizedBox(
                                        width: AppValue.widths*0.8,
                                        child: WidgetText(
                                          title: state.data.description??"Free 0 cuốn sách tự chọn",
                                          style: AppStyle.DEFAULT_14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.justify,
                                          maxLine: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/images/icons_crown.png'),
                                      SizedBox(
                                        width: AppValue.widths*0.8,
                                        child: WidgetText(
                                          title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                          style: AppStyle.DEFAULT_14.copyWith(
                                              fontWeight: FontWeight.w400
                                          ),
                                          textAlign: TextAlign.justify,
                                          maxLine: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/images/icons_crown.png'),
                                      SizedBox(
                                        width: AppValue.widths*0.8,
                                        child: WidgetText(
                                          title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                          style: AppStyle.DEFAULT_14.copyWith(
                                              fontWeight: FontWeight.w400
                                          ),
                                          textAlign: TextAlign.justify,
                                          maxLine: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 0),
                      //   child: Container(color: HexColor('#D8D9DB'),height: 1,width: AppValue.widths),
                      // ),
                      BlocBuilder<ListRankMemberBloc, ListRankMemberState>(
                          builder: (context, state) {
                            if(state is UpdateListRankMemberState){
                              listRank=state.data;
                              return Column(children: List.generate(state.data.length,
                                      (index) => Container(
                                        decoration: const BoxDecoration(
                                          color: COLORS.WHITE,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.1),
                                              spreadRadius: 0,
                                              blurRadius: 10,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Theme(
                                          data: Theme.of(context).copyWith(
                                            unselectedWidgetColor: Colors.white, // here for close state
                                            colorScheme: const ColorScheme.light(
                                              primary: COLORS.GREY,
                                            ), // here for open state in replacement of deprecated accentColor
                                            dividerColor: Colors.transparent, // if you want to remove the border
                                          ),
                                          child: ExpansionTile(
                                            collapsedIconColor: COLORS.GREY,
                                            title: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                WidgetText(
                                                      title: 'Ưu đãi thành viên ${state.data[index].name}',
                                                      style: AppStyle.DEFAULT_16.copyWith(
                                                          fontWeight: FontWeight.w600
                                                      ),
                                                ),
                                              ],
                                            ),
                                            children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 15,left: 15),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Image.asset('assets/images/icons_crown.png'),
                                                            SizedBox(
                                                              width: AppValue.widths*0.8,
                                                              child: WidgetText(
                                                                title: state.data[index].description,
                                                                style: AppStyle.DEFAULT_14.copyWith(
                                                                  fontWeight: FontWeight.w400,
                                                                ),
                                                                textAlign: TextAlign.justify,
                                                                maxLine: 10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Image.asset('assets/images/icons_crown.png'),
                                                            SizedBox(
                                                              width: AppValue.widths*0.8,
                                                              child: WidgetText(
                                                                title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                                                style: AppStyle.DEFAULT_14.copyWith(
                                                                    fontWeight: FontWeight.w400
                                                                ),
                                                                textAlign: TextAlign.justify,
                                                                maxLine: 10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Image.asset('assets/images/icons_crown.png'),
                                                            SizedBox(
                                                              width: AppValue.widths*0.8,
                                                              child: WidgetText(
                                                                title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                                                style: AppStyle.DEFAULT_14.copyWith(
                                                                    fontWeight: FontWeight.w400
                                                                ),
                                                                textAlign: TextAlign.justify,
                                                                maxLine: 10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        (state.data[index].level! <= myLv!) ? Container(): _buildUpRank(context, state, index),
                                                      ],
                                                    ),
                                                  ),
                                            ],
                                          ),
                                        ),
                                      )),);
                               }
                            else{
                              return Container();
                            }
                          },
                        ),
                    ],
                  ),
                ),
              );
            }
            else{
              return Container();
            }
          },
      ),
    );
  }

  _buildUpRank(BuildContext context, UpdateListRankMemberState state, int index) {
    return WidgetButton(
      onTap: ()=> showDialog<String>(
        context: context,
        builder: (BuildContext context) => DialogUpRank(
            mid: state.data[index].id,
            bcoin: state.data[index].bcoin!.round().toDouble(),
            name: state.data[index].name,
        ),
      ),
      //enable: state.status.isValidated,
      backgroundColor: HexColor('#FF9F00'),
      text: 'Thăng hạng ngay (${state.data[index].bcoin!.round()} Bcoin)',
    );
  }
}

