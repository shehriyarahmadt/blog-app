part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}


class SignupApiLoadingState extends SignupState {}


class SignupApiErrorState extends SignupState {

  String error;
  SignupApiErrorState({required this.error});

}