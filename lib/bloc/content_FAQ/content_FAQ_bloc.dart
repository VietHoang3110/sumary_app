import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/content_faq.dart';
import 'package:sumary_app/src/models/model_generator/content_terms.dart';
import 'package:sumary_app/src/models/model_generator/list_issue.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';

part 'content_FAQ_event.dart';
part 'content_FAQ_state.dart';

class ContentFAQBloc extends Bloc<ContentFAQEvent, ContentFAQState>{
  final UserRepository userRepository;

  ContentFAQBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitContentFAQState());

  @override
  Stream<ContentFAQState> mapEventToState(ContentFAQEvent event) async* {
    if (event is InitContentFAQEvent) {
      yield* _getFAQ();
    }
  }
  Stream<ContentFAQState> _getFAQ() async* {
    // LoadingApi().pushLoading();
    try {
      final response = await userRepository.getFAQ();
      if(response.statusCode == BASE_URL.SUCCESS_200){
        yield UpdateContentFAQState(response.data!);
      }
      else
        yield ErrorContentFAQState(response.message ?? '');
    } catch (e) {
      yield ErrorContentFAQState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ContentFAQBloc of(BuildContext context) => BlocProvider.of<ContentFAQBloc>(context);
}