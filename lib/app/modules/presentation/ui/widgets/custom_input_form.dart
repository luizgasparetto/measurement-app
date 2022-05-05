import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputForm extends StatelessWidget {
  final String label;
  final double paddingLeft;
  final TextAlign textAlign;
  final void Function(String)? onChangedFunction;

  const CustomInputForm({
    Key? key,
    required this.label,
    required this.onChangedFunction,
    this.paddingLeft = 0,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: textAlign,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: label,
        contentPadding: EdgeInsets.only(left: paddingLeft, bottom: 32.h),
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 154, 153, 158),
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(47, 47, 61, 1),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color.fromRGBO(47, 47, 61, 1),
            width: 3,
          ),
        ),
      ),
      onChanged: onChangedFunction,
    );
  }
}
