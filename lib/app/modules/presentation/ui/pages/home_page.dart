import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:get_it/get_it.dart';
import 'package:iconly/iconly.dart';
import 'package:measurement/app/modules/presentation/blocs/list_objects/list_objects_bloc.dart';
import 'package:measurement/app/modules/presentation/ui/widgets/custom_camera_card.dart';
import 'package:measurement/app/modules/presentation/ui/widgets/custom_object_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final listBloc = GetIt.I.get<ListObjectsBloc>();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      IconlyLight.activity,
                      size: 28.w,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      IconlyLight.profile,
                      size: 28.w,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          "Hello Jacob",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          "Welcome again!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: IconButton(
                      icon: Icon(
                        IconlyLight.swap,
                        color: Colors.white,
                        size: 26.w,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              SizedBox(height: 50.h),
              const CustomCameraCard(),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  "Last Objects",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              //SizedBox(height: 10.h),
              BlocBuilder<ListObjectsBloc, ListObjectsState>(
                builder: (context, state) {
                  if (state is ListObjectsLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ListObjectsLoadedState) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.objects.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: CustomObjectCard(
                            width: state.objects[index].width,
                            height: state.objects[index].height,
                            imageURL: state.objects[index].imageUrl,
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: Text("Something wrong :("));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
