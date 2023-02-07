
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/blocs.dart';
import 'package:sumary_app/src/spacing.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../bloc/reset_password/reset_password_bloc.dart';


class ForgotPasswordResetScreen extends StatefulWidget {

  @override
  ForgotPasswordResetScreenState createState() => ForgotPasswordResetScreenState();
}

class ForgotPasswordResetScreenState extends State<ForgotPasswordResetScreen> {
  bool obscurePassword = true;
  bool obscurePasswordAgain = true;
  final _newPasswordFocusNode = FocusNode();
  final _confirmPassFocusNode =FocusNode();

  @override
  void initState() {
    _newPasswordFocusNode.addListener(() {
      if (!_newPasswordFocusNode.hasFocus) {
        context.read<ResetPasswordBloc>().add(NewPasswordResetUnfocused());
      }
    });
    _confirmPassFocusNode.addListener(() {
      if (!_confirmPassFocusNode.hasFocus) {
        context.read<ResetPasswordBloc>().add(RepeatPasswordResetUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _newPasswordFocusNode.dispose();
    _confirmPassFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ResetPasswordBloc.of(context);
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
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
                            height:AppValue.heights*0.85 ,
                          ),
                          SizedBox(
                              height: AppValue.heights*0.15,
                              width: AppValue.widths,
                              child: Image.asset('assets/images/clip2.png',
                                fit: BoxFit.cover,
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
                          title: 'Đổi mật khẩu',
                          style: AppStyle.DEFAULT_20_BOLD,
                          textAlign: TextAlign.center,
                        ),
                        WidgetText(
                          title: 'Nhập mật khẩu mới để đăng nhập tài khoản',
                          style: AppStyle.DEFAULT_14,
                          textAlign: TextAlign.center,
                        ),
                        AppValue.vSpaceSmall,
                        Padding(
                          padding: const EdgeInsets.only(right: 25,left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppValue.vSpaceTiny,
                              _buildTextFieldPassword(bloc),
                              AppValue.vSpaceMedium,
                              _buildTextFieldPassword_Again(bloc),
                              AppValue.vSpaceMedium,
                              _buildButtonForgotPasswordReset(bloc),
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



_buildTextFieldPassword(ResetPasswordBloc bloc) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        builder: (context, state) {
          return WidgetInput5(
            height: 48,
            obscureText: obscurePassword,
            onChanged: (value) => bloc.add(NewPasswordResetChanged(newPassword: value)),
            errorText: state.newPassword.invalid ? MESSAGES.EMAIL_ERROR : null,
            boxDecoration: BoxDecoration(
                border: Border.all(
                  color: COLORS.GREY_400, //                   <--- border color
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE
            ),
            labelText1: MESSAGES.PASSWORD,
            hint: MESSAGES.PASSWORD_HINT_NEW,
            endIcon: GestureDetector(
              onTap: () => setState(() => obscurePassword = !obscurePassword),
              child: Icon(
                obscurePassword
                    ? CommunityMaterialIcons.eye_outline
                    : CommunityMaterialIcons.eye_off_outline,
                color: COLORS.GREY,
                size: 22,
              ),
            ),
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: const Text(MESSAGES.PASSWORD_NEW, style: AppStyle.DEFAULT_16),
            ),
          );
        }
    );
  }
  _buildTextFieldPassword_Again(ResetPasswordBloc bloc) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        builder: (context, state) {
          return WidgetInput5(
            height: 48,
            onChanged: (value) => bloc.add(RepeatPasswordResetChanged(repeatPassword: value)),
            inputType: TextInputType.emailAddress,
            obscureText: obscurePasswordAgain,
            errorText: state.repeatPassword.invalid ? MESSAGES.PASS_AGAIN_ERROR : null,
            boxDecoration: BoxDecoration(
                border: Border.all(
                  color: COLORS.GREY_400, //                   <--- border color
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE
            ),
            labelText1: MESSAGES.PASSWORD_AGAIN,
            hint: MESSAGES.PASSWORD_HINT_NEW_AGAIN,
            endIcon: GestureDetector(
              onTap: () => setState(() => obscurePasswordAgain = !obscurePasswordAgain),
              child: Icon(
                obscurePasswordAgain
                    ? CommunityMaterialIcons.eye_outline
                    : CommunityMaterialIcons.eye_off_outline,
                color: COLORS.GREY,
                size: 22,
              ),
            ),
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: const Text(MESSAGES.PASSWORD_NEW_AGAIN, style: AppStyle.DEFAULT_16),
            ),
          );
        }
    );
  }

  _buildButtonForgotPasswordReset(ResetPasswordBloc bloc) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return WidgetButton(
            height: 48,
            onTap: () => state.status.isValidated ? bloc.add(FormResetPasswordSubmitted()) : showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const WidgetDialog(
                  title: MESSAGES.NOTIFICATION,
                  content: 'Thất bại!!',
                );
              },
            ),
            enable: state.status.isValidated,
            backgroundColor: HexColor('#FF9F00'),
            text: 'Hoàn thành',
          );
        }
    );
  }
}

