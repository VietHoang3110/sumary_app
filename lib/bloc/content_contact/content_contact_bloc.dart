import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/content_contact.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';

part 'content_contact_event.dart';
part 'content_contact_state.dart';

class ContentContactBloc extends Bloc<ContentContactEvent, ContentContactState>{
  final UserRepository userRepository;

  ContentContactBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitContentContactState());

  @override
  Stream<ContentContactState> mapEventToState(ContentContactEvent event) async* {
    if (event is InitContentContactEvent) {
      yield* _getcontact();
    }
  }
  Stream<ContentContactState> _getcontact() async* {
    // LoadingApi().pushLoading();
    try {
      final response = await userRepository.getContact();
      if(response.statusCode == BASE_URL.SUCCESS_200){
        yield UpdateContentContactState(response.data!);
      }
      else
        yield ErrorContentContactState(response.message ?? '');
    } catch (e) {
      yield ErrorContentContactState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ContentContactBloc of(BuildContext context) => BlocProvider.of<ContentContactBloc>(context);
}