import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sumary_app/src/src_index.dart';

class WidgetButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;
  final Color? backgroundColor, textColor;
  final double? height, width;
  final EdgeInsets? padding;
  final bool? enable;
  final Widget? child;
  final BoxDecoration? boxDecoration;

  const WidgetButton({
    Key? key,
    required this.onTap,
    this.text,
    this.backgroundColor = COLORS.PRIMARY_COLOR,
    this.textColor = COLORS.WHITE,
    this.height = 55,
    this.padding,
    this.width,
    this.enable = true,
    this.child,
    this.boxDecoration,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(vertical: 16),
        child: WidgetContainerCenter(
            width: width ?? Get.width,
            height: height ?? 35,
            boxDecoration: boxDecoration ?? BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5)
            ),
            child: child ?? Text(text!, style: AppStyle.DEFAULT_18.copyWith(color: textColor),
        )),
      ),
    );
  }
}

class WidgetButton2 extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;
  final Color? backgroundColor, textColor;
  final double? height, width;
  final EdgeInsets? padding;
  final bool? enable;
  final Widget? child;
  final BoxDecoration? boxDecoration;

  const WidgetButton2({
    Key? key,
    required this.onTap,
    this.text,
    this.backgroundColor = COLORS.PRIMARY_COLOR,
    this.textColor = COLORS.WHITE,
    this.height = 55,
    this.padding,
    this.width,
    this.enable = true,
    this.child,
    this.boxDecoration,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: WidgetContainerCenter(
          width: width ?? AppValue.widths,
          height: height ?? 35,
          boxDecoration: boxDecoration ?? BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5)
          ),
          child: child ?? Text(text!, style: AppStyle.DEFAULT_18.copyWith(color: textColor,fontWeight: FontWeight.w500),
          )),
    );
  }
}

class WidgetButton3 extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;
  final Color? backgroundColor, textColor;
  final double? height, width;
  final EdgeInsets? padding;
  final bool? enable;
  final Widget? child;
  final BoxDecoration? boxDecoration;

  const WidgetButton3({
    Key? key,
    required this.onTap,
    this.text,
    this.backgroundColor = COLORS.PRIMARY_COLOR,
    this.textColor = COLORS.WHITE,
    this.height = 55,
    this.padding,
    this.width,
    this.enable = true,
    this.child,
    this.boxDecoration,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: WidgetContainerCenter(
          width: width ?? Get.width,
          height: height ?? 35,
          boxDecoration: boxDecoration ?? BoxDecoration(
              color: backgroundColor,
          ),
          child: child ?? Text(text!, style: AppStyle.DEFAULT_18.copyWith(color: textColor),
          )),
    );
  }
}

class WidgetButton4 extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;
  final Color? backgroundColor, textColor;
  final double? height, width;
  final EdgeInsets? padding;
  final bool? enable;
  final Widget? child;
  final BoxDecoration? boxDecoration;

  const WidgetButton4({
    Key? key,
    required this.onTap,
    this.text,
    this.backgroundColor = COLORS.PRIMARY_COLOR,
    this.textColor = COLORS.WHITE,
    this.height = 55,
    this.padding,
    this.width,
    this.enable = true,
    this.child,
    this.boxDecoration,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: WidgetContainerCenter(
          width: width,
          height: height ?? 35,
          boxDecoration: boxDecoration ?? BoxDecoration(
            color: backgroundColor,
          ),
          child: child ?? Text(text!, style: AppStyle.DEFAULT_20.copyWith(fontWeight: FontWeight.w500,color: textColor),
          )),
    );
  }
}
