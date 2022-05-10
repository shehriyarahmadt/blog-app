import 'package:bloc/bloc.dart';
import 'package:blog_app/controller/Repo/login_api_repo.dart';
import 'package:blog_app/view/home_screen/dashboard.dart';
import 'package:flutter/material.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());


  void login({required String email,required String password,required BuildContext ctx}) async {

    emit(LoginApiLoadingState());

    final apiData = await LoginApiRepo.logInApi(emailController: email, passwordController: password,ctx: ctx);

    print('Respoinse in cubit: $apiData');

    if(apiData != null) {
      /// Loaded state
      Future.delayed(const Duration(seconds: 2), () {

        emit(LoginInitial());


      });

      Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
        return DashBoard(email, password);
      }));
    }

    /*if(apiData != null){
      emit(LoginApiLoadedState());
    }*/

    else {

      /// error state
      emit(LoginApiErrorState(error: 'error state'));
    }


  }




}
