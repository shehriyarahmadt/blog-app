/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/colors.dart';

class LoginTextField extends StatefulWidget {

  final loginHintText;
  final  textType;

  LoginTextField(this.loginHintText,this.textType);

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.textType,
      decoration: InputDecoration(
        hintText: widget.loginHintText,
        hintStyle: TextStyle(color: MyColors.secondaryColor),
        filled: true,
        fillColor: const Color(0xFFFCFBFB),
        contentPadding: EdgeInsets.only(left: 15.sp),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: const BorderSide(color: Color(0xFF616161))
        ),
      ),

    );
  }
}
*/
