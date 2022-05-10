import 'package:blog_app/controller/cubit/signup/signup_cubit.dart';
import 'package:blog_app/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/colors.dart';


class SignUpPage extends StatefulWidget {
  static const signUpPageRoute = 'route1';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool agree = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var nameField = TextField(
      controller: nameController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Jhon",
        hintStyle: TextStyle(color: MyColors.secondaryColor),
        filled: true,
        fillColor: const Color(0xFFFCFBFB),
        contentPadding: EdgeInsets.only(left: 15.sp),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: const BorderSide(color: Color(0xFF616161))),
      ),
    );

    var emailField = TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "xyz@gmail.com",
        hintStyle: TextStyle(color: MyColors.secondaryColor),
        filled: true,
        fillColor: const Color(0xFFFCFBFB),
        contentPadding: EdgeInsets.only(left: 15.sp),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: const BorderSide(color: Color(0xFF616161))),
      ),
    );

    var passwordField = TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Enter Password",
        hintStyle: TextStyle(color: MyColors.secondaryColor),
        fillColor: const Color(0xFFFCFBFB),
        filled: true,
        contentPadding: EdgeInsets.only(left: 15.sp),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: const BorderSide(color: Color(0xFF616161))),
      ),
    );

    Widget list() {
      return ListView(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Text(
              "Create Account",
              style: TextStyle(color: MyColors.primaryColor, fontSize: 28.sp),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              "Enter your credentials to login",
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Name",
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: 6.h,
            ),
            nameField,
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Email",
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: 6.h,
            ),
            emailField,
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Password",
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: 6.h,
            ),
            passwordField,
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Material(
                  child: Checkbox(
                    value: agree,
                    onChanged: (value) {
                      setState(() {
                        agree = value ?? false;
                      });
                    },
                  ),
                ),
                const Text(
                  'I agree to the ',
                ),
                const Text(
                  'terms and conditions',
                  style: TextStyle(
                    color: Color(0xFF0D638A),
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF0D638A),
                  onPrimary: const Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      side: const BorderSide(
                        color: Color(0xFF0D638A),
                      )),
                ),
                child: Padding(
                  padding: EdgeInsets.all(18.sp),
                  child: const Text("Sign Up"),
                ),
                onPressed: () async {

                  if(nameController.text == '' && emailController.text == '' && passwordController.text == ''){

                    return;

                  }
                  context.read<SignupCubit>().signup(
                        nameController: nameController.text,
                        emailController: emailController.text,
                        passwordController: passwordController.text,
                        ctx: context,
                      );
                }),
            Padding(
              padding: EdgeInsets.only(left: 37.sp),
              child: Row(
                children: [
                  const Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text("Already have an account? "))),
                  Expanded(
                      flex: 2,
                      child: TextButton(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Sign in",
                              style: TextStyle(color: Color(0xFF0D638A)),
                            )),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return const LoginPage();
                              }));
                        },
                      )),
                ],
              ),
            ),
          ]);
    }

    return Scaffold(
      body: ListView(children: [
        Image.asset('assets/signup_blog.png'),
        SizedBox(
            height: 380.h,
            child: Padding(
              padding: EdgeInsets.only(left: 37.sp, right: 37.sp),
              child: BlocBuilder<SignupCubit, SignupState>(
                  builder: (context, state) {

                    if (state is SignupInitial) {
                      return list();
                    }
                    else {
                      return const Center(
                        child: Text('error state'),
                      );
                    }








                  }),
            )),
        Padding(
          padding: EdgeInsets.only(left: 37.sp),
          child: Row(
            children: [
              const Expanded(
                  flex: 2,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Already have an account? "))),
              Expanded(
                  flex: 2,
                  child: TextButton(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Sign In",
                          style: TextStyle(color: Color(0xFF0D638A)),
                        )),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return const LoginPage();
                          }));
                    },
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
