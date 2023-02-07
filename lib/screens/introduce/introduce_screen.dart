import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/intro/intro_bloc.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../bloc/blocs.dart';
import '../../src/messages.dart';
import '../../src/spacing.dart';
import '../../widgets/widget_button.dart';
import 'widget_introduce.dart';

class IntroducePage extends StatefulWidget {
  const IntroducePage({Key? key}) : super(key: key);

  @override
  State<IntroducePage> createState() => _IntroducePageState();
}

class _IntroducePageState extends State<IntroducePage> {
  SwiperController _controller = SwiperController();
  int _index = 0;
  int currenPage = 0;
  List<Map<String, String>> introData = [
    {
      "image": "assets/images/introduce1.svg",
      "text1": "Xin chào!",
      "text2": "Đăng ký tài khoản ngay để nhận 03 tâm sách ( 50 Bcoin)"
    },
    {
      "image": "assets/images/introduce2.svg",
      "text1": "Hướng dẫn",
      "text2": "Đọc sách - Thăng bậc - Nhận thưởng Bcoin free"
    },
    {
      "image": "assets/images/introduce3.svg",
      "text1": "Nhận thông báo",
      "text2": "Share - Comment để lan tỏa kiến thức nhé !"
    },
    {
      "image": "assets/images/introduce3.svg",
      "text1": "Nhận thông báo 2",
      "text2": "Share - Comment để lan tỏa kiến thức nhé !"
    },
  ];

  @override
  void initState(){
    IntroBloc.of(context).add(InitIntroEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.WHITE,
      body: BlocBuilder<IntroBloc, IntroState>(
        builder: (context, state) {
      if (state is UpdateIntroState) {
        return Padding(
          padding: EdgeInsets.only(bottom: Spacing.viewPadding.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppValue.vSpaceSmall,
              Expanded(
                flex: 5,
                child: Swiper(
                  loop: false,
                    onIndexChanged: (value) {
                      setState(() {
                        currenPage = value;
                      });
                    },
                    controller: _controller,
                    itemCount: state.data.length,
                    itemBuilder: (context, index) => WidgetIntroduce(
                      image: state.data[index].pathImage,
                      text1: state.data[index].title,
                      text2: state.data[index].content,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    _buildButtonIntro(state.data.length),
                    InkWell(
                      onTap: () => AppNavigator.navigateMain(),
                      child: WidgetText(
                        title: 'Bỏ qua',
                        style: AppStyle.DEFAULT_16.copyWith(
                            decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(state.data.length, (index) => buildDot(index: index),),
                      ),
                    ),
                  ],
                ),
              ),
              AppValue.vSpaceSmall
            ],
          ),
        );
      }else {
        return Container();
      }
        }
      ),
    );
  }
  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: EdgeInsets.only(right: 7),
      height: 3,
      width: currenPage == index ? 10:10,
      decoration: BoxDecoration(
          color: currenPage == index ? HexColor('#FF9F00'): Color(0XFFA9A9A9) ,
          borderRadius: BorderRadius.circular(3)
      ),
    );
  }
  _buildButtonIntro(int lengthPage) {
          return Padding(
            padding: const EdgeInsets.only(right: 25,left: 25),
            child: WidgetButton(
              height: 48,
              onTap: () {
               setState(() {
                 if(currenPage<(lengthPage - 1))
                 {
                   _controller.move(currenPage+1);
                   currenPage=currenPage+1;
                 }
                 else
                 {
                   AppNavigator.navigateIntro_Recommend();
                 }
               });
              },
              // onTap: () {
              //   ShowDialogCustom.showLoading();
              // },
              //enable: state.status.isValidated,
              backgroundColor: HexColor('#FF9F00'),
              text: MESSAGES.NEXT,
            ),
          );
        }
}
