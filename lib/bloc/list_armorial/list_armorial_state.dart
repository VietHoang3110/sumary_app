part of 'list_armorial_bloc.dart';


abstract class ListArmorialState extends Equatable {

  @override
  List<Object?> get props => [];

  ListArmorialState();
}
class InitGetListArmorialState extends ListArmorialState {}

class UpdateGetListArmorialState extends ListArmorialState{
  List<Armorial> data;

  UpdateGetListArmorialState(this.data);
  @override
  List<Object> get props => [];
}

class LoadingListArmorialState extends ListArmorialState {
}


class ErrorGetListArmorialState extends ListArmorialState{
  final String msg;


  ErrorGetListArmorialState(this.msg);

  @override
  List<Object> get props => [msg];
}