import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../bloc/list_armorial/list_armorial_bloc.dart';
import '../../widgets/widgets.dart';

class ArmorialPage extends StatefulWidget {
  const ArmorialPage({Key? key}) : super(key: key);

  @override
  State<ArmorialPage> createState() => _ArmorialPageState();
}

class _ArmorialPageState extends State<ArmorialPage> {

  @override
  void initState() {
    ListArmorialBloc.of(context).add(InitGetListArmorialEvent('', 1, 10));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Thông tin danh hiệu',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: ()=> AppNavigator.navigateBack(),
            child: const Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),
      body: BlocBuilder<ListArmorialBloc, ListArmorialState>(
        builder: (context, state) {
          if(state is UpdateGetListArmorialState){
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(state.data.length,
                        (index) => Column(
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white, // here for close state
                          colorScheme: const ColorScheme.light(
                            primary: COLORS.GREY,
                          ), // here for open state in replacement of deprecated accentColor
                          dividerColor: Colors.transparent, // if you want to remove the border
                        ),
                        child: ExpansionTile(
                          collapsedIconColor: COLORS.GREY,
                          title: WidgetText(
                            title: 'Danh hiệu ${state.data[index].name}',
                            style: AppStyle.DEFAULT_16.copyWith(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 15,left: 15),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/images/icons_crown.png'),
                                      SizedBox(
                                        width: AppValue.widths*0.8,
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Thăng bậc',
                                            style: AppStyle.DEFAULT_14,
                                            children:  <TextSpan>[
                                              TextSpan(text: ' ${state.data[index].name}', style: const TextStyle(color: COLORS.PRIMARY_COLOR)),
                                              TextSpan(text: ' sau khi hoàn tất ${state.data[index].bookRequired} tâm sách!'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/images/icons_crown.png'),
                                      SizedBox(
                                        width: AppValue.widths*0.8,
                                        child: WidgetText(
                                          title: "Nhận ${state.data[index].bcoinOfLevel} Bcoin khi đạt được danh hiệu này",
                                          style: AppStyle.DEFAULT_14.copyWith(
                                              fontWeight: FontWeight.w400
                                          ),
                                          textAlign: TextAlign.justify,
                                          maxLine: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/images/icons_crown.png'),
                                      SizedBox(
                                        width: AppValue.widths*0.8,
                                        child: WidgetText(
                                          title: "Nhận thưởng ${state.data[index].giftPerBook} Bcoin vào Ví sau khi hoàn tất 1 tâm sách!",
                                          style: AppStyle.DEFAULT_14.copyWith(
                                              fontWeight: FontWeight.w400
                                          ),
                                          textAlign: TextAlign.justify,
                                          maxLine: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(width: AppValue.widths,height: 1,color: HexColor('#D8D9DB')),
                    ],
                  ),)
                ),
              ),
            );
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}
