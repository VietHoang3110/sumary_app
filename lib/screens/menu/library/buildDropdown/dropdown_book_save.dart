import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/list_book_bought/list_book_bought_bloc.dart';
import 'package:sumary_app/bloc/list_book_save/list_book_save_bloc.dart';

import '../../../../src/src_index.dart';
import '../../../../widgets/widgets.dart';

class buildDropdownListBookSave extends StatefulWidget {

  buildDropdownListBookSave({
    Key? key,
  }) : super(key: key);

  @override
  State<buildDropdownListBookSave> createState() => _buildDropdownListBookSaveState();
}

class _buildDropdownListBookSaveState extends State<buildDropdownListBookSave> {

  bool isSelect = false;

  late int page = 1;

  @override
  void initState() {
    _scrollController.addListener(() async {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        ListBookSaveBloc.of(context).add(InitGetListBookSaveEvent('john cena', page+1, 10));
        page=page+1;
      } else {}
    });
    super.initState();
  }
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: (){
              setState(() {
                isSelect = !isSelect;
                if(isSelect == true){
                  ListBookSaveBloc.of(context).add(InitGetListBookSaveEvent('john cena', page, 10));
                }
              });
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: COLORS.WHITE,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 1,
                    color: COLORS.PRIMARY_COLOR
                ),
                boxShadow: [
                  BoxShadow(
                    color: HexColor('#000000').withOpacity(0.25),
                    offset: Offset(0, 3),
                    blurRadius: 3,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  AppValue.hSpace(5),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                HexColor('#FF9F00'),
                                HexColor('#F17400').withOpacity(1)
                              ],
                            )
                        ),
                      ),
                      Image.asset('assets/icons/booksave_icon.png',width: 36,height: 30,)
                    ],
                  ),
                  AppValue.hSpace(10),
                  WidgetText(
                    title: 'Tâm Sách Đã Lưu',
                    style: AppStyle.DEFAULT_16.copyWith(
                      color: COLORS.PRIMARY_COLOR,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  isSelect ? Image.asset('assets/icons/drop_top.png',width: 20,fit: BoxFit.contain,)
                      : Image.asset('assets/icons/drop_buttom.png',width: 20,fit: BoxFit.contain,),
                  AppValue.hSpace(20),
                ],
              ),
            ),
          ),
        ),
        isSelect ? BlocBuilder<ListBookSaveBloc, ListBookSaveState>(
          builder: (context, state) {
            if(state is UpdateGetListBookSaveState){
              return Stack(
                alignment: Alignment.centerRight,
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(state.listBookSave.length, (index) =>
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 12),
                              child: GestureDetector(
                                onTap: ()=> AppNavigator.navigateBookDetailMain(state.listBookSave[index].product!.id.toString()),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: AppValue.widths*0.35+14,
                                      height: AppValue.heights*0.25+14,
                                      decoration: BoxDecoration(
                                        color: COLORS.BLACK.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(5),
                                        // border: Border.all(width: 7,color: COLORS.BLACK.withOpacity(0.3))
                                      ),
                                    ),
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(state.listBookSave[index].product!.images[0],
                                          width: AppValue.widths*0.35,
                                          height: AppValue.heights*0.25,
                                          fit: BoxFit.fill,
                                        )
                                      // Image.asset('assets/Bìa Marketing thành công.png',
                                      //   width: AppValue.widths*0.35,
                                      //   height: AppValue.heights*0.25,
                                      //   fit: BoxFit.fill,
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                        onTap:(){
                          _scrollController.animateTo( //go to top of scroll
                              _scrollController.position.maxScrollExtent,  //scroll offset to go
                              duration: const Duration(milliseconds: 500), //duration of scroll
                              curve:Curves.fastOutSlowIn //scroll type
                          );
                        },
                        child: Image.asset('assets/icons/endIcon.png',height: 35,width: 35,)),
                  )
                ],
              );
            }
            else{return Container();}
          },
        )
            : Container()
      ],
    );
  }
}