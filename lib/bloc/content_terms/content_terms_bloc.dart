import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/content_terms.dart';
import 'package:sumary_app/src/models/model_generator/list_issue.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';

part 'content_terms_event.dart';
part 'content_terms_state.dart';

class ContentTermsBloc extends Bloc<ContentTermsEvent, ContentTermsState>{
  final UserRepository userRepository;

  ContentTermsBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitContentTermsState());

  @override
  Stream<ContentTermsState> mapEventToState(ContentTermsEvent event) async* {
    if (event is InitContentTermsEvent) {
      yield* _getTerms();
    }
  }
  Stream<ContentTermsState> _getTerms() async* {
    // LoadingApi().pushLoading();
    try {
      final response = await userRepository.getTerms();
      if(response.statusCode == BASE_URL.SUCCESS_200){
        yield UpdateContentTermsState(response.data!);
      }
      else
        yield ErrorContentTermsState(response.message ?? '');
    } catch (e) {
      yield ErrorContentTermsState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ContentTermsBloc of(BuildContext context) => BlocProvider.of<ContentTermsBloc>(context);
}