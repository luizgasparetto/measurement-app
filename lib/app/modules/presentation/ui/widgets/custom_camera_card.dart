import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class CustomCameraCard extends StatelessWidget {
  const CustomCameraCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Take a picture",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              "Use your camera :)",
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 90.w,
              child: ElevatedButton(
                child: Row(
                  children: [
                    Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      IconlyLight.arrow_right,
                      size: 14.w,
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
