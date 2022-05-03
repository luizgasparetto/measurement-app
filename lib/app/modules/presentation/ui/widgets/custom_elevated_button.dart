import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final String label;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.width,
    this.height = 44.0,
    this.gradient = const LinearGradient(
      colors: [
        Color.fromRGBO(190, 65, 217, 1),
        Color.fromRGBO(232, 94, 186, 1),
        Color.fromRGBO(255, 152, 128, 1),
      ],
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.5.h),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: onPressed,
    );
  }
}
