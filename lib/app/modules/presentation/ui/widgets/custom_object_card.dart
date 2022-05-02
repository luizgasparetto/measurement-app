import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class CustomObjectCard extends StatelessWidget {
  final double width;
  final double height;
  final String? imageURL;

  const CustomObjectCard({
    Key? key,
    required this.width,
    required this.height,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
        child: Row(
          children: [
            ClipRRect(
              child: SizedBox(
                  width: 80.w,
                  height: 80.h,
                  child: imageURL == null && imageURL == ""
                      ? Container(
                          color: Colors.grey.shade600,
                        )
                      : ClipRRect(
                          child: Image.network(
                            imageURL!,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        )),
              borderRadius: BorderRadius.circular(20),
            ),
            SizedBox(width: 15.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Width:  ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${width.toStringAsFixed(1)} cm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Text(
                      "Height: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${height.toStringAsFixed(1)} cm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Icon(
              IconlyLight.arrow_right_2,
              color: Colors.white,
              size: 26.w,
            )
          ],
        ),
      ),
    );
  }
}
