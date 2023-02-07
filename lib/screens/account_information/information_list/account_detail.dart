import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sumary_app/bloc/user_info/user_info_bloc.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../../bloc/updateProfile/update_profile_bloc.dart';
import '../../../widgets/widget_dialog.dart';
import '../../../widgets/widget_input.dart';

class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {

  final _phoneFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    UserInfoBloc.of(context).add(InitUserInfoEvent());
    _phoneFocusNode.addListener(() {
      if (!_phoneFocusNode.hasFocus) {
        context.read<UpdateProfileBloc>().add(PhoneUnfocused());
      }
    });
    _nameFocusNode.addListener(() {
      if (!_nameFocusNode.hasFocus) {
        context.read<UpdateProfileBloc>().add(NameUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }
  File? image;
  bool isSelect = true;

  static List<CropAspectRatioPreset> crossAspectRatioAndroid = [
    CropAspectRatioPreset.square,
  ];

  static List<CropAspectRatioPreset> crossAspectRatioIos = [
    CropAspectRatioPreset.square,
  ];


  static AndroidUiSettings androidUiSettings = const AndroidUiSettings(
    toolbarTitle: "TNMaster",
    toolbarColor: COLORS.PRIMARY_COLOR,
    toolbarWidgetColor: Colors.white,
    initAspectRatio: CropAspectRatioPreset.original,
    lockAspectRatio: false,
  );

  static IOSUiSettings iosUiSettings = const IOSUiSettings(
    title: "TNMaster",
  );


  Future getImage() async {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: const Text('Ảnh đại diện'),
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Huỷ'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () async {
                  try {
                    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

                    if(image == null) return;

                    final imageTemp = File(image.path);
                    //
                    // final croppedImage = await ImageCropper().cropImage(
                    //   sourcePath: image.path,
                    //   aspectRatioPresets: Platform.isAndroid ? crossAspectRatioAndroid : crossAspectRatioIos,
                    //   androidUiSettings: androidUiSettings,
                    //   iosUiSettings: iosUiSettings,
                    // );

                    setState(() => this.image = imageTemp);

                  } on PlatformException catch(e){
                    print('Error: $e');
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Chọn ảnh có sẵn'),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  try {
                    final image = await ImagePicker().pickImage(source: ImageSource.camera);

                    if(image == null) return;

                    final imageTemp = File(image.path);

                    setState(() => this.image = imageTemp);
                  } on PlatformException catch(e){
                    print('Error: $e');
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Chụp ảnh mới'),
              )
            ],
          );
        });
  }
  void openKeyboard(){
    FocusScope.of(context).requestFocus(_nameFocusNode);
  }


  @override
  Widget build(BuildContext context) {

    final bloc = UpdateProfileBloc.of(context);
    return BlocListener<UpdateProfileBloc, UpdateProfileState>(
        listener: (context, state) {
        if(state is UpdateProfileSuccess){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WidgetDialog(
                title: MESSAGES.NOTIFICATION,
                content: 'Chỉnh sửa thành công!',
                onTap1: (){
                  Get.back();
                  Get.back();
                  UserInfoBloc.of(context).add(InitUserInfoEvent());
                },
              );
            },);
          } else if (state is ErrorUpdateProfile){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const WidgetDialog(
                title: MESSAGES.NOTIFICATION,
                content: 'Bạn chưa chỉnh sửa thông tin',
              );
            },);
        }
        },
        child: Scaffold(
          backgroundColor: COLORS.BACKGROUND,
          appBar: _buildAppBar(bloc),
          body:  BlocBuilder<UserInfoBloc, UserInfoState>(
            builder: (context, state) {
            if (state is UpdateUserInfoState) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppValue.vSpaceTiny,
                      GestureDetector(
                        onTap: getImage,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppValue.widths*0.32,vertical: 20),
                          child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(27),
                                    child: image != null ?
                                    Image.file(image!,fit: BoxFit.cover,)
                                        :
                                    Image.network(
                                      state.data.avatar == ''?
                                          'https://api.tiemnangmaster.com/static/1658480314678group-14578.png/high'
                                      : state.data.avatar!,
                                      fit: BoxFit.cover,)
                                ),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.centerEnd,
                                children: [
                                  SvgPicture.asset('assets/images/edit_avt.svg'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset('assets/icons/camera.svg',fit: BoxFit.cover,),
                                      WidgetText(
                                        title: 'Chỉnh sửa',
                                        style: AppStyle.DEFAULT_14.copyWith(
                                            color: Colors.white
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: COLORS.GREY_E7)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 10, left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    WidgetText(
                                        title: 'Thông tin cá nhân',
                                        style: AppStyle.DEFAULT_18_BOLD
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: (){
                                        setState(()
                                        {
                                          isSelect = false;
                                        });
                                        Future.delayed(Duration(microseconds: 200),(){
                                          openKeyboard();
                                        });
                                      },
                                      child: WidgetText(
                                        title: 'Chỉnh sửa',
                                        style: AppStyle.DEFAULT_16.copyWith(
                                            color: COLORS.PRIMARY_COLOR
                                        )),
                                    )
                                  ],
                                ),
                                AppValue.vSpaceMedium,
                                _buildTextFieldUsername(state.data.name,bloc),
                                AppValue.vSpaceMedium,
                                _buildTextFieldPhone(state.data.phone??'',bloc),
                                AppValue.vSpaceSmall,
                              ],
                            ),
                          ),
                        ),
                      ),
                      _changePassWord()
                    ],
                  ),
                ),
              );
              }else {
              return Container();
            }
              }
          ),
        ) );
  }


  _buildButtonChangeInfo(UpdateProfileBloc bloc){
    return BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
                if(image!= null){
                  bloc.add(FormProfileSubmitted(avatar: image!,name:name, phone: phone));
                  // UserInfoBloc.of(context).add(InitUserInfoEvent());
                  // AppNavigator.navigateInfo();
                }
                else {
                  bloc.add(FormProfileNoAvatarSubmitted(name: name, phone: phone));
                  // UserInfoBloc.of(context).add(InitUserInfoEvent());
                  // AppNavigator.navigateInfo();
                }
            },
            child: WidgetText(
                title: 'Lưu',
                style: AppStyle.DEFAULT_16.copyWith(
                    color: COLORS.PRIMARY_COLOR
                )
            ),
          );
        });
  }

  _changePassWord(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: COLORS.GREY_E7)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WidgetText(
                  title: 'Đổi mật khẩu',
                  style: AppStyle.DEFAULT_18_BOLD
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => AppNavigator.navigateChangePass(),
                child: WidgetText(
                    title: 'Thay đổi',
                    style: AppStyle.DEFAULT_16.copyWith(
                        color: COLORS.PRIMARY_COLOR
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar(UpdateProfileBloc bloc){
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: WidgetText(
        title: 'Chi tiết của bạn',
        style: AppStyle.DEFAULT_16.copyWith(
            fontWeight: FontWeight.w500
        ),
      ),
      leading: InkWell(
          onTap: ()=> AppNavigator.navigateBack(),
          child: const Icon(Icons.arrow_back,color: Colors.black,)
      ),
      actions: [
        GestureDetector(
          onTap: (){},
          child: Center(
            child: (!isSelect || image !=null)?  _buildButtonChangeInfo(bloc) : WidgetText(
                title: 'Lưu',
                style: AppStyle.DEFAULT_16.copyWith(
                    color: COLORS.PRIMARY_COLOR
                )
            ),
          ),
        ),
        AppValue.hSpaceSmall
      ],
    );
  }

  String name ='';
  _buildTextFieldUsername(String initialValue,UpdateProfileBloc bloc) {
    name = initialValue;
    return BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
        builder: (context, state) {
          return WidgetInput5(
            height: 48,
            onChanged: (value) => name = value,
            inputType: TextInputType.emailAddress,
            focusNode: _nameFocusNode,
            readOnly: isSelect ? true : false,
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE,
                border: Border.all(
                    color: COLORS.GREY_400,
                    width: 1
                )
            ),
            initialValue: initialValue,
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text('Tên người dùng', style:!isSelect ? AppStyle.DEFAULT_16:AppStyle.DEFAULT_16.copyWith(color: COLORS.GREY_400)),
            ),
          );
        }
    );
  }

  String phone='';
  _buildTextFieldPhone(String initialValue, UpdateProfileBloc bloc) {
    phone = initialValue;
    return BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
        builder: (context, state) {
          return WidgetInput5(
            height: 48,
            onChanged: (value) => phone = value,
            inputType: TextInputType.emailAddress,
            focusNode: _phoneFocusNode,
            readOnly: isSelect ? true : false,
            boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: COLORS.WHITE,
                border: Border.all(
                    color: COLORS.GREY_400,
                    width: 1
                )
            ),
            initialValue: initialValue,
            fix: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(MESSAGES.PHONE, style:!isSelect ? AppStyle.DEFAULT_16:AppStyle.DEFAULT_16.copyWith(color: COLORS.GREY_400)),
            ),
          );
        }
    );
  }
}
