part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}


class LoginApiLoadingState extends LoginState {}

class LoginApiErrorState extends LoginState {

  String error;
  LoginApiErrorState({required this.error});

}