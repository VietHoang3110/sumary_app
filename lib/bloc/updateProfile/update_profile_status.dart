part of 'update_profile_bloc.dart';
abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();
  @override
  List<Object> get props => [];
}
class InitUpdateProfile extends UpdateProfileState {}

class LoadingProfile extends UpdateProfileState {}

class ErrorUpdateProfile extends UpdateProfileState{
  final String msg;

  ErrorUpdateProfile(this.msg);
  @override
  List<Object> get props => [msg];
}

class UpdateProfileSuccess extends UpdateProfileState{

  const UpdateProfileSuccess();
  @override
  List<Object> get props => [];
}
