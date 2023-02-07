import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/src/models/validate_form/confirm_password.dart';

import '../../../bloc/blocs.dart';
import '../../../bloc/change_password/change_password_bloc.dart';
import '../../../src/src_index.dart';
import '../../../widgets/widget_button.dart';
import '../../../widgets/widget_dialog.dart';
import '../../../widgets/widget_input.dart';
import '../../../widgets/widget_text.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  bool obscurePasswordOld = true;
  bool obscurePasswordNew = true;
  bool obscurePasswordNewAgain = true;
  final _newPasswordFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPassFocusNode =FocusNode();

  @override
  void initState() {
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<ChangePasswordBloc>().add(OldPasswordUnfocused());
      }
    });
    _newPasswordFocusNode.addListener(() {
      if (!_newPasswordFocusNode.hasFocus) {
        context.read<ChangePasswordBloc>().add(NewPasswordUnfocused());
      }
    });
    _confirmPassFocusNode.addListener(() {
      if (!_confirmPassFocusNode.hasFocus) {
        context.read<ChangePasswordBloc>().add(RepeatPasswordUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _confirmPassFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ChangePasswordBloc.of(context);
    return Scaffold(
      backgroundColor: COLORS.BACKGROUND,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Thay đổi mật khẩu',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: ()=> AppNavigator.navigateBack(),
            child: const Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: BlocListener<ChangePasswordBloc,ChangePasswordState>(
            listener: (context, state) {
              if (state.status.isSubmissionSuccess) {
                GetSnackBarUtils.removeSnackBar();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return WidgetDialog(
                      textButton1: "OK",
                      onTap1: ()=>{AppNavigator.navigateLogin()},
                      title: "Hoàn thành",
                      content: state.message,
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
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return WidgetDialog(
                      title: MESSAGES.NOTIFICATION,
                      content: state.message,
                    );
                  },
                );
                //GetSnackBarUtils.createFailure(message: state.message);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextFieldPassword_OLD(bloc),
                AppValue.vSpaceMedium,
                _buildTextFieldPassword(bloc),
                AppValue.vSpaceMedium,
                _buildTextFieldPassword_Again(bloc),
                AppValue.vSpaceMedium,
                _buildButtonForgotPasswordReset(bloc)
              ],
            ),
          ),
        ),
      ),
    );
  }
  _buildTextFieldPassword_OLD(ChangePasswordBloc bloc) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
        builder: (context, state) {
          return WidgetInput5(
            height: 48,
            onChanged: (value) => bloc.add(OldPasswordChanged(oldPassword: value)),
            errorText: state.oldPassword.invalid ? MESSAGES.PASSWORD_ERROR : null,
            obscureText: obscurePasswordOld,
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE,
                border: Border.all(
                  color: COLORS.GREY_400,
                  width: 1,
                )
            ),
            hint: 'Nhập mật khẩu hiện tại',
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text("Mật khẩu hiện tại", style: AppStyle.DEFAULT_16),
            ),
            endIcon: GestureDetector(
              onTap: ()=> setState(() => obscurePasswordOld = !obscurePasswordOld),
              child: Icon(
                obscurePasswordOld
                    ? CommunityMaterialIcons.eye
                    : CommunityMaterialIcons.eye_off,
                color: COLORS.GREY,
                size: 22,
              ),
            ),
          );
        }
    );
  }

  _buildTextFieldPassword(ChangePasswordBloc bloc) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
        builder: (context, state) {
          return WidgetInput5(
            height: 48,
            onChanged: (value) => bloc.add(NewPasswordChanged(newPassword: value)),
            errorText: state.newPassword.invalid ? MESSAGES.PASSWORD_ERROR : null,
            obscureText: obscurePasswordNew,
            focusNode: _passwordFocusNode,
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE,
                border: Border.all(
                  color: COLORS.GREY_400,
                  width: 1,
                )
            ),
            hint: MESSAGES.PASSWORD_HINT_NEW,
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(MESSAGES.PASSWORD_NEW, style: AppStyle.DEFAULT_16),
            ),
            endIcon: GestureDetector(
              onTap: ()=> setState(() => obscurePasswordNew = !obscurePasswordNew),
              child: Icon(
                obscurePasswordNew
                    ? CommunityMaterialIcons.eye
                    : CommunityMaterialIcons.eye_off,
                color: COLORS.GREY,
                size: 22,
              ),
            ),
          );
        }
    );
  }

  _buildTextFieldPassword_Again(ChangePasswordBloc bloc) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
        builder: (context, state) {
          return WidgetInput5(
            height: 48,
            onChanged: (value) => bloc.add(RepeatPasswordChanged(repeatPassword: value)),
            errorText: state.repeatPassword.invalid ? MESSAGES.CONFIRM_PASSWORD_ERROR : null,
            obscureText: obscurePasswordNewAgain,
            focusNode: _newPasswordFocusNode,
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE,
                border: Border.all(
                  color: COLORS.GREY_400,
                  width: 1,
                )
            ),
            hint: MESSAGES.PASSWORD_HINT_NEW_AGAIN,
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(MESSAGES.PASSWORD_AGAIN, style: AppStyle.DEFAULT_16),
            ),
            endIcon: GestureDetector(
              onTap: ()=> setState(() => obscurePasswordNewAgain = !obscurePasswordNewAgain),
              child: Icon(
                obscurePasswordNewAgain
                    ? CommunityMaterialIcons.eye
                    : CommunityMaterialIcons.eye_off,
                color: COLORS.GREY,
                size: 22,
              ),
            )
          );
        }
    );
  }

  _buildButtonForgotPasswordReset(ChangePasswordBloc bloc) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return WidgetButton(
            height: 48,
            //onTap: () => state.status.isValidated ? bloc.add(RegisterFormSubmitted()) : null,
            onTap: () {
              state.status.isValidated ?bloc.add(FormChangePasswordSubmitted()):showDialog(context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const WidgetDialog(
                      title: MESSAGES.NOTIFICATION,
                      content: 'Kiểm tra lại thông tin',
                    );
                  }
              );
            },
            //enable: state.status.isValidated,
            backgroundColor: HexColor('#FF9F00'),
            text: "Hoàn thành",
          );
        }
    );
  }
}
