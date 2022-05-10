import 'package:blog_app/controller/colors.dart';
import 'package:blog_app/controller/cubit/login/login_cubit.dart';
import 'package:blog_app/view/signup_page.dart';
import 'package:blog_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndialog/ndialog.dart';



class LoginPage extends StatefulWidget {

  static const loginPageRoute = "route3";

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /*void logIn(email, password) async {

    ProgressDialog progressDialog = ProgressDialog(context,
      message:Text("Loging In"),
      title:Text("Please Wait"),
    );
    progressDialog.show();

    try {
      Response response =
      await post(Uri.parse('https://inveoa.com/api/login'), body: {
        'email': email,
        'password': password,
      });
      print(response);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('Login successfully');
        progressDialog.dismiss();

        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return  DashBoard(email,password);
            }));
        Fluttertoast.showToast(
          msg: "Login successfully",  // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.BOTTOM,    // location// duration
        );

      } else {
        progressDialog.dismiss();
        Fluttertoast.showToast(
          msg: "Failed",  // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.BOTTOM,    // location// duration
        );
        print('failed');
      }
    } catch (e) {
      print(e.toString());
      progressDialog.dismiss();
    }
  }*/




  @override
  Widget build(BuildContext context) {
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

    Widget list(){

      return ListView(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text(
            "Login",
            style: TextStyle(
                color: MyColors.primaryColor, fontSize: 28.sp),
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
          Container(
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () {},
                child: Text("Forgot password?",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF0D638A)))),
          ),
          SizedBox(
            height: 10.h,
          ),
          Button("Sign In", const Color(0xFF0D638A),
            const Color(0xFFFFFFFF),() async {


            if(emailController.text == '' && passwordController.text == ''){

              return;

            }

             /* await ProgressDialog;*/

              context.read<LoginCubit>().login(email: emailController.text,password:passwordController.text,ctx: context);



              /* logIn(
                          emailController.text.toString(),
                          passwordController.text.toString());*/
            },),

        ],
      );


    }

   /* ProgressDialog progressDialog = ProgressDialog(context, message: Text("Loging In"), title: Text("Please Wait")) ;*/

    return Scaffold(
      body: ListView(
        children: [
          Image.asset('assets/login_blog.png'),
          SizedBox(
            height: 290.h,
            child: Padding(
              padding:  EdgeInsets.only(left: 37.sp, right: 37.sp),
              child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    /// initial state
                    if (state is LoginInitial) {
                      return list();
                    }

                    /// loaded state
                    if (state is LoginApiLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

        /*if (state is LoginApiLoadedState) {
          return progressDialog.show();
        }*/

                    /// error state
                    else {
                      return const Center(
                        child: Text('error state'),
                      );
                    }
                  }),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(children: const <Widget>[
            Expanded(
                child: Divider(
              color: Color(0xFF878787),
            )),
            Text("OR"),
            Expanded(
              child: Divider(
                color: Color(0xFF878787),
              ),
            ),
          ]),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 37.sp, right: 37.sp),
            child: Button("Continue with google", const Color(0xFFFFFFFF),
                const Color(0xFF0D638A),(){}),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 37.sp, right: 37.sp),
            child: Button("Continue with facebook", const Color(0xFFFFFFFF),
                const Color(0xFF0D638A),(){}),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 37.sp),
            child: Row(
              children: [
                const Expanded(
                    flex: 2,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Dont have an account? "))),
                Expanded(
                    flex: 2,
                    child: TextButton(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Create account",
                            style: TextStyle(color: Color(0xFF0D638A)),
                          )),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return const SignUpPage();
                            }));
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
