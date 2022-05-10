import 'package:blog_app/controller/cubit/dictionary_api/api_call_cubit.dart';
import 'package:blog_app/controller/cubit/login/login_cubit.dart';
import 'package:blog_app/controller/cubit/profile/profile_cubit.dart';
import 'package:blog_app/controller/cubit/signup/signup_cubit.dart';
import 'package:blog_app/view/login_page.dart';
import 'package:blog_app/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () =>
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => ApiCallCubit()),
              BlocProvider(create: (_) => SignupCubit()),
              BlocProvider(create: (_) => LoginCubit()),
              BlocProvider(create: (_) => ProfileCubit()),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(

                primarySwatch: Colors.blue,

              ),
              home: const LoginPage(/**/),
              routes: {
                SignUpPage.signUpPageRoute: (ctx) => const SignUpPage(),
               /* DashBoard.DashBoardRoute: (ctx) =>  DashBoard('shoaib@gmail.com', '123'),*/
              },
            ),
          ),
    );
  }
}


