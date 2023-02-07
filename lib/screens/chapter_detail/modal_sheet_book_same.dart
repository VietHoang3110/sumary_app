import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/bloc/list_book_same/list_book_same_bloc.dart';
import 'package:sumary_app/screens/menu/relieve/discover_screen.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_text.dart';

class ModalSheetBookSame extends StatefulWidget {
  final String id;
  const ModalSheetBookSame({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<ModalSheetBookSame> createState() => _ModalSheetBookSameState();
}

class _ModalSheetBookSameState extends State<ModalSheetBookSame> {
  @override
  void initState() {
    ListBookSameBloc.of(context).add(InitGetListBookSameEvent(widget.id, 0, 0));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppValue.heights * 0.315,
      child: Stack(
        children: [
          Image.asset('assets/images/anhtabnoibat.png', width: AppValue.widths,
              fit: BoxFit.fill),
          Column(
            children: [
              buildTitle(
                icon: 'assets/icons/icondexuat.svg',
                title: 'TÂM SÁCH CÙNG CHỦ ĐỀ',
                expand: Row(
                  children: [
                    WidgetText(
                      title: 'Xem thêm',
                      style: AppStyle.DEFAULT_14.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: COLORS.WHITE
                      ),
                    ),
                    const Icon(Icons.chevron_right_outlined, size: 17,
                      color: COLORS.WHITE,)
                  ],
                ),
              ),
              AppValue.vSpaceSmall,
              BlocBuilder<ListBookSameBloc, ListBookSameState>(
                builder: (context, state) {
                  if(state is UpdateGetListBookSameState){
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(state.data.length, (index) =>
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: GestureDetector(
                                onTap: (){
                                  AppNavigator.navigateBookDetailMain(state.data[index].id!);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                      height: 160,
                                      child: Image.network(state.data[index].images![0],
                                        fit: BoxFit.contain,
                                      )
                                  ),
                                ),
                              ),
                            ),
                        ),
                      ),
                    );
                  }
                  else{
                    return Container();
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}