import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../bloc/list_data_banking/list_data_banking_bloc.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../src/src_index.dart';
import '../../../widgets/widget_button_category.dart';
import '../../../widgets/widgets.dart';

class TopUp extends StatefulWidget {
  const TopUp({Key? key}) : super(key: key);

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {

  @override
  void initState() {
    super.initState();
    ListDataBankingBloc.of(context).add(InitGetListDataBankingEvent());
  }
  int indexBank = -1;
  String id = '';


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: COLORS.BACKGROUND,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Danh sách ngân hàng',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
              Get.back();
            },
            child: const Icon(Icons.arrow_back, color: Colors.black,)
        ),
      ),
      body: BlocBuilder<ListDataBankingBloc, ListDataBankingState>(
        builder: (context, state) {
          if(state is UpdateGetListDataBankingState){
            return SafeArea(
              child: SizedBox(
                height: AppValue.heights * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // AppValue.vSpaceTiny,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,  vertical: 5),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: List.generate(state.data.length,
                                    (index) => WidgetButtonCategory3(
                                  image: state.data[index].icon_url,
                                  title: state.data[index].bank_name,
                                  index: index,
                                  select: indexBank,
                                  onClick: () {
                                    setState(() {
                                      id = state.data[index].id.toString();
                                      indexBank = index;
                                    });
                                    print(id);
                                  },
                                )
                            )
                        ),
                      ),
                    ),
                    // const Spacer(),
                    WidgetButton3(
                      height: 48,
                      onTap: () {
                          if( indexBank != -1 ){
                            AppNavigator.navigateTopUpDetail(id);
                          }
                        },
                        backgroundColor: indexBank==-1 ? const Color(0xFFF9F00).withOpacity(0.5) : HexColor('#FF9F00'),
                        text: MESSAGES.CONTINUE,
                    ),
                    // _buildButtonTopUp(),
                  ],
                ),
              ),
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}

