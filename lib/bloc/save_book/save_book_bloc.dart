import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sumary_app/api_resfull/LocalStorage.dart';
import 'package:sumary_app/api_resfull/user_repository.dart';
import 'package:sumary_app/src/src_index.dart';

import '../../src/models/model_generator/detail_productt.dart';

part 'save_book_event.dart';
part 'save_book_state.dart';

class SaveBookBloc extends Bloc<SaveBookEvent, SaveBookState> {
  final UserRepository userRepository;

  SaveBookBloc({required this.userRepository})
      : super(InProgressSaveBookState());

  @override
  void onTransition(Transition<SaveBookEvent, SaveBookState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<SaveBookState> mapEventToState(SaveBookEvent event) async* {
    if (event is SaveBookSubmitted) {
      try {
        yield InProgressSaveBookState();
        LocalStorage storage = LocalStorage();
        var response = await userRepository.saveBook(id: event.id);
        storage.createStorageByKey(event.id.toString(), event.data.toJson());
        String localPath;
        if (Platform.isAndroid) {
          localPath = (await getExternalStorageDirectory())!.absolute.path +
              "/download";
        } else {
          localPath =
              (await getApplicationDocumentsDirectory()).path + "/download";
        }

        final savedDir = Directory(localPath);
        bool hasExisted = await savedDir.exists();
        if (!hasExisted) {
          savedDir.create();
        }
        event.data.book?.voice?.forEach((element) async {
          var index = event.data.book?.voice?.indexOf(element);
          final taskId = await FlutterDownloader.enqueue(
              url:
                  'https://api.tiemnangmaster.com/upload/get-voice/${element.src}',
              fileName: element.src,
              savedDir: localPath,
              showNotification: true,
              // notificationTitle: "Save book ${element.name!}",
              saveInPublicStorage: true
              // openFileFromNotification: true,
              );
          if (index != null) {
            var name = event.data.book?.file![index].src;
            Future.delayed(const Duration(milliseconds: 1000), () async {
              final response = await userRepository.getFileBookPdf(name!);
              storage.createStorageByKey(name, response.data);
            });
            storage.createStorageByKey(element.src!, taskId);
          }
        });

        if (response.statusCode == BASE_URL.SUCCESS_200) {
          yield SuccessSaveBookState(message: response.message!);
        } else {
          yield FailureSaveBookState(message: response.message!);
        }
      } catch (e) {
        throw e;
      }
    }
  }

  static SaveBookBloc of(BuildContext context) =>
      BlocProvider.of<SaveBookBloc>(context);
}
