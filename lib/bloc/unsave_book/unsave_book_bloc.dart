import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../api_resfull/LocalStorage.dart';
import '../../src/models/model_generator/detail_productt.dart';

part 'unsave_book_event.dart';
part 'unsave_book_state.dart';

class UnsaveBookBloc extends Bloc<UnsaveBookEvent, UnsaveBookState> {
  final UserRepository userRepository;

  UnsaveBookBloc({required this.userRepository})
      : super(InProgressUnsaveBookState());

  @override
  void onTransition(Transition<UnsaveBookEvent, UnsaveBookState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<UnsaveBookState> mapEventToState(UnsaveBookEvent event) async* {
    if (event is UnsaveBookSubmitted) {
      try{
        LocalStorage storage = LocalStorage();
        storage.removeStorageByKey(event.id);
        event.data.book?.voice?.forEach((element) async {
          var index = event.data.book?.voice?.indexOf(element);
          var taskId = storage.getStorageByKey(element.src!);
          await FlutterDownloader.remove(taskId: taskId);
          var name = event.data.book?.file![index!].src;
          storage.removeStorageByKey(name!);
        });
        yield InProgressUnsaveBookState();
        var response = await userRepository.unsaveBook(id: event.id);
        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessUnsaveBookState(message:  response.message!);
        } else {
          yield FailureUnsaveBookState(message: response.message!);
        }
      }catch(e){
        throw e;
      }
    }
  }
  static UnsaveBookBloc of(BuildContext context) => BlocProvider.of<UnsaveBookBloc>(context);
}
