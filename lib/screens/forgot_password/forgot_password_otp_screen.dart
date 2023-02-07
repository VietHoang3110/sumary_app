import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sumary_app/bloc/blocs.dart';
import 'package:sumary_app/bloc/otp_resend/otp_resend_bloc.dart';
import 'package:sumary_app/src/spacing.dart';
import 'package:sumary_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../src/src_index.dart';


class ForgotPasswordOTPScreen extends StatefulWidget {

  @override
  ForgotPasswordOTPScreenState createState() => ForgotPasswordOTPScreenState();
}

class ForgotPasswordOTPScreenState extends State<ForgotPasswordOTPScreen> {


  String email = Get.arguments;

  String otp = '';


  @override
  Widget build(BuildContext context) {
    final bloc = ForgotPasswordOTPBloc.of(context);
    return BlocListener<ForgotPasswordOTPBloc, ForgotPasswordOTPState>(
      listener: (context, state) {
        if (state is SuccessForgotPasswordOTPState) {
          GetSnackBarUtils.removeSnackBar();
          AppNavigator.navigateForgotPasswordReset();
        }
        if (state is InProgressForgotPasswordOTPState) {
          GetSnackBarUtils.createProgress();
        }
        if (state is FailureForgotPasswordOTPState) {
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
        if (state is SuccessResendOtpState) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WidgetDialog(
                  title: MESSAGES.NOTIFICATION,
                  content: MESSAGES.SUCCESS,
                  onTap1: () {
                    Get.back();
                  }
              );
            },
          );
        }
        if (state is InProgressResendOtpState) {
          GetSnackBarUtils.createProgress();
        }
        if (state is FailureResendOtpState) {
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
        body: SingleChildScrollView(
          child: WidgetTouchHideKeyBoard(
            child: Container(
                height: Get.height,
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
                    Column(
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
                          ), textAlign: TextAlign.center,
                        ),
                        AppValue.vSpaceMedium,
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25,left: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _buildTextFieldOtpForgot(bloc),
                                AppValue.vSpaceTiny,
                                _buildButtonForgotPasswordOTP(bloc),
                                _buildButtonResentOTP(bloc),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }

  _buildTextFieldOtpForgot(ForgotPasswordOTPBloc bloc) {
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
  _buildButtonForgotPasswordOTP(ForgotPasswordOTPBloc bloc) {
    return WidgetButton(
      height: 48,
      onTap: () =>
      bloc.add(FormForgotPasswordOTPSubmitted(otp: otp)),
      //       : showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (BuildContext context) {
      //     return const WidgetDialog(
      //       title: MESSAGES.NOTIFICATION,
      //       content: 'OTP sai!!',
      //     );
      //   },
      // ),
      backgroundColor: HexColor('#FF9F00'),
      text: MESSAGES.CONFIRMATION,
    );
  }

  _buildButtonResentOTP(ForgotPasswordOTPBloc bloc) {
    return InkWell(
      onTap: ()=> bloc.add(OTPResend()),
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



