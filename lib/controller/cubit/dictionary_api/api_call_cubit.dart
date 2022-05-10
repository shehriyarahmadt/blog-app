import 'package:bloc/bloc.dart';
import 'package:blog_app/controller/Repo/api_call_repo.dart';
import 'package:blog_app/model/dictionary_model.dart';
import 'package:meta/meta.dart';

part 'api_call_state.dart';

class ApiCallCubit extends Cubit<ApiCallState> {
  ApiCallCubit() : super(ApiCallInitial());


  void dictionaryApi({required String? name}) async {

    /// initial state
    emit(ApiCallLoading());

    final apiData = await ApiCallRepo.dictionaryApi(name);

    print('dictionary Respoinse in cubit: $apiData');

    if(apiData != null) {
      /// Loaded state
      Future.delayed(const Duration(seconds: 2), () {
        emit(ApiCallLoadedState(dictionaryModel: apiData));
      });
    } else {
      /// error state
      emit(ApiCallErrorState(error: 'error state'));
    }

  }


}
