import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/content_contact/content_contact_bloc.dart';

import '../../../src/src_index.dart';
import '../../../widgets/widget_text.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  void initState() {
    ContentContactBloc.of(context).add(InitContentContactEvent());
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
          title: 'Về chúng tôi',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: ()=> AppNavigator.navigateBack(),
            child: Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),

      body: BlocBuilder<ContentContactBloc, ContentContactState>(
      builder: (context, state) {
        if(state is UpdateContentContactState){
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 15,left: 15),
                child: Column(
                  children: [
                    WidgetContainerImage(
                      image: IMAGES.LOGO_APP,
                      height: Get.width*0.5,
                      width: Get.width*0.5,
                      fit: BoxFit.contain,
                    ),
                    WidgetText(
                      title: 'Tiềm Năng Master',
                      style: AppStyle.DEFAULT_16_BOLD,
                    ),
                    WidgetText(
                      title: 'Version  0.0.1',
                      style: AppStyle.DEFAULT_14,
                    ),
                    AppValue.vSpaceSmall,
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: List.generate(
                          state.dataFAQ.content.data.addresses.length,
                              (index) => WidgetText(
                          title: state.dataFAQ.content.data.addresses[index].location,
                          style: AppStyle.DEFAULT_16,
                          textAlign: TextAlign.justify,
                        ),
                        ),
                      )
                    ),
                    AppValue.vSpaceSmall,
                    Container(width: AppValue.widths,height: 1,color: HexColor('#D8D9DB'),),
                    AppValue.vSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WidgetText(
                          title: 'Email: ',
                          style: AppStyle.DEFAULT_16,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){},
                          child: WidgetText(
                            title: state.dataFAQ.content.data.email,
                            style: AppStyle.DEFAULT_16.copyWith(
                                color: HexColor('#EE4D2C'),
                                decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppValue.vSpaceSmall,
                  ],
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
