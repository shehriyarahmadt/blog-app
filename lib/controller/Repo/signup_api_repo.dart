import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:ndialog/ndialog.dart';


class SignUpApiRepo {


  static Future signupApi({required String nameController,required String emailController,required String passwordController,required BuildContext ctx}) async {


       ProgressDialog progressDialog = ProgressDialog(ctx,
      message:Text("Signing Up"),
      title:Text("Please Wait"),
    );

    progressDialog.show();


    try {
      Response response =
          await post(Uri.parse('https://inveoa.com/api/signup'), body: {
        'name': nameController,
        'email': emailController,
        'password': passwordController,
      });
      print(response.statusCode);
      var data = jsonDecode(response.body.toString());
      print(data);

      if (response.statusCode == 200) {


        progressDialog.dismiss();


        Fluttertoast.showToast(
          msg: "SignUp Successfully",  // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.BOTTOM,    // location// duration
        );


        print(data);

        return data;

      }


      else if(data['status'] == false ){
        //progressDialog.dismiss();
        Fluttertoast.showToast(
          msg: "Email Already Exist",  // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.BOTTOM,    // location// duration
        );
      }


      else {


        progressDialog.dismiss();

        Fluttertoast.showToast(
          msg: "Failed ",  // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.BOTTOM,    // location// duration
        );
      }
    } catch (e) {

      progressDialog.dismiss();

      print(e.toString());
    }
  }


}