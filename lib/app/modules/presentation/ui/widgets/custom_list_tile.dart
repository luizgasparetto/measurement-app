import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class CustomListTile extends StatelessWidget {
  final String titleTile;
  final void Function()? onPressedFunction;

  const CustomListTile({
    Key? key,
    required this.titleTile,
    this.onPressedFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        titleTile,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
        ),
      ),
      trailing: IconButton(
        onPressed: onPressedFunction ?? () {},
        icon: Icon(
          IconlyLight.arrow_right_2,
          color: Colors.white,
          size: 20.sp,
        ),
      ),
    );
  }
}
