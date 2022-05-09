import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "dart:math" as math;

import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:iconly/iconly.dart';
import 'package:measurement/app/modules/presentation/blocs/list_objects_bloc/list_objects_bloc.dart';
import 'package:measurement/app/modules/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:measurement/app/modules/presentation/ui/pages/user_page.dart';
import 'package:measurement/app/modules/presentation/ui/widgets/custom_camera_card.dart';
import 'package:measurement/app/modules/presentation/ui/widgets/custom_object_card.dart';
import 'package:measurement/app/modules/presentation/ui/widgets/shimmer/skeleton_object_card.dart';

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
      body: RefreshIndicator(
        onRefresh: () async => listBloc..add(GetObjectsEvent()),
        color: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).primaryColorDark,
        child: SingleChildScrollView(
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
                      onPressed: () =>
                          Navigator.pushNamed(context, UserPage.routeName),
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
                          child: BlocBuilder<UserBloc, UserState>(
                            builder: ((context, state) {
                              if (state is UserLoadingState) {
                                return Text(
                                  "Hello",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              } else if (state is UserLoadedState) {
                                return Text(
                                  "Hello ${state.user.name}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              }

                              return Text(
                                "Hello :)",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            }),
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
                SizedBox(height: 40.h),
                SizedBox(
                  height: 180.h,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: Container(
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
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const CustomCameraCard(),
                      Padding(
                        padding: EdgeInsets.only(left: 160.w, bottom: 30.h),
                        child: SizedBox(
                          width: 150.h,
                          height: 180.h,
                          child: Transform(
                            transform: Matrix4.rotationY(math.pi),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              "assets/svg/men.svg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
                SizedBox(height: 10.h),
                BlocBuilder<ListObjectsBloc, ListObjectsState>(
                  builder: (context, state) {
                    if (state is ListObjectsLoadingState) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (_, __) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: const SkeletonObjectCard(),
                          );
                        },
                      );
                    } else if (state is ListObjectsLoadedState) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
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
      ),
    );
  }
}
