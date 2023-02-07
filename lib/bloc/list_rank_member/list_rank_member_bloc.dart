
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/list_rank_member_user.dart';
import '../../src/src_index.dart';

part 'list_rank_member_event.dart';
part 'list_rank_member_state.dart';


class ListRankMemberBloc extends Bloc<ListRankMemberEvent, ListRankMemberState>{
  final UserRepository userRepository;

  ListRankMemberBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListRankMemberState());

  @override
  Stream<ListRankMemberState> mapEventToState(ListRankMemberEvent event) async* {
    if (event is InitGetListRankMemberEvent) {
      yield* _getListRankMember(event.keyword,event.page,event.pageSize);
    }
  }
  Stream<ListRankMemberState> _getListRankMember(String keyword, int page, int pageSize ) async* {
    // LoadingApi().pushLoading();
    try {
      yield LoadingGetListRankMemberState();
      final response = await userRepository.getListRankMember(keyword, page, pageSize);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateListRankMemberState(response.data!.records!);
      }
      else
        yield ErrorGetListRankMemberState(response.message!);
    } catch (e) {
      yield ErrorGetListRankMemberState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static ListRankMemberBloc of(BuildContext context) => BlocProvider.of<ListRankMemberBloc>(context);
}