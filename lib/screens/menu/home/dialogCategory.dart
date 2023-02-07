import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumary_app/widgets/widget_button_category.dart';
import 'package:sumary_app/widgets/widgets.dart';

import '../../../bloc/Filter_product_2/filter_product_2_bloc.dart';
import '../../../src/models/model_generator/list_category.dart';
import '../../../src/src_index.dart';


class dialogCategory extends StatefulWidget {

  List<DataChildCategory>? childCategory;

  dialogCategory({
    Key? key,
    required this.childCategory
  }) : super(key: key);

  @override
  State<dialogCategory> createState() => _dialogCategoryState();
}

class _dialogCategoryState extends State<dialogCategory> {
  int indexChild = -1;
  String category = '';
  List<String> data = [];


  @override
  void initState() {
    FilterProduct2Bloc.of(context).add(InitFilterProduct2Event());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ), //this right here
      child: SizedBox(
        height: AppValue.heights*0.65,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: Get.width,
              height: 56,
              decoration: const BoxDecoration(
                  color: COLORS.PRIMARY_COLOR,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )
              ),
              child: WidgetText(
                title: "CHỌN CHỦ ĐỀ",
                style: AppStyle.DEFAULT_20.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: COLORS.WHITE
                ),
              ),
            ),
            Expanded(
              child: (widget.childCategory!.isNotEmpty) ?  SingleChildScrollView(
                child: Column(
                  children: List.generate(widget.childCategory!.length,
                          (index) => WidgetCategoryChilds(
                            image: 'assets/icons/open-book.png',
                            title: widget.childCategory![index].name!,
                            index: index,
                            select: indexChild,
                            onClick: (){
                              setState(() {
                                indexChild = index;
                              });
                              category = widget.childCategory![index].id!.toString();
                            },
                          )
                  ),
                ),
              ) : Center(child: WidgetText(title: 'Không có danh mục con !!'),),
            ) ,
            AppValue.vSpaceTiny,
            WidgetButton4(
              width: Get.width*0.6,
              height: 48,
              onTap: () {
                if(data.length >= 3){
                  // data.removeAt(0);
                  data.insert(0,category);
                }else {
                  data.add(category);
                }
                print("aaaaa ${data}");
                setState(() {
                  category ='';
                  FilterProduct2Bloc.of(context).add(FilterProduct2Submitted(data,''));
                  FilterProduct2Bloc.of(context).add(InitFilterProduct2Event());
                });
                Navigator.pop(context);
              },
              boxDecoration: BoxDecoration(
                  color: COLORS.PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(10)
              ),
              backgroundColor: COLORS.PRIMARY_COLOR,
              text: 'Done',
            ),
            AppValue.vSpaceSmall
          ],
        ),
      ),
    );
  }
}
