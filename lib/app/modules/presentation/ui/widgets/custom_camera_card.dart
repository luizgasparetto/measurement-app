import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:measurement/app/modules/domain/repositories/camera_repository.dart';

class CustomCameraCard extends StatelessWidget {
  const CustomCameraCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeRepository = GetIt.I.get<CameraRepository>();

    return Container(
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(190, 65, 217, 1),
            Color.fromRGBO(232, 94, 186, 1),
            Color.fromRGBO(255, 152, 128, 1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            Text(
              "Take a picture",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: Text(
                "Use your camera!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                ),
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
                onPressed: () async {
                  await homeRepository.selectImage(ImageSource.camera);
                  Navigator.pushNamed(context, '/image');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
