import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../bloc/blocs.dart';
import '../../../bloc/detail_product/detail_product_bloc.dart';
import '../../../src/src_index.dart';
import '../../../widgets/widgets.dart';

class ModalSheetElective extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  const ModalSheetElective({Key? key,required this.image, required this.id,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset('assets/images/clip3.png'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15,top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 16,width: 16),
                      WidgetText(
                        title: 'Mô tả',
                        style: AppStyle.DEFAULT_18.copyWith(
                        ),
                      ),
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset('assets/icons/icon_exit.svg')
                      )
                    ],
                  ),
                  AppValue.vSpaceTiny,
                  Container(width: AppValue.widths, height: 1, color: COLORS.GREY_400,),
                  AppValue.vSpaceSmall,
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                            width: AppValue.widths*0.2,
                            child: Image.network(image,fit: BoxFit.fill,)),
                      ),
                      AppValue.hSpaceSmall,
                      Container(
                        width: AppValue.widths*0.65,
                        child: WidgetText(
                          title: title,
                          style: AppStyle.DEFAULT_14,
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            AppValue.vSpaceSmall,
            _buildButtonPayment(id)
          ],
        ),
      ],
    );
  }
  _buildButtonPayment(String id) {
          return WidgetButton3(
            height: 50,
            // onTap: () => state.status.isValidated ? bloc.add(FormSubmitted()) : null,
            onTap: (){
              Get.back();
              AppNavigator.navigateBookDetailMain(id);
            },
            //enable: state.status.isValidated,
            backgroundColor: HexColor('#FF9F00'),
            text: 'Xem sách',
          );
  }
}


// class Modal_Sheet_Elective extends StatefulWidget {
//   final String id;
//   const Modal_Sheet_Elective({Key? key, required this.id}) : super(key: key);
//
//   @override
//   State<Modal_Sheet_Elective> createState() => _Modal_Sheet_ElectiveState();
// }
//
// class _Modal_Sheet_ElectiveState extends State<Modal_Sheet_Elective> {
//   // String? id = Get.arguments;
//   //
//   // @override
//   // void initState() {
//   //   DetailProductBloc.of(context).add(InitDetailProductEvent(id!));
//   //   super.initState();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/clip3.png',),
//                   fit: BoxFit.fill
//               )
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 15, left: 15),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(height: 16,width: 16),
//                         WidgetText(
//                           title: 'Mô tả',
//                           style: AppStyle.DEFAULT_18.copyWith(
//                           ),
//                         ),
//                         InkWell(
//                             onTap: () => Navigator.pop(context),
//                             child: SvgPicture.asset('assets/icons/icon_exit.svg')
//                         )
//                       ],
//                     ),
//                     AppValue.vSpaceTiny,
//                     Container(width: AppValue.widths, height: 1, color: COLORS.GREY_400,),
//                     AppValue.vSpaceSmall,
//                     Row(
//                       children: [
//                         Container(
//                             width: AppValue.widths*0.2,
//                             child: Image.asset('assets/images/book.png',fit: BoxFit.fill,)),
//                         AppValue.hSpaceSmall,
//                         Container(
//                           width: AppValue.widths*0.65,
//                           child: WidgetText(
//                             title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
//                             style: AppStyle.DEFAULT_14,
//                             textAlign: TextAlign.justify,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               AppValue.vSpaceSmall,
//               _buildButtonPayment()
//             ],
//           ),
//         )
//     );
//   }
//   _buildButtonPayment() {
//     return BlocBuilder<LoginBloc, LoginState>(
//         buildWhen: (previous, current) => previous.status != current.status,
//         builder: (context, state) {
//           return WidgetButton2(
//             height: 50,
//             // onTap: () => state.status.isValidated ? bloc.add(FormSubmitted()) : null,
//             onTap: ()=> AppNavigator.navigateBookDetail(),
//             //enable: state.status.isValidated,
//             backgroundColor: HexColor('#FF9F00'),
//             text: 'Xem sách',
//           );
//         }
//     );
//   }
// }