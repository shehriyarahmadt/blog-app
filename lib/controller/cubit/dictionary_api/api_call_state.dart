part of 'api_call_cubit.dart';

@immutable
abstract class ApiCallState {}


class ApiCallInitial extends ApiCallState {}
class ApiCallLoading extends ApiCallState {}


class ApiCallLoadedState extends ApiCallState {

  Dictionary? dictionaryModel;

  ApiCallLoadedState({required this.dictionaryModel});
}


class ApiCallErrorState extends ApiCallState {

  String? error;

  ApiCallErrorState({required this.error});
}
