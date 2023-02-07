import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/blocs.dart';
import 'package:sumary_app/screens/forgot_password/index.dart';
import 'package:sumary_app/src/color.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../src/spacing.dart';
import 'forgot_password_otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<ForgotPasswordBloc>().add(EmailForgotPasswordUnfocused());
      }
    });
  }
  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    final bloc = ForgotPasswordBloc.of(context);
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          GetSnackBarUtils.removeSnackBar();
          AppNavigator.navigateForgotPasswordOTP(state.email.value);
        }
        if (state.status.isSubmissionInProgress) {
          GetSnackBarUtils.createProgress();
        }
        if (state.status.isSubmissionFailure) {
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
                          title: 'Quên mật khẩu',
                          style: AppStyle.DEFAULT_20_BOLD,
                          textAlign: TextAlign.center,
                        ),
                        WidgetText(
                          title: 'Vui lòng nhập email đăng ký tài khoản',
                          style: AppStyle.DEFAULT_14,
                          textAlign: TextAlign.center,
                        ),
                        AppValue.vSpaceSmall,
                        Padding(
                          padding: const EdgeInsets.only(right: 25,left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppValue.vSpaceSmall,
                              _buildTextFieldUsername(bloc),
                              AppValue.vSpaceSmall,
                              _buildButtonForgotPassword(bloc),
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
}

_buildButtonForgotPassword(ForgotPasswordBloc bloc) {
  return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return WidgetButton(
          height: 48,
          onTap: () => state.status.isValidated ? bloc.add(FormForgotPasswordSubmitted()) : showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const WidgetDialog(
                title: MESSAGES.NOTIFICATION,
                content: 'Kiểm tra lại thông tin!!',
              );
            },
          ),
          // onTap: () {
          //   //=> AppNavigator.navigateForgotPasswordOTP,
          //   Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPasswordOTPScreen()));
          // },
          enable: state.status.isValidated,
          backgroundColor: HexColor('#FF9F00'),
          text: MESSAGES.CONTINUE,
        );
      }
  );
}


_buildTextFieldUsername(ForgotPasswordBloc bloc) {
  return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return WidgetInput5(
          height: 48,
          onChanged: (value) => bloc.add(EmailForgotPasswordChanged(email: value)),
          inputType: TextInputType.emailAddress,
          errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
          boxDecoration: BoxDecoration(
              border: Border.all(
                color: COLORS.GREY_400, //                   <--- border color
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5),
              color: COLORS.WHITE
          ),
          labelText1: MESSAGES.EMAIL,
          hint: MESSAGES.EMAIL_HINT,
          fix: Container(
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(MESSAGES.EMAIL, style: AppStyle.DEFAULT_16),
          ),
          //   errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
        );
      }
  );
}
