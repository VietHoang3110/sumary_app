// ignore: import_of_legacy_library_into_null_safe
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/blocs.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';

class WidgetRegisterForm extends StatefulWidget {
  @override
  _WidgetRegisterFormState createState() => _WidgetRegisterFormState();
}

class _WidgetRegisterFormState extends State<WidgetRegisterForm> {
  final _fullNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _passwordAgainFocusNode = FocusNode();
  String rePass = '';
  bool obscurePassword = true;
  bool obscurePasswordAgain = true;
  String _mgt = '';


  @override
  void initState() {
    super.initState();
    _fullNameFocusNode.addListener(() {
      if (!_fullNameFocusNode.hasFocus) {
        context.read<RegisterBloc>().add(FullNameRegisterUnfocused());
      }
    });
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<RegisterBloc>().add(EmailRegisterUnfocused());
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<RegisterBloc>().add(PasswordRegisterUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = RegisterBloc.of(context);
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          GetSnackBarUtils.removeSnackBar();
          AppNavigator.navigateOTPRegiter(state.email.value);
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

          //GetSnackBarUtils.createFailure(message: state.message);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: COLORS.BACKGROUND,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextFieldFullName(bloc),
              AppValue.vSpace(20),
              _buildTextFieldEmail(bloc),
              AppValue.vSpace(20),
              _buildTextFieldPassword(bloc),
              AppValue.vSpace(20),
              _buildTextFieldPassword_Again(bloc),
              AppValue.vSpace(20),
              _buildTextFieldMGT(),
              AppValue.vSpace(20),
              _buildButtonRegister(bloc),
            ],
          ),
        ),
      ),
    );
  }

  _buildButtonRegister(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return WidgetButton2(
            height: 48,
            onTap: () => (state.status.isValidated && (state.password.value == rePass)) ? bloc.add(RegisterFormSubmitted(referrer: _mgt)) : showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const WidgetDialog(
                  title: MESSAGES.NOTIFICATION,
                  content: 'Kiểm tra lại thông tin',
                );
              },
            ),
            enable: state.status.isValidated,
            backgroundColor: HexColor('#FF9F00'),
            text: MESSAGES.REGISTER,
          );
        }
    );
  }

  _buildTextFieldPassword_Again(RegisterBloc bloc) {
          return WidgetInput5(
            height: 48,
            onChanged: (value){
              rePass = value;
            },
            inputType: TextInputType.emailAddress,
            obscureText: obscurePasswordAgain,
            focusNode: _passwordAgainFocusNode,
            boxDecoration: BoxDecoration(
                border: Border.all(
                  color: COLORS.GREY_400, //                   <--- border color
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE
            ),
            hint: MESSAGES.PASSWORD_AGAIN,
            endIcon: GestureDetector(
              onTap: () => setState(() => obscurePasswordAgain = !obscurePasswordAgain),
              child: Icon(
                obscurePasswordAgain
                    ? CommunityMaterialIcons.eye
                    : CommunityMaterialIcons.eye_off,
                color: COLORS.GREY,
                size: 22,
              ),
            ),
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(MESSAGES.PASSWORD_AGAIN, style: AppStyle.DEFAULT_16),
            ),
            //   errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
          );
  }

  _buildTextFieldMGT() {
          return WidgetInput5(
            height: 48,
            boxDecoration: BoxDecoration(
                border: Border.all(
                  color: COLORS.GREY_400, //                   <--- border color
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE
            ),
            onChanged: (value){
              setState(() {
                _mgt = value;
              });
            },
            hint: "Nhập mã giới thiệu",
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text("Mã giới thiệu", style: AppStyle.DEFAULT_16),
            ),
            //   errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
          );
  }

  _buildTextFieldPassword(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return WidgetInput5(
            height: 48,
            onChanged: (value) => bloc.add(PasswordRegisterChanged(password: value)),
            inputType: TextInputType.emailAddress,
            //errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
            obscureText: obscurePassword,
            focusNode: _passwordFocusNode,
            boxDecoration: BoxDecoration(
                border: Border.all(
                  color: COLORS.GREY_400, //                   <--- border color
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE
            ),
            labelText1: MESSAGES.PASSWORD,
            hint: MESSAGES.PASSWORD_HINT,
            endIcon: GestureDetector(
              onTap: () => setState(() => obscurePassword = !obscurePassword),
              child: Icon(
                obscurePassword
                    ? CommunityMaterialIcons.eye
                    : CommunityMaterialIcons.eye_off,
                color: COLORS.GREY,
                size: 22,
              ),
            ),
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(MESSAGES.PASSWORD, style: AppStyle.DEFAULT_16),
            ),
            //   errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
          );
        }
    );
  }

  _buildTextFieldEmail(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return WidgetInput5(
          height: 48,
          onChanged: (value) => bloc.add(EmailRegisterChanged(email: value)),
          inputType: TextInputType.emailAddress,
          focusNode: _emailFocusNode,
          errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
          boxDecoration: BoxDecoration(
              border: Border.all(
                color: COLORS.GREY_400, //                   <--- border color
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5),
              color: COLORS.WHITE
          ),
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

  _buildTextFieldFullName(RegisterBloc bloc) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return WidgetInput5(
          height: 48,
          onChanged: (value) => bloc.add(FullNameRegisterChanged(name: value)),
          boxDecoration: BoxDecoration(
              border: Border.all(
                color: COLORS.GREY_400, //                   <--- border color
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5),
              color: COLORS.WHITE
          ),
          hint: MESSAGES.FULL_NAME_HINT,
          fix: Container(
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(MESSAGES.FULL_NAME, style: AppStyle.DEFAULT_16),
          ),
          //   errorText: state.email.invalid ? MESSAGES.EMAIL_ERROR : null,
        );
      }
    );
  }
}
