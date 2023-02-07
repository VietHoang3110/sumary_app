import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sumary_app/bloc/list_book_save/list_book_save_bloc.dart';

import '../../../../src/src_index.dart';
import '../../../../widgets/widgets.dart';

class widgetBookSaved extends StatefulWidget {
  const widgetBookSaved({
    Key? key,
  }) : super(key: key);

  @override
  State<widgetBookSaved> createState() => _widgetBookSavedState();
}

class _widgetBookSavedState extends State<widgetBookSaved> {

  @override
  void initState() {
    ListBookSaveBloc.of(context).add(InitGetListBookSaveEvent('john cena',page,10));

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
  late int page = 1;


  @override

  Widget build(BuildContext context) {
    return Scaffold(
    body: BlocBuilder<ListBookSaveBloc, ListBookSaveState>(
      builder: (context,state){
        if(state is UpdateGetListBookSaveState){
          return GridView.builder(
            itemCount: state.listBookSave.length,
            shrinkWrap: true,
            controller: _scrollController,
            // physics: NeverScrollableScrollPhysics(),
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // crossAxisSpacing: 10.0,
                // mainAxisSpacing: 10.0,
                // childAspectRatio: 1.8,
                mainAxisExtent: 300
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: ()=> AppNavigator.navigateBookDetailMain(state.listBookSave[index].product!.id.toString()),
                child: Container(
                  decoration:const BoxDecoration(
                    color: COLORS.WHITE,
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: Get.width/2 - 20,
                          height: 240,
                          child: Image.network(state.listBookSave[index].product!.images[0],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      AppValue.vSpaceTiny,
                      SizedBox(
                        width: Get.width/2 - 20,
                        child: WidgetText(
                          title: state.listBookSave[index].product!.name,
                          style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        else{
          return Container();
        }
      }
    ),
    );
  }
}