import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

import '../../src/src_index.dart';
import '../../widgets/widgets.dart';

class Documents_Screen extends StatefulWidget {
  const Documents_Screen({Key? key}) : super(key: key);

  @override
  State<Documents_Screen> createState() => _Documents_ScreenState();
}

class _Documents_ScreenState extends State<Documents_Screen> {

  @override
  void initState() {
    super.initState();
    getPermission();
  }

  // void getPermission() {
  //   final permission =  Permission.storage;
  //   // await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  // }

  void getPermission() async {
    Permission.requestInstallPackages;
  }

  List imgUrlPDF = [
   "https://api.tiemnangmaster.top/upload/get-file/1655539997896bo-de-thi-tkltw-2021-2022.pdf",
    "https://api.tiemnangmaster.top/upload/get-file/1655694992498thuvienpdf.pdf",
   "https://api.tiemnangmaster.top/upload/get-file/1655695105029�c��ng-�n-t�p-vi-x�-l�-from-ptm.pdf",
  ];

  final imgUrl = "https://api.tiemnangmaster.top/upload/get-file/1655539997896bo-de-thi-tkltw-2021-2022.pdf";

  var dio = Dio();

  void showDownloadProgress(received, total) async {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  Future download2(Dio dio, String url, String savePath) async {
    //get pdf from link
    Response response = await dio.get(
      url,
      onReceiveProgress: showDownloadProgress,
      //Received data with List<int>
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
    //write in download folder
    File file = File(savePath);
    var raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
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
          title: 'Tài liệu',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: ()=> AppNavigator.navigateBack(),
            child: Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView.separated(
          shrinkWrap: true,
            itemBuilder: (context,index){
              return Padding(
                padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/icons/icon_pdf.svg'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: AppValue.widths*0.6,
                              child: WidgetText(
                                title: imgUrlPDF[index],
                                style: AppStyle.DEFAULT_14.copyWith(
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            WidgetText(
                              title: '120 kb',
                              style: AppStyle.DEFAULT_12
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            String path =
                            await ExternalPath.getExternalStoragePublicDirectory(
                                ExternalPath.DIRECTORY_DOWNLOADS);
                            String fullPath = "$path/newtask.pdf";
                            download2(dio,imgUrlPDF[index],fullPath);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // ExternalPath.DIRECTORY_DOWNLOADS ==null
                              //     ?
                              WidgetText(
                                title: 'Tải xuống',
                                style: AppStyle.DEFAULT_12.copyWith(
                                  color: HexColor('#FE7D43')
                                ),
                              ),
                              //     : WidgetText(
                              //   title: 'Đã tải',
                              //   style: AppStyle.DEFAULT_12.copyWith(
                              //       color: HexColor('#FE7D43')
                              //   ),
                              // ),
                              AppValue.hSpaceTiny,
                              SvgPicture.asset('assets/icons/cloud_computing.svg'),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
            },
            separatorBuilder: (context,index){
              return Container(width: AppValue.widths,color: COLORS.GREY_400,height: 1);
            },
            itemCount: imgUrlPDF.length
        ),
      ),
    );
  }
}
