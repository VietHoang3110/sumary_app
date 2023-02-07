import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';

class WidgetDialog extends StatelessWidget {
  final VoidCallback? onTap2, onTap1;
  final String? title;
  final String? content;
  final String? textButton1;
  final String? textButton2;
  final Color? backgroundButton1;
  final Color? textColorButton1;
  final Color? backgroundButton2;
  final Color? textColorButton2;
  final bool? twoButton;

  const WidgetDialog({
    Key? key,
    this.onTap1,
    this.onTap2,
    this.title,
    this.content,
    this.textButton1 = MESSAGES.OK,
    this.textButton2 = MESSAGES.CANCEL,
    this.textColorButton1 = COLORS.WHITE,
    this.textColorButton2 = COLORS.BLACK,
    this.backgroundButton1 = COLORS.PRIMARY_COLOR,
    this.backgroundButton2 = COLORS.WHITE,
    this.twoButton = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          contentPadding: const EdgeInsets.only(top: 10.0),
          content: Container(
            width: AppValue.widths-30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Text(title!, style: AppStyle.DEFAULT_16_BOLD),
                      AppValue.vSpaceSmall,
                      Text(content!, style: AppStyle.DEFAULT_16, textAlign: TextAlign.center,),
                    ],
                  ),
                ),
                AppValue.vSpaceSmall,
                const Divider(
                  height: 1,
                  color: COLORS.GREY,
                ),
                twoButton == false ?
                InkWell(
                  onTap: onTap1 ?? ()=> AppNavigator.navigateBack(),
                  child: Container(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    decoration: BoxDecoration(
                      color: backgroundButton1,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0)),
                    ),
                    child: Text(
                      textButton1!,
                      style: AppStyle.DEFAULT_16_BOLD.copyWith(color: textColorButton1!),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                    :
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: onTap2  ?? ()=> AppNavigator.navigateBack(),
                        child: Container(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            color: backgroundButton2,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: const Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          child: Text(
                            textButton2!,
                            style: AppStyle.DEFAULT_16_BOLD.copyWith(color: textColorButton2!),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: onTap1 ?? ()=> AppNavigator.navigateBack(),
                        child: Container(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            color: backgroundButton1,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10.0)),
                          ),
                          child: Text(
                            textButton1!,
                            style: AppStyle.DEFAULT_16_BOLD.copyWith(color: textColorButton1!),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )

    );
  }
}


class WidgetDialog2 extends StatelessWidget {
  final VoidCallback?  onTap1;
  final Widget? title;
  final String? textButton1;
  final Color? backgroundButton1;
  final Color? textColorButton1;

  const WidgetDialog2({
    Key? key,
    this.onTap1,
    this.title,
    this.textButton1 = MESSAGES.OK,
    this.textColorButton1 = COLORS.WHITE,
    this.backgroundButton1 = COLORS.PRIMARY_COLOR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: const EdgeInsets.only(top: 10.0),
          content: SizedBox(
            width: AppValue.widths,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(child: title),
                ),
                AppValue.vSpaceSmall,
                InkWell(
                  onTap: onTap1 ?? ()=> AppNavigator.navigateBack(),
                  child: Container(
                    width: Get.width*0.7,
                    height: 48,
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    decoration: BoxDecoration(
                      color: backgroundButton1,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text(
                      textButton1!,
                      style: AppStyle.DEFAULT_16_BOLD.copyWith(color: textColorButton1!),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                AppValue.vSpaceSmall,
              ],
            ),
          ),
        )

    );
  }
}

// Todo: kiệt - giới thiệu dịch vụ
class WidgetDialogCS extends StatelessWidget {
  final VoidCallback? onTap2, onTap1;
  final String? title;
  final String? content;
  final String? textButton1;
  final String? textButton2;
  final Color? backgroundButton1;
  final Color? textColorButton1;
  final Color? backgroundButton2;
  final Color? textColorButton2;
  final bool? twoButton;

  const WidgetDialogCS({
    Key? key,
    this.onTap1,
    this.onTap2,
    this.title,
    this.content,
    this.textButton1 = MESSAGES.OK,
    this.textButton2 = MESSAGES.CANCEL,
    this.textColorButton1 = COLORS.WHITE,
    this.textColorButton2 = COLORS.BLACK,
    this.backgroundButton1 = COLORS.PRIMARY_COLOR,
    this.backgroundButton2 = COLORS.WHITE,
    this.twoButton = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          contentPadding: const EdgeInsets.only(top: 10.0),
          content: Container(
            width: AppValue.widths-30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Text(title!, style: AppStyle.DEFAULT_16_BOLD),
                      AppValue.vSpaceSmall,
                      Text(content!, style: AppStyle.DEFAULT_16, textAlign: TextAlign.center,),
                    ],
                  ),
                ),
                AppValue.vSpaceSmall,
                const Divider(
                  height: 1,
                  color: COLORS.GREY,
                ),
                twoButton == false ?
                InkWell(
                  onTap: onTap1 ?? ()=> AppNavigator.navigateBack(),
                  child: Container(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    decoration: BoxDecoration(
                      color: backgroundButton1,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0)),
                    ),
                    child: Text(
                      textButton1!,
                      style: AppStyle.DEFAULT_16_BOLD.copyWith(color: textColorButton1!),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                    :
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: onTap2  ?? ()=> AppNavigator.navigateBack(),
                        child: Container(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            color: backgroundButton2,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: const Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          child: Text(
                            textButton2!,
                            style: AppStyle.DEFAULT_16_BOLD.copyWith(color: textColorButton2!),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: onTap1 ?? ()=> AppNavigator.navigateBack(),
                        child: Container(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            color: backgroundButton1,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10.0)),
                          ),
                          child: Text(
                            textButton1!,
                            style: AppStyle.DEFAULT_16_BOLD.copyWith(color: textColorButton1!),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )

    );
  }
}