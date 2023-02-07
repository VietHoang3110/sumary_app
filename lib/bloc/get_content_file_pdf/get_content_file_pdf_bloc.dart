
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sumary_app/api_resfull/LocalStorage.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/src_index.dart';

part 'get_content_file_pdf_event.dart';
part 'get_content_file_pdf_state.dart';


class ContentFileBloc extends Bloc<ContentFileEvent, ContentFileState>{
  final UserRepository userRepository;

  ContentFileBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitContentFileState());

  LocalStorage storage = LocalStorage();
  @override
  Stream<ContentFileState> mapEventToState(ContentFileEvent event) async* {
    if (event is InitContentFileEvent) {
      print('---------------------------------------------------------');
      print('---------------------------------------------------------');
      print('---------------------------------------------------------');
      yield* _getFileBookPdf(event.name, event.isSave!);
    }
  }

  Stream<ContentFileState> getStringWithInternet(String name) async* {
    yield LoadingContentFileState();
    LoadingApi().pushLoading();
    final response = await userRepository.getFileBookPdf(name);
    if(response.statusCode == BASE_URL.SUCCESS_200) {
      String temp = "";
      temp = response.data.replaceAll(" \n ", "\t");
      temp = temp.replaceAll(" \n", " ");
      temp = temp.replaceAll("\t", "\n");
      yield UpdateContentFileState(temp);
    }
    else
      yield ErrorContentFileState(response.message ?? "");

    LoadingApi().popLoading();

  }

  Stream<ContentFileState> _getFileBookPdf(String name, bool isSave) async* {
    try {
      if(isSave) {
        String? content = storage.getStorageByKey(name);
        if(content != null) {
          String temp="";
          temp=content.replaceAll(" \n ", "\t");
          temp=temp.replaceAll(" \n", " ");
          temp=temp.replaceAll("\t", "\n");
          yield UpdateContentFileState(temp);
        } else {
        yield* getStringWithInternet(name);
        }
      } else {
        yield* getStringWithInternet(name);
      }
    } catch (e) {
      Get.snackbar("Lỗi file", "Có lỗi xảy ra", backgroundColor: Colors.white);
      throw e;
    }

  }


  static ContentFileBloc of(BuildContext context) => BlocProvider.of<ContentFileBloc>(context);
}