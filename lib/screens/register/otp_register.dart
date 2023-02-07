import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sumary_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../bloc/otp_register/otp_register_bloc.dart';
import '../../src/spacing.dart';
import '../../src/src_index.dart';


class OTP_RegisterScreen extends StatefulWidget {

  @override
  OTP_RegisterScreenState createState() => OTP_RegisterScreenState();
}

class OTP_RegisterScreenState extends State<OTP_RegisterScreen> {

  String email = Get.arguments;

  String otp = '';


  @override
  Widget build(BuildContext context) {
    final bloc = OTPRegisterBloc.of(context);
    return BlocListener<OTPRegisterBloc, OtpRegisterState>(
      listener: (context, state) {
        if (state is SuccessResisterOTPState) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WidgetDialog2(
                title: Column(
                  children: [
                    AppValue.vSpaceSmall,
                    SizedBox(
                        height: Get.height*0.2,
                        child: Image.asset('assets/images/cuate.png',fit: BoxFit.contain,)),
                    AppValue.vSpaceTiny,
                    WidgetText(
                      title: 'Thưởng bạn lần đầu tham gia',
                      style: AppStyle.DEFAULT_16.copyWith(
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    WidgetText(
                      title: '30 Bcoin',
                      style: AppStyle.DEFAULT_16.copyWith(
                          fontWeight: FontWeight.w400,
                          color: HexColor('#EE4D2C')
                      ),
                    )
                  ],
                ),
                onTap1: (){
                  Get.back();
                  AppNavigator.navigateLogin(email: email);
                },
              );
            },
          );
        }
        if (state is InProgressResisterOTPState) {
          GetSnackBarUtils.createProgress();
        }
        if (state is FailureResisterOTPState) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return WidgetDialog(
                title: MESSAGES.NOTIFICATION,
                content: state.message,
              );
            },
          );
          // GetSnackBarUtils.createFailure(message: state.message);
        }
        if (state is SuccessResendOtpRegisterState) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WidgetDialog(
                  title: MESSAGES.NOTIFICATION,
                  content: MESSAGES.SUCCESS,
                  onTap1: (){
                    Get.back();
                    AppNavigator.navigateLogin();
                  }
              );
            },
          );
        }
        if (state is InProgressResendOtpRegisterState) {
          GetSnackBarUtils.createProgress();
        }
        if (state is FailureResendOtpRegisterState) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return WidgetDialog(
                title: MESSAGES.NOTIFICATION,
                content: state.message,
              );
            },
          );
          GetSnackBarUtils.createFailure(message: state.message);
        }
      },
      child: Scaffold(
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
                          SizedBox(
                              height: AppValue.heights*0.15,
                              width: AppValue.widths,
                              child: Image.asset('assets/images/clip2.png',
                                fit: BoxFit.cover,
                                // color: COLORS.RED1,
                              )
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
                              padding: EdgeInsets.only(left: 20,top: 10+Spacing.viewPadding.top),
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
                        AppValue.vSpaceSmall,
                        WidgetText(
                          title: 'Xác thực tài khoản',
                          style: AppStyle.DEFAULT_20_BOLD,
                          textAlign: TextAlign.center,
                        ),
                        WidgetText(
                          title: 'Vui lòng nhập mã OTP được gửi đến email:',
                          style: AppStyle.DEFAULT_14,
                          textAlign: TextAlign.center,
                        ),
                        WidgetText(
                          title: email,
                          style: AppStyle.DEFAULT_14.copyWith(
                              color: HexColor('#FF9F00')
                          ),
                          textAlign: TextAlign.center,
                        ),
                        AppValue.vSpaceSmall,
                        Padding(
                          padding: const EdgeInsets.only(right: 25,left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildTextFieldOtpRegister(bloc),
                              AppValue.vSpaceTiny,
                              _buildButtonOTPRegister(bloc),
                              _buildButtonOTPResend(bloc),
                            ],
                          ),
                        ),
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
  _buildTextFieldOtpRegister(OTPRegisterBloc bloc) {
    return PinCodeTextField(
      autoFocus: true,
      keyboardType: TextInputType.number,
      appContext: context,
      length: 6,
      onChanged: (value) {
        setState(() {
          otp = value;
        });
      },
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 48,
          fieldWidth: 44,
          inactiveColor: COLORS.GREY_400,
          activeColor: COLORS.GREY_400,
          selectedColor: COLORS.BLACK
      ),
    );
  }

  _buildButtonOTPRegister(OTPRegisterBloc bloc) {
    return WidgetButton(
      onTap: () => bloc.add(RegisterOTPSubmitted(otp: otp)),
      backgroundColor: HexColor('#FF9F00'),
      text: MESSAGES.CONFIRMATION,
    );
  }

  _buildButtonOTPResend(OTPRegisterBloc bloc) {
    return InkWell(
      onTap: ()=> bloc.add(OTPResendRegister()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetText(
              title: 'Không nhận được mã?',
              style: AppStyle.DEFAULT_16
          ),
          WidgetText(
              title: ' Gửi lại',
              style:AppStyle.DEFAULT_16.copyWith(
                  color: COLORS.PRIMARY_COLOR
              )
          ),
        ],
      ),
    );
  }
}
