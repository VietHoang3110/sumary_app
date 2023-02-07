import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sumary_app/bloc/list_book_bought/list_book_bought_bloc.dart';

import '../../../../src/models/model_generator/list_book_bought.dart';
import '../../../../src/src_index.dart';
import '../../../../widgets/widgets.dart';

class widgetBookBought extends StatefulWidget {
  const widgetBookBought({
    Key? key,
  }) : super(key: key);

  @override
  State<widgetBookBought> createState() => _widgetBookBoughtState();
}

class _widgetBookBoughtState extends State<widgetBookBought> {

  late int page = 1;
  @override
  void initState() {
    ListBookBoughtBloc.of(context).add(InitGetListBookBoughtEvent('john cena', page, 10));
    _scrollController.addListener(() async {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
       ListBookBoughtBloc.of(context).add(InitGetListBookBoughtEvent('john cena', page+1, 10));
       page=page+1;
      } else {}
    });
    super.initState();
  }
    final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBookBoughtBloc, ListBookBoughtState>(
      builder: (context, state) {
        if(state is UpdateGetListBookBoughtState){
          return GridView.builder(
            itemCount: state.listBookBought.length,
            shrinkWrap: true,
            controller: _scrollController,
            // physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // crossAxisSpacing: 10.0,
                // mainAxisSpacing: 10.0,
                // childAspectRatio: 1.8,
                mainAxisExtent: 300
            ),
            itemBuilder: (BuildContext context, int index) {
              return itemProduct(data: state.listBookBought[index]);
            },
          );
        }
        else{
          return Container();
        }
      },
    );
  }
}

class itemProduct extends StatelessWidget {

  final DataProductBought data;

  const itemProduct({
    Key? key,
    required this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> AppNavigator.navigateBookDetailMain(data.product!.id.toString()),
      child: Container(
        decoration: const BoxDecoration(
          color: COLORS.WHITE,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: Get.width/2 - 20,
                height: 240,
                child: Image.network(data.product!.images![0],
                  fit: BoxFit.fill,
                ),
              ),
            ),
            AppValue.vSpaceTiny,
            SizedBox(
              width: Get.width/2 - 20,
              child: WidgetText(
                title: data.product!.name,
                style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
                overflow:TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
