

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sumary_app/storages/share_local.dart';
import 'package:sumary_app/widgets/widgets.dart';
import '../../../bloc/blocs.dart';
import '../../../bloc/search/search_bloc.dart';
import '../../../bloc/search_popular/search_popular_bloc.dart';
import '../../../src/models/model_generator/search.dart';
import '../../../src/models/model_generator/search_popular.dart';
import '../../../src/src_index.dart';


class Search_Screen extends StatefulWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  String search = '';
  String searchAth = '';
  String translator = '';

  final ScrollController _scrollController = ScrollController();
  int lenght = 0;
  int total =0;
  int page = 1;
  bool? check;

  @override
  void initState() {
    SearchPopularBloc.of(context).add(InitSearchPopularEvent());
    SearchBloc.of(context).add(InitDetailProductEvent(page,5,search,translator));
    super.initState();
  }

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context){
    final bloc = SearchBloc.of(context);
    listHistory = shareLocal.getStringList("listHist")??[];
    listHistory = listHistory.toList();
    return Scaffold(
      backgroundColor: COLORS.WHITE,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: ()=>Get.back(),
                        child: const Icon(Icons.arrow_back_sharp)
                    ),
                    AppValue.hSpaceSmall,
                    Expanded(child: _buildTextFieldSearch(bloc),)
                  ],
                ),
              ),
              AppValue.vSpaceSmall,
              search == "" ?
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     WidgetText(
                             title: 'Tìm kiếm gần đây',
                             style: AppStyle.DEFAULT_16_BOLD.copyWith(
                               fontSize: 15
                             ),
                           ),
                     Column(
                       children: List.generate(
                           listHistory.length,
                               (index) =>
                               GestureDetector(
                                 onTap: (){
                                   setState((){
                                     search = listHistory[index];
                                     SearchBloc.of(context).add(InitDetailProductEvent(page,0,search,translator));
                                   });
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(vertical: 10),
                                   child: Row(
                                     children: [
                                       SvgPicture.asset('assets/icons/reload2.svg'),
                                       AppValue.hSpaceSmall,
                                       WidgetText(
                                         title: listHistory[index],
                                         style: AppStyle.DEFAULT_14,
                                       )
                                     ],
                                   ),
                                 ),
                               )
                       ),
                     ),
                     AppValue.vSpaceMedium,
                     WidgetText(
                       title: 'Tìm kiếm phổ biến',
                       style: AppStyle.DEFAULT_16_BOLD.copyWith(
                           fontSize: 15
                       ),
                     ),
                     BlocBuilder<SearchPopularBloc,SearchPopularState>(
                       builder: (context,state) {
                         if (state is UpdateSearchPopularState) {
                           return ListView.builder(
                             shrinkWrap: true,
                             controller: _scrollController,
                             itemBuilder: (context, index) {
                               return GestureDetector(
                                 onTap: () {
                                   setState((){
                                     search = state.data.records![index].keyword!;
                                     SearchBloc.of(context).add(InitDetailProductEvent(page,0,search,translator));
                                   });
                                 },
                                 child:
                                 state.data.records![index].keyword == ''?
                                   Container() : Padding(
                                     padding: const EdgeInsets.symmetric(vertical: 10),
                                     child: Row(
                                       children: [
                                         SvgPicture.asset('assets/icons/reload2.svg'),
                                         AppValue.hSpaceSmall,
                                         WidgetText(
                                           title: state.data.records![index].keyword??'',
                                           style: AppStyle.DEFAULT_14,
                                         )
                                       ],
                                     ),
                                 ),
                                   );
                               },
                             itemCount: state.data.records!.length,
                           );
                         }
                         else {
                           return Container();
                         }
                       },
                     ),
                         ],
                       ),
                     )
                  :
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WidgetText(
                      title: 'Tìm kiếm kết quả',
                      style: AppStyle.DEFAULT_16_BOLD.copyWith(fontSize: 15),
                    ),
                    BlocBuilder<SearchBloc,SearchState>(
                      builder: (context,state) {
                        if (state is UpdateGetDataSearchState) {
                          check = state.data.records!.isNotEmpty;
                          return state.data.records!.isNotEmpty ?  ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.data.records!.length,
                            itemBuilder: (context, index) {
                              return  GestureDetector(
                                onTap: () {
                                  if(listHistory.length >= 5){
                                    listHistory.removeAt(listHistory.length - 1);
                                    listHistory.insert(0,state.data.records![index].name!);
                                  }else {
                                    listHistory.insert(0,state.data.records![index].name!);
                                  }
                                  shareLocal.putStringList("listHist", listHistory);
                                  AppNavigator.navigateBookDetailMain(state.data.records![index].id!);
                                },
                                child: (state.data.total == 0) ?  WidgetText(title: 'Không tìm thấy sách !!') : Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/reload2.svg'),
                                      AppValue.hSpaceSmall,
                                      Expanded(
                                        child: WidgetText(
                                          title: "${state.data.records![index].name} - ${state.data.records![index].author!.name}",
                                          style: AppStyle.DEFAULT_14,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                              },
                          ):  Padding(
                            padding: const EdgeInsets.all(15),
                            child: Center(child: WidgetText(title: 'Không tìm thấy sách !!')),
                          );
                         }
                        else {
                          return Center(child: WidgetText(title: 'Không tìm thấy sách !!'));
                          }
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        )
      ),
    );
  }

  List<String> listHistory = [];
  _buildTextFieldSearch(SearchBloc bloc) {
          return BlocBuilder<SearchBloc,SearchState>(
            builder: (context,state){
              if(state is UpdateGetDataSearchState){
                return WidgetInput4(
                  boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          spreadRadius: 0,
                          blurRadius: 15,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                      color: COLORS.WHITE
                  ),
                  inputController: _controller,
                  onChanged: (text){
                    setState(() {
                      search = text;
                      SearchBloc.of(context).add(InitDetailProductEvent(page,0,text,translator));
                    });
                  },
                  onEditingComplete: (){
                    if(listHistory.length >= 5){
                      listHistory.removeAt(listHistory.length - 1);
                      listHistory.insert(0,search);
                    }else {
                      listHistory.insert(0,search);
                    }
                    if(search != ''){
                      shareLocal.putStringList("listHist", listHistory);
                    }
                    setState((){
                      SearchBloc.of(context).add(InitDetailProductEvent(page,0,search,translator));
                    });
                    if(check != true){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return WidgetDialog(
                              title: MESSAGES.NOTIFICATION,
                              content: "Không tìm thấy sách của bạn",
                              onTap1: (){
                                Get.back();
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                          );
                        },
                      );
                    }
                  },
                  endIcon: GestureDetector(
                      onTap: (){
                        if(listHistory.length >= 5){
                          listHistory.removeAt(listHistory.length - 1);
                          listHistory.insert(0,search);
                        }else {
                          listHistory.insert(0,search);
                        }
                        if(search != ''){
                          shareLocal.putStringList("listHist", listHistory);
                        }
                        setState((){
                          SearchBloc.of(context).add(InitDetailProductEvent(page,0,search,translator));
                        });
                        setState((){
                          SearchBloc.of(context).add(InitDetailProductEvent(page,0,search,translator));
                        });
                        if(check != true){
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return WidgetDialog(
                                  title: MESSAGES.NOTIFICATION,
                                  content: "Không tìm thấy sách của bạn",
                                  onTap1: (){
                                    Get.back();
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  }
                              );
                            },
                          );
                        }
                      },
                      child: Icon(Icons.search)),
                  hint: 'Nhập tựa sách - tác giả',

                );
              } else {
                return Container();
              }
              },);
  }
}
