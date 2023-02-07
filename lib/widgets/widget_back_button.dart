import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:flutter/material.dart';

class WidgetBackButton extends StatelessWidget {
  final Function? onTap;
  final Color? color, bgColors;
  final String? icon;
  final double? width, height;
  const WidgetBackButton({
    Key? key,
    this.onTap,
    this.color,
    this.bgColors,
    this.icon,
    this.width,
    this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetContainerImage(
      boxDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColors
      ),
      image: ICONS.ICON_BACK,
      onTap: ()=> AppNavigator.navigateBack(),
    );
  }
}

class WidgetBackHomeButton extends StatelessWidget {
  final Function? onTap;
  final Color? color, bgColors;
  final String? icon;
  final double? width, height;
  const WidgetBackHomeButton({
    Key? key,
    this.onTap,
    this.color,
    this.bgColors,
    this.icon,
    this.width,
    this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetContainerImage(
      boxDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColors
      ),
      image: ICONS.ICON_BACK,
      onTap: ()=> AppNavigator.navigateMain(),
    );
  }
}

class WidgetBackButton2 extends StatelessWidget {
  final Function? onTap;
  final Color? color, bgColors;
  final Color? colorIcon;
  final String? icon;
  final double? width, height;
  const WidgetBackButton2({
    Key? key,
    this.onTap,
    this.color,
    this.bgColors,
    this.icon,
    this.width,
    this.height,
    this.colorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Get.back(),
      child: SizedBox(
          height: 22,
          width: 22,
          child: Center(child: Image.asset(ICONS.ICON_BACK,fit: BoxFit.cover,color: colorIcon,))),
    );
    //   WidgetContainerImage(
    //   boxDecoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       color: bgColors
    //   ),
    //   image:ICONS.ICON_BACK,
    //   colorImage: colorIcon,
    //   fit: BoxFit.fill,
    //   onTap: ()=> Get.back(),
    // );
  }
}
