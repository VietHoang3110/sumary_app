import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';


part 'update_profile_event.dart';
part 'update_profile_status.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final UserRepository userRepository;

  UpdateProfileBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitUpdateProfile());

  @override
  void onTransition(Transition<UpdateProfileEvent, UpdateProfileState> transition) {
    super.onTransition(transition);
  }
  @override
  Stream<UpdateProfileState> mapEventToState(UpdateProfileEvent event) async* {
    if(event is FormProfileSubmitted){
      yield* _mapProfileEventToState(avatar: event.avatar, name: event.name,phone: event.phone);
    } else if(event is FormProfileNoAvatarSubmitted){
      yield* _mapProfileNoAvatarToState(name: event.name!,phone: event.phone!);
    } else if(event is AvatarSubmitted){
      yield* _mapProfileAvatarToState(avatar: event.avatar);
    }

  }
  Stream<UpdateProfileState> _mapProfileNoAvatarToState({required String name,required String phone}) async*{
    try{
      yield LoadingProfile();
      final response = await userRepository.updateProfileNoAvatar(name: name,phone: phone);
      if(response.statusCode == BASE_URL.SUCCESS_200){
        yield UpdateProfileSuccess();
        }
      else {
        yield ErrorUpdateProfile(response.message ?? 'Có lỗi xảy ra');
      }
    }
    catch(e){
      yield ErrorUpdateProfile(MESSAGES.CONNECT_ERROR);
    throw e;
    }
  }
  Stream<UpdateProfileState> _mapProfileEventToState({File? avatar, required String? name, required String? phone}) async* {
    if(avatar != null){
      yield LoadingProfile();
      var responseUploadFile = await userRepository.updateFile(file: avatar);
      if(responseUploadFile.statusCode == BASE_URL.SUCCESS_200){
          final response = await userRepository.updateProfile(avatar:responseUploadFile.data!.fileId!,phone: phone,name: name);
          if(response.statusCode == BASE_URL.SUCCESS_200){
            yield UpdateProfileSuccess();
          }
          else {
            yield ErrorUpdateProfile(response.message ?? 'Có lỗi xảy ra');
          }
      }
    }
  }
  Stream<UpdateProfileState> _mapProfileAvatarToState({required File avatar}) async* {
    if(avatar != null){
      yield LoadingProfile();
      var responseUploadFile = await userRepository.updateFile(file: avatar);
      if(responseUploadFile.statusCode == BASE_URL.SUCCESS_200){
        final response = await userRepository.updateAvatar(avatar:responseUploadFile.data!.fileId!);
        if(response.statusCode == BASE_URL.SUCCESS_200){
          yield UpdateProfileSuccess();
        }
        else {
          yield ErrorUpdateProfile(response.message ?? 'Có lỗi xảy ra');
        }
      }
    }
  }

  static UpdateProfileBloc of(BuildContext context) => BlocProvider.of<UpdateProfileBloc>(context);
}