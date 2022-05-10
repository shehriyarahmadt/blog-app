import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {

  final String buttonName /*,buttonBackgroundColor,buttonTextColor*/;
  final Color buttonBackgroundColor;
  final Color buttonTextColor;
  final VoidCallback btnPressed;

  const Button(this.buttonName, this.buttonBackgroundColor,
      this.buttonTextColor, this.btnPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: btnPressed,
      child: Padding(
        padding: EdgeInsets.all(18.sp),
        child: Text(buttonName),
      ),
      style: ElevatedButton.styleFrom(
        primary: buttonBackgroundColor,
        onPrimary: buttonTextColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
            side: const BorderSide(
              color: Color(0xFF0D638A),
            )),
      ),
    );
  }
}
