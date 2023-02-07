import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/content_FAQ/content_FAQ_bloc.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../../widgets/widgets.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool _customTileExpanded = false;

  @override
  void initState() {
    ContentFAQBloc.of(context).add(InitContentFAQEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.BACKGROUND,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Những câu hỏi thường gặp',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: ()=> AppNavigator.navigateBack(),
            child: Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),
      body: BlocBuilder<ContentFAQBloc, ContentFAQState>(
      builder: (context, state) {
        if(state is UpdateContentFAQState){
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                    children: List.generate(
                        state.dataFAQ.content.data.length, (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromRGBO(238, 77, 44, 0.05),
                        ),
                        child: ExpansionTile(
                          trailing:Icon(Icons.arrow_drop_down,color: COLORS.BLACK,size: 25),
                          title: WidgetText(
                            title: state.dataFAQ.content.data[index].q,
                            style: AppStyle.DEFAULT_14,
                          ),
                          children: [
                            ListTile(
                              title: WidgetText(
                                title: state.dataFAQ.content.data[index].a,
                                style: AppStyle.DEFAULT_14.copyWith(
                                  color: HexColor('#5A5A5A'),
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                ),
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

