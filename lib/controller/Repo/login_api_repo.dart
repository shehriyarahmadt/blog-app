import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:ndialog/ndialog.dart';





class LoginApiRepo {


  static Future logInApi({required String emailController,required String passwordController,required BuildContext ctx}) async {

    ProgressDialog progressDialog = ProgressDialog(ctx,
      message:Text("Loging In"),
      title:Text("Please Wait"),
    );
    progressDialog.show();

    try {
      Response response =
      await post(Uri.parse('https://inveoa.com/api/login'), body: {
        'email': emailController,
        'password': passwordController,
      });
      print(response);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('Login successfully');

        progressDialog.dismiss();

       /* Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return  DashBoard(emailController,emailController);
            }));*/

        Fluttertoast.showToast(
          msg: "Login successfully",  // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.BOTTOM,    // location// duration
        );

        return data;

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
  }

}
