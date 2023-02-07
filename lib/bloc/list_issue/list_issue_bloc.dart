import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_issue.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/messages.dart';

part 'list_issue_event.dart';
part 'list_issue_state.dart';

class ListIssueBloc extends Bloc<ListIssueEvent, ListIssueState>{
  final UserRepository userRepository;

  ListIssueBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListIssueState());

  @override
  Stream<ListIssueState> mapEventToState(ListIssueEvent event) async* {
    if (event is InitGetListIssueEvent) {
      yield* _getListIssue(page:event.page,pageSize:event.pageSize,keyword: event.keyword);
    }
  }
  Stream<ListIssueState> _getListIssue({required int page, required int pageSize, required String keyword }) async* {
    // LoadingApi().pushLoading();
    try {
      final response = await userRepository.getListIssue(keyword,page, pageSize);
      if(response.statusCode == BASE_URL.SUCCESS_200){
        yield UpdateGetListIssueState(response.data!.records!);
      }
      else
        yield ErrorGetListIssueState(response.message ?? '');
    } catch (e) {
      yield ErrorGetListIssueState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ListIssueBloc of(BuildContext context) => BlocProvider.of<ListIssueBloc>(context);
}