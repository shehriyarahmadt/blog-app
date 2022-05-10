import 'package:bloc/bloc.dart';
import 'package:blog_app/view/login_page.dart';
import 'package:flutter/material.dart';
import '../../Repo/signup_api_repo.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future signup({required String nameController,required String emailController,required String passwordController,required BuildContext ctx}) async {




    final apiData = await SignUpApiRepo.signupApi(nameController: nameController,emailController: emailController, passwordController: passwordController,ctx: ctx);

    print('Respoinse in cubit: $apiData');

    if(apiData != null) {

      emit(SignupInitial());
        /*emit( SignUpApiToastState());*/
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
        return const LoginPage();
      }));
    }


    if(apiData == null){
      emit(SignupApiErrorState(error: 'error state'));
    }


   /* else {

      /// error state
      emit(SignupApiErrorState(error: 'error state'));

    }*/




  }


}
