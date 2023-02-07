part of 'update_profile_bloc.dart';
abstract class UpdateProfileEvent extends Equatable {

  const UpdateProfileEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends UpdateProfileEvent {
  const NameChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class NameUnfocused extends UpdateProfileEvent {}

class PhoneChanged extends UpdateProfileEvent {
  const PhoneChanged({required this.phone});

  final String phone;

  @override
  List<Object> get props => [phone];
}

class PhoneUnfocused extends UpdateProfileEvent {}

class FormProfileNoAvatarSubmitted extends UpdateProfileEvent {

  final String phone;
  final String name;

  const FormProfileNoAvatarSubmitted({
    required this.phone,
    required this.name,
  });

  @override
  List<Object> get props => [phone,name];

}


class FormProfileSubmitted extends UpdateProfileEvent {
  final File avatar;
  final String phone;
  final String name;


  const FormProfileSubmitted({
    required this.avatar,
    required this.phone,
    required this.name,
  });

  @override
  List<Object> get props => [avatar,phone,name,];
}

class AvatarSubmitted extends UpdateProfileEvent {
  final File avatar;

  const AvatarSubmitted({
    required this.avatar,
  });

  @override
  List<Object> get props => [avatar];
}

