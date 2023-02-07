// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/hide_gg_fb/hide_gg_fb_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:formz/formz.dart';
import 'package:sumary_app/bloc/blocs.dart';
import 'package:sumary_app/bloc/login_facebook/login_facebook_bloc.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';

import '../../bloc/login_google/login_google_bloc.dart';
import '../../storages/share_local.dart';

class WidgetLoginForm extends StatefulWidget {
  final String? emailRegister;

  WidgetLoginForm({Key? key, this.emailRegister}) : super(key: key);
  @override
  _WidgetLoginFormState createState() => _WidgetLoginFormState();
}

class _WidgetLoginFormState extends State<WidgetLoginForm> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool obscurePassword = true;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['https://www.googleapis.com/auth/plus.login']);

  @override
  void initState() {
    HideGGFBBloc.of(context).add(InitGetHideGGFBEvent());

    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<LoginBloc>().add(EmailUnfocused());
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<LoginBloc>().add(PasswordUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = LoginBloc.of(context);
    final blocFacebook = LoginFacebookBloc.of(context);
    final blocGoogle = LoginGoogleBloc.of(context);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          GetSnackBarUtils.removeSnackBar();
          AppNavigator.navigateMain();
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
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: COLORS.BACKGROUND,
            borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextFieldUsername(bloc),
              AppValue.vSpaceMedium,
              _buildTextFieldPassword(bloc),
              AppValue.vSpace(10),
              _buildForgotPassword(),
              AppValue.vSpaceSmall,
              _buildButtonLogin(bloc),
              AppValue.vSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 1, width: 40, color: HexColor('#000000')),
                  const Text(' Hoặc ', style: AppStyle.DEFAULT_16),
                  Container(height: 1, width: 40, color: HexColor('#000000')),
                ],
              ),
              AppValue.vSpaceTiny,
              BlocBuilder<HideGGFBBloc, HideGGFBState>(
                builder: (context, state) {
                  if(state is UpdateGetHideGGFBState){
                    bool isHide = true;
                    if (state.data.value == 1){
                      isHide = true;
                    }else{isHide = false;}
                    return isHide ? Column(
                      children: [
                        _buildButtonLoginFacebook(blocFacebook),
                        AppValue.vSpaceSmall,
                        _buildButtonLoginGoogle(blocGoogle),
                      ],
                    ) : const SizedBox(height: 112);
                  }
                  else{
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => AppNavigator.navigateForgotPassword(),
        child: const Text(
          MESSAGES.FORGOT_PASSWORD + "?",
          style: AppStyle.DEFAULT_16,
        ),
      ),
    );
  }

  _buildButtonLogin(LoginBloc bloc) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return WidgetButton2(
            height: 48,
            onTap: () =>
            state.status.isValidated ? bloc.add(FormSubmitted()) : showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const WidgetDialog(
                  title: MESSAGES.NOTIFICATION,
                  content: 'Kiểm tra lại thông tin đăng nhập',
                );
              },
            ),
            enable: state.status.isValidated,
            backgroundColor: HexColor('#FF9F00'),
            text: MESSAGES.LOGIN,
          );
        }
    );
  }

  _buildButtonLoginFacebook(LoginFacebookBloc bloc) {
    return BlocBuilder<LoginFacebookBloc, LoginFacebookState>(
        builder: (context, state) {
          return WidgetButton2(
            height: 48,
            onTap: () async {
              final LoginResult loginResult = await FacebookAuth.instance.login();
              if(loginResult.accessToken!.token!=null){
                print('login facebook: ${loginResult.accessToken!.token}');
                bloc.add(LoginFacebookSubmitted(token: loginResult.accessToken!.token));
                AppNavigator.navigateMain();
              } else{
                print('login facebook false: ${loginResult.accessToken!.token}');
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const WidgetDialog(
                      title: MESSAGES.NOTIFICATION,
                      content: MESSAGES.CONNECT_ERROR,
                    );
                  },
                );
              }
            },
            boxDecoration: BoxDecoration(
              color: HexColor('#2896FF'),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: HexColor('#1877F2'),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)
                    )
                  ),
                    height: Get.height,
                    width: 48,
                    child: Center(child: Image.asset('assets/icons/facebook.png',height: 40,width: 40,fit: BoxFit.fill,))),
                AppValue.hSpace(25),
                WidgetText(
                  title: 'Đăng nhập với Facebook',
                  style: AppStyle.DEFAULT_18.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        }
    );
  }

  _buildButtonLoginGoogle(LoginGoogleBloc bloc) {
    return BlocBuilder<LoginGoogleBloc, LoginGoogleState>(
        builder: (context, state) {
          return WidgetButton2(
            height: 48,
            onTap: () async {
              final googleUser = await _googleSignIn.signIn();
              final GoogleSignInAuthentication? googleAuth =
              await googleUser?.authentication;
              if(googleAuth!.accessToken!=null){
                print('login gg: ${googleAuth.accessToken}');
                FirebaseMessaging messaging = FirebaseMessaging.instance;
                final tokenFirebase = await messaging.getToken() as String;
                bloc.add(LoginGoogleSubmitted(token: googleAuth.accessToken!,token_device: tokenFirebase));
                await AppNavigator.navigateMain();
              } else {
                print('login gg false: ${googleAuth.accessToken}');
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const WidgetDialog(
                      title: MESSAGES.NOTIFICATION,
                      content: MESSAGES.CONNECT_ERROR,
                    );
                  },
                );
              }
            },
            backgroundColor: HexColor('#FFFFFF'),
            boxDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: HexColor('#E3E3E3')),
              //color: HexColor('#E3E3E3')
            ),
            child: Row(
              children: [
                Container(
                    height: Get.height,
                    width: 48,
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                width: 1, color: HexColor('#E3E3E3'))
                        )
                    ),
                    child: Center(child: Image.asset('assets/icons/google.png',height: 30,width: 30,fit: BoxFit.fill,))
                ),
                AppValue.hSpace(30),
                WidgetText(
                  title: 'Đăng nhập với Google',
                  style: AppStyle.DEFAULT_18.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        }
    );
  }

  _buildTextFieldPassword(LoginBloc bloc) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return WidgetInput5(
            height: 48,
            onChanged: (value) => bloc.add(PasswordChanged(password: value)),
            errorText: state.password.invalid ? MESSAGES.PASSWORD_ERROR : null,
            obscureText: obscurePassword,
            focusNode: _passwordFocusNode,
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE,
                border: Border.all(
                    color: COLORS.GREY_400,
                    width: 1
                )
            ),
            hint: MESSAGES.PASSWORD_HINT,
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(MESSAGES.PASSWORD, style: AppStyle.DEFAULT_16.copyWith(color: Colors.black)),
            ),
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
          );
        }
    );
  }

  _buildTextFieldUsername(LoginBloc bloc) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return WidgetInput5(
            height: 48,
            onChanged: (value) => bloc.add(EmailChanged(email: value)),
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
            initialValue: widget.emailRegister ?? '',
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
}
