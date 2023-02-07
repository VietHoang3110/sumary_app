import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sumary_app/src/color.dart';

class WidgetCachedImageError extends StatelessWidget {
  final String icon;

  const WidgetCachedImageError(this.icon);

  @override
  Widget build(BuildContext context) {
    return Image.asset(icon);
  }
}

class WidgetContainerImage extends StatelessWidget {
  final double? width, height, padding, margin;
  final String? image;
  final BoxDecoration? boxDecoration;
  final Color? colorImage;
  final bool? isRadius;
  final BoxFit? fit;
  final GestureTapCallback? onTap;
  final BorderRadius? borderRadius;

  const WidgetContainerImage(
      {this.width = 30, this.height = 30, this.padding = 0, this.margin = 0, this.borderRadius, this.image, this.boxDecoration, this.colorImage, this.isRadius, this.onTap, this.fit = BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: boxDecoration,
        padding: EdgeInsets.all(padding!),
        margin: EdgeInsets.all(margin!),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          child: Center(
              child: Image.asset(image!, color: colorImage, fit: fit, height: height, width: width,)
          ),
        ),
      ),
    );
  }
}

class WidgetContainerImageNetWork extends StatelessWidget {
  final double? width, height, padding, margin;
  final String? image;
  final BoxDecoration? boxDecoration;
  final Color? colorImage;
  final bool? isRadius;
  final BoxFit? fit;
  final GestureTapCallback? onTap;
  final BorderRadius? borderRadius;

  const WidgetContainerImageNetWork(
      {this.width = 30, this.height = 30, this.padding = 0, this.margin = 0, this.borderRadius, this.image, this.boxDecoration, this.colorImage, this.isRadius, this.onTap, this.fit = BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: boxDecoration,
        padding: EdgeInsets.all(padding!),
        margin: EdgeInsets.all(margin!),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          child: Center(
              child: Image.network(image!, color: colorImage, fit: fit, height: height, width: width,)
          ),
        ),
      ),
    );
  }
}

class WidgetContainerImageFile extends StatelessWidget {
  final double? width, height;
  final File? image;
  final BoxDecoration? boxDecoration;
  final Color? colorImage;
  final bool? isRadius;
  final BoxFit? fit;
  final GestureTapCallback? onTap;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding, margin;

  // ignore: use_key_in_widget_constructors
  const WidgetContainerImageFile(
      {this.width = 30, this.height = 30, this.padding, this.margin, this.borderRadius, this.image, this.boxDecoration, this.colorImage, this.isRadius, this.onTap, this.fit = BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: boxDecoration,
        padding: padding,
        margin: margin,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          child: Center(
              child: Image.file(image!, color: colorImage, fit: fit, height: height, width: width,)
          ),
        ),
      ),
    );
  }
}

class WidgetContainerColor extends StatelessWidget {
  final Color? color;
  final double? width, height, radius;
  final bool? isCircle, isBorder;

  const WidgetContainerColor({Key? key, this.color = Colors.black, this.width = 25, this.height = 25, this.radius = 5, this.isCircle = false, this.isBorder = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          shape: isCircle == true ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: BorderRadius.circular(radius ?? 0),
          color: color,
          border: isBorder == true ? Border.all(color: COLORS.GREY) : null
      ),
    );
  }
}

class WidgetContainerIcon extends StatelessWidget {
  final double? width, height;
  final IconData? icon;
  final Color? backgroundColor, iconColor;

  const WidgetContainerIcon(
      {this.width = 35, this.height = 35, this.icon, this.backgroundColor = Colors.white, this.iconColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
        child: Center(child: Icon(icon, color: iconColor))
    );
  }
}

class WidgetCircleProgress extends StatelessWidget {
  final Color? backgroundColor;
  final Color? valueColor;

  const WidgetCircleProgress({this.backgroundColor, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(5),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
            valueColor ?? Colors.blue),
        backgroundColor: backgroundColor ?? Colors.grey,
      ),
    );
  }
}

class WidgetContainerCenter extends StatelessWidget {
  final double? width, height;
  final Widget? child;
  final BoxDecoration? boxDecoration;

  WidgetContainerCenter({this.width, this.height, this.child, this.boxDecoration});

  @override
  Widget build(BuildContext context) =>
      Container(
        width: width,
        height: height,
        decoration: boxDecoration,
        child: Center(child: child),
      );
}
