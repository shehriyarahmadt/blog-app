part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  ProfileLoadedState(String email, String password);
}

class ProfileErrorState extends ProfileState {}
