import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/blocs.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';

import '../api_resfull/user_repository.dart';
import '../storages/share_local.dart';

class AnimatedLogo extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);
  AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      // child: Opacity(
      //   opacity: _opacityTween.evaluate(animation),
      child: Container(
          // height: _sizeTween.evaluate(animation),
          // width: _sizeTween.evaluate(animation),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(IMAGES.LOGO_APP, fit: BoxFit.fill, height: AppValue.heights * 0.15),
              AppValue.vSpaceSmall,
              WidgetText(
                title: 'TIỀM NĂNG MASTER',
                style: AppStyle.DEFAULT_24.copyWith(
                  color: COLORS.WHITE,
                  fontWeight: FontWeight.w700,
                  fontSize: 28
                ),
              ),
              SizedBox(height: AppValue.heights*0.3)
            ],
          )),
      // ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class SplashPage extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late Timer _timer;
  late String? firstTime;
  @override
  void initState() {
    getFirstTime();
    super.initState();
    getToken();
    shareLocal.putBools(PreferencesKey.AUTO_NEXT_AUDIO,false);
    //GetLogoBloc.of(context)..add(InitGetLogoEvent());
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    final token = await messaging.getToken() as String;
    print("firebase: $token");
  }

  getFirstTime() async{
    firstTime = await shareLocal.getString(PreferencesKey.FIRST_TIME);
    print("aaaaaaaa: $firstTime");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) async {
          // var firstTime = await shareLocal.getBools(PreferencesKey.FIRST_TIME);
          // print('asda: $firstTime');
          if(state.status == AuthenticationStatus.authenticated){
            _timer = new Timer(const Duration(seconds: 1),
                    () => AppNavigator.navigateMain());
          }
          else if(state.status == AuthenticationStatus.unauthenticated && firstTime !=null){
            //TODO: kiet
            _timer = new Timer(const Duration(seconds: 1),
                    (){
                      AppNavigator.navigateMain();
                    }
            );
          }
          else{
            _timer = new Timer(const Duration(seconds: 1),
                    // () => AppNavigator.navigateIntro1());
                    () => AppNavigator.navigateSurveyFields());
          }
          // switch (state.status) {
          //   case AuthenticationStatus.authenticated:
          //     _timer = new Timer(const Duration(seconds: 1),
          //         () => AppNavigator.navigateMain());
          //     break;
          //   case AuthenticationStatus.unauthenticated:
          //     _timer = new Timer(const Duration(seconds: 1),
          //         () => AppNavigator.navigateLogin());
          //     break;
          //   default:
          //     break;
          // }
          // if(firstTime == false || firstTime == null)
          //   _timer = new Timer(const Duration(seconds: 1), () => AppNavigator.navigateIntro());
          // else
          //   _timer = new Timer(const Duration(seconds: 1), () => AppNavigator.navigateMain());
        },
        child: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage("assets/images/splash.png"),
                      fit: BoxFit.contain,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        HexColor('#EE4D2C'),
                        HexColor('#FF9F00')
                      ],
                    )
                ),
                child: AnimatedLogo(animation: animation))));
  }

  @override
  void dispose() {
    controller.dispose();
    _timer.cancel();
    super.dispose();
  }
}
