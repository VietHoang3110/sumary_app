part of 'user_info_bloc.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();
  @override
  List<Object?> get props => [];
}
class InitUserInfo extends UserInfoState {}

class UpdateUserInfoState extends UserInfoState{
  final DataUser data;

  const UpdateUserInfoState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingUserInfoState extends UserInfoState {
}


class ErrorUserInfoState extends UserInfoState{
  final String message;

  ErrorUserInfoState(this.message);
  @override
  List<Object> get props => [message];
}