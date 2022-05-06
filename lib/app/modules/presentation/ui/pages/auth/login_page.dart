import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:measurement/app/modules/presentation/controllers/auth_controller.dart';
import 'package:measurement/app/modules/presentation/ui/pages/auth/signup_page.dart';
import 'package:measurement/app/modules/presentation/ui/pages/home_page.dart';
import 'package:measurement/app/modules/presentation/ui/widgets/custom_elevated_button.dart';
import 'package:measurement/app/modules/presentation/ui/widgets/custom_input_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = "/login";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LoginPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ValueNotifier _emailNotifier = ValueNotifier("");
  final ValueNotifier _passwordNotifier = ValueNotifier("");

  final authController = GetIt.I.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120.h),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Please enter the details below to continue',
                      style: TextStyle(
                        color: Theme.of(context).dialogBackgroundColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70.h),
              CustomInputForm(
                label: 'Email',
                paddingLeft: 20,
                onChangedFunction: (value) => _emailNotifier.value = value,
              ),
              SizedBox(height: 15.h),
              CustomInputForm(
                label: 'Password',
                paddingLeft: 20,
                onChangedFunction: (value) => _passwordNotifier.value = value,
              ),
              SizedBox(height: 80.h),
              CustomElevatedButton(
                label: "Login",
                width: double.infinity,
                height: 45.h,
                onPressed: () async {
                  final result = await authController.signIn(
                    _emailNotifier.value,
                    _passwordNotifier.value,
                  );

                  if (result) {
                    Navigator.pushReplacementNamed(context, HomePage.routeName);
                  }
                },
              ),
              SizedBox(height: 10.h),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Theme.of(context).dialogBackgroundColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                        onPressed: () => Navigator.pushReplacementNamed(
                          context,
                          SignUpPage.routeName,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
