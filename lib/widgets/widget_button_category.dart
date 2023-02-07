
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_text.dart';

class WidgetButtonCategory extends StatefulWidget {
  final String image;
  final String title;
  final Function onClick;
  final Function? onHold;
  final int index;
  final int select;
  const WidgetButtonCategory({
    Key? key,
    required this.image,
    required this.title,
    required this.onClick,
    this.onHold,
    required this.index,
    required this.select
  }) : super(key: key);

  @override
  _WidgetButtonCategoryState createState() => _WidgetButtonCategoryState();
}

class _WidgetButtonCategoryState extends State<WidgetButtonCategory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>widget.onClick(),
      onLongPress: () => widget.onHold!(),
      child: Container(
        padding:const EdgeInsets.all(5),
        // margin:const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color:widget.index==widget.select?COLORS.PRIMARY_COLOR: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1,color: Colors.white)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            WidgetContainerImage(
              image: widget.image,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            AppValue.hSpaceTiny,
            WidgetText(
              title: widget.title,
              style: AppStyle.DEFAULT_16.copyWith(color: widget.index==widget.select?COLORS.WHITE:COLORS.BLACK),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetButtonCategory2 extends StatefulWidget {
  final String image;
  final Widget title;
  final Function onClick;
  final int index;
  final int select;
  const WidgetButtonCategory2({
    Key? key,
    required this.image,
    required this.title,
    required this.onClick,
    required this.index,
    required this.select
  }) : super(key: key);

  @override
  _WidgetButtonCategory2State createState() => _WidgetButtonCategory2State();
}

class _WidgetButtonCategory2State extends State<WidgetButtonCategory2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>widget.onClick(),
      child: Container(
        padding:const EdgeInsets.all(5),
        // margin:const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color:widget.index==widget.select?COLORS.PRIMARY_COLOR: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1,color: Colors.white)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            WidgetContainerImage(
              image: widget.image,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            AppValue.hSpaceTiny,
            widget.title,
          ],
        ),
      ),
    );
  }
}

class WidgetButtonCategory3 extends StatefulWidget {
  final String? image;
  final String? title;
  final Function onClick;
  final int index;
  final int select;
  const WidgetButtonCategory3({
    Key? key,
    required this.image,
    required this.title,
    required this.onClick,
    required this.index,
    required this.select
  }) : super(key: key);

  @override
  _WidgetButtonCategory3State createState() => _WidgetButtonCategory3State();
}

class _WidgetButtonCategory3State extends State<WidgetButtonCategory3> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateColor.resolveWith((states) => COLORS.WHITE),
      onTap: ()=>widget.onClick(),
      child: Column(
        children: [
          AppValue.vSpaceTiny,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network("${widget.image}",
                        height: 28,
                        width: 28,
                        fit: BoxFit.contain
                    ),
                  ),
                  AppValue.hSpaceSmall,
                  WidgetText(
                    title: widget.title,
                    style: widget.index==widget.select
                        ? AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500, color: COLORS.PRIMARY_COLOR)
                        : AppStyle.DEFAULT_16,
                  ),
                ],
              ),
              widget.index==widget.select
                  ? const SizedBox(height: 12,width: 16)
              // SvgPicture.asset('assets/icons/check.svg')
                  : const SizedBox(height: 12,width: 16)
            ],
          ),
          AppValue.vSpaceSmall,
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Container(height: 1,width: AppValue.heights,color: COLORS.GREY_E7,),
          )
        ],
      ),
    );
  }
}


class WidgetBackground extends StatefulWidget {
  final String? image;
  final Function onClick;
  final int index;
  final int select;
  const WidgetBackground({
    Key? key,
    required this.image,
    required this.onClick,
    required this.index,
    required this.select
  }) : super(key: key);

  @override
  _WidgetBackgroundState createState() => _WidgetBackgroundState();
}

class _WidgetBackgroundState extends State<WidgetBackground> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>widget.onClick(),
      child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: AppValue.widths*0.12,
              height: AppValue.widths*0.15,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${widget.image}'), fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1,
                      color: widget.index==widget.select ?  COLORS.PRIMARY_COLOR : COLORS.GREY_400,
                  )
              ),
            ),
            widget.index==widget.select ? Image.asset('assets/icons/check.png') : Container()
          ],
          ),
    );
  }
}

class WidgetMoodCategory extends StatefulWidget {
  final String image;
  final String title;
  final Function onClick;
  final int index;
  final int select;
  const WidgetMoodCategory({
    Key? key,
    required this.image,
    required this.title,
    required this.onClick,
    required this.index,
    required this.select
  }) : super(key: key);

  @override
  _WidgetMoodCategoryState createState() => _WidgetMoodCategoryState();
}

class _WidgetMoodCategoryState extends State<WidgetMoodCategory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>widget.onClick(),
      child: Container(
        padding:const EdgeInsets.all(5),
        // margin:const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color:widget.index==widget.select?COLORS.PRIMARY_COLOR: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1,color: Colors.white)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network("${widget.image}",
                  height: 18,
                  width: 18,
                  fit: BoxFit.contain
              ),
            ),
            AppValue.hSpaceTiny,
            WidgetText(
              title: widget.title,
              style: AppStyle.DEFAULT_16.copyWith(color: widget.index==widget.select?COLORS.WHITE:COLORS.BLACK),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetButtonCategoryIntro extends StatefulWidget {
  final String image;
  final String title;
  final Function onClick;
  const WidgetButtonCategoryIntro({
    Key? key,
    required this.image,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  @override
  _WidgetButtonCategoryIntroState createState() => _WidgetButtonCategoryIntroState();
}

class _WidgetButtonCategoryIntroState extends State<WidgetButtonCategoryIntro> {
  bool select = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6,bottom: 6,right: 12),
      child: GestureDetector(
        onTap: (){
          setState(() {
            select = !select;
          });
        },
        child: Container(
          padding:const EdgeInsets.all(5),
          // margin:const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
              color: select ? COLORS.PRIMARY_COLOR: HexColor('#F6F6F6'),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1,color: Colors.white)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              WidgetContainerImage(
                image: widget.image,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              AppValue.hSpaceTiny,
              WidgetText(
                title: widget.title,
                style: AppStyle.DEFAULT_16.copyWith(color: select ? COLORS.WHITE : COLORS.BLACK),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetCategoryChilds extends StatefulWidget {
  final String image;
  final String title;
  final Function onClick;
  final int index;
  final int select;
  const WidgetCategoryChilds({
    Key? key,
    required this.image,
    required this.title,
    required this.onClick,
    required this.index,
    required this.select
  }) : super(key: key);

  @override
  _WidgetCategoryChildsState createState() => _WidgetCategoryChildsState();
}

class _WidgetCategoryChildsState extends State<WidgetCategoryChilds> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.white),
      onTap: ()=>widget.onClick(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
        child: Stack(
          children: [
            Container(
              height: 40,
              padding:const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: HexColor('#F0F3F5'),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(6),
                  ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppValue.hSpace(42),
                  SizedBox(
                    width: Get.width*0.5,
                    child: WidgetText(
                      title: widget.title,
                      style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                      padding: EdgeInsets.only(right: (widget.index==widget.select) ? 3 : 9),
                      child: (widget.index==widget.select) ? SvgPicture.asset('assets/icons/check_cate.svg') : SvgPicture.asset('assets/icons/nocheck_cate.svg'),
                  )
                ],
              ),
            ),
            WidgetContainerImage(
              image: widget.image,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
