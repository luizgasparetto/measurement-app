import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonObjectCard extends StatelessWidget {
  const SkeletonObjectCard({Key? key}) : super(key: key);

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
            Shimmer.fromColors(
              baseColor: Colors.grey.shade400.withOpacity(0.5),
              highlightColor: Colors.grey.shade100.withOpacity(0.5),
              child: Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(width: 15.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade400.withOpacity(0.5),
                  highlightColor: Colors.grey.shade100.withOpacity(0.5),
                  child: Container(
                    width: 100.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade400.withOpacity(0.5),
                  highlightColor: Colors.grey.shade100.withOpacity(0.5),
                  child: Container(
                    width: 130.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade400.withOpacity(0.5),
                highlightColor: Colors.grey.shade100.withOpacity(0.5),
                child: Container(
                  width: 10.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
