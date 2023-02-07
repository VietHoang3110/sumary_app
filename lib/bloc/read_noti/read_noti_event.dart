part of 'read_noti_bloc.dart';

abstract class ReadNotiEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ReadNotiEvent();
}



class ReadNotiEventSubmitted extends ReadNotiEvent {
  ReadNotiEventSubmitted({
    required this.id
  });

  String id;

  @override
  List<Object> get props => [id];
}
