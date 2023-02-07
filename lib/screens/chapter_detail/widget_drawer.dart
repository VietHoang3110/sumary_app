

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/detail_product/detail_product_bloc.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/src/styles.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../widgets/widgets.dart';


class widget_drawer extends StatefulWidget {
  widget_drawer({
    Key? key,
    required this.scaffoldKey,
    this.change,
    this.offAudio,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  Function? change;
  Function? offAudio;


  @override
  State<widget_drawer> createState() => _widget_drawerState();
}

class _widget_drawerState extends State<widget_drawer> {
  String id = Get.arguments[0];

  @override
  void initState() {
    DetailProductBloc.of(context).add(InitDetailProductEvent(id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailProductBloc, DetailProductState>(
        builder: (context, state) {
          if(state is UpdateGetDetailProductState){
            return Drawer(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    child: DrawerHeader(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: COLORS.GREY_400
                              )
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 16, height: 16,),
                          WidgetText(
                            title: 'Danh sách chương',
                            style: AppStyle.DEFAULT_18.copyWith(
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          InkWell(
                              onTap: ()=> Navigator.pop(context),
                              child: SvgPicture.asset('assets/icons/icon_exit.svg'))
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: List.generate(state.data.book!.file!.length, (index) =>
                        GestureDetector(
                      onTap: (){
                        if(state.data.is_buy == true || index ==0){
                          widget.change!(index,state.data.book!.file![index].src);
                          widget.offAudio!();
                          Navigator.pop(context);
                        }
                        else{
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return WidgetDialog(
                                title: MESSAGES.NOTIFICATION,
                                content: 'Bạn cần mua sách để đọc tiếp!!!!',
                                onTap1: (){
                                  Get.back();
                                },
                              );
                            },
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: HexColor('#E7E7E7'),width: 1),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 7),
                                child: SvgPicture.asset('assets/icons/book2.svg'),
                              ),
                              Expanded(
                                // width: Get.width*0.5,
                                child: WidgetText(
                                  title: state.data.book!.file![index].name,
                                  style: AppStyle.DEFAULT_14,
                                  maxLine: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              (state.data.is_buy || index ==0) ?  (
                                  (index <= (state.data.totalDoneChapter ?? 0)) ?  Padding(
                                    padding: const EdgeInsets.only(right: 3),
                                    child: SvgPicture.asset('assets/icons/check-mark.svg',height: 15,))
                                      : Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SvgPicture.asset('assets/icons/r.svg'))
                              )
                              : Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SvgPicture.asset('assets/icons/lock_1.svg'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    ),
                  )
                ],
              ),
            );
          }
          else{
            return Container();
          }
        }
        );
  }
}