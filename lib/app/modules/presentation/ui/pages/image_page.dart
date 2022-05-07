import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:measurement/app/modules/domain/repositories/camera_repository.dart';
import 'package:measurement/app/modules/presentation/blocs/create_object/create_object_bloc.dart';
import 'package:measurement/app/modules/presentation/ui/widgets/custom_elevated_button.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  static const String routeName = '/image';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ImagePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cameraRepository = GetIt.I.get<CameraRepository>();
    final createObjectBloc = GetIt.I.get<CreateObjectBloc>();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your image",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              "Now, just click on RESULTS :D",
              style: TextStyle(
                color: Theme.of(context).dialogBackgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: SizedBox(
                width: 400.w,
                height: 420.h,
                child: cameraRepository.image.value?.path != null
                    ? ClipRRect(
                        child: Image.file(
                          File(cameraRepository.image.value!.path),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )
                    : Container(
                        width: 100.w,
                        height: 100.w,
                        color: Colors.grey,
                      ),
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 43.h,
                  width: 145.w,
                  child: ElevatedButton(
                    child: Text(
                      "Retake",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColorDark,
                      side: BorderSide(
                        color: Theme.of(context).dialogBackgroundColor,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                CustomElevatedButton(
                  label: 'Results',
                  width: 140.w,
                  onPressed: () async {
                    createObjectBloc.add(
                      UploadObjectEvent(
                        File(cameraRepository.image.value!.path),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
