import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:measurement/app/modules/external/auth_service/implementations/prefs_service_imp.dart';
import 'package:measurement/app/modules/presentation/ui/pages/auth/login_page.dart';
import 'package:measurement/app/modules/presentation/ui/widgets/custom_list_tile.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  static const String routeName = '/user';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const UserPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SizedBox(height: 20.h),
            Center(
              child: Container(
                width: 130.w,
                height: 130.h,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 37, 38, 47),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  IconlyBold.profile,
                  color: Colors.white,
                  size: 60.w,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              "Jacob Moura",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
              ),
            ),
            SizedBox(height: 50.h),
            const CustomListTile(titleTile: 'Account'),
            const CustomListTile(titleTile: 'Settings'),
            const CustomListTile(titleTile: 'Objects'),
            SizedBox(height: 40.h),
            ElevatedButton(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  )),
              onPressed: () async {
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
                await PrefsServiceImp.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
