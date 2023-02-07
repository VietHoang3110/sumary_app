import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_text.dart';

class WidgetIntroduce extends StatelessWidget {
  const WidgetIntroduce({
    Key? key,
    required this.text1,
    required this.image,
    required this.text2,

  }) : super(key: key);
  final String text1,image,text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(image, fit: BoxFit.fill,height: AppValue.heights*0.4,),
          Column(
            children: [
              WidgetText(
                title: text1,
                style: AppStyle.DEFAULT_24_BOLD.copyWith(
                  fontSize: 28
                ),
                textAlign: TextAlign.center,
              ),
              AppValue.vSpaceTiny,
              WidgetText(
                title: text2,
                style: AppStyle.DEFAULT_16.copyWith(
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
