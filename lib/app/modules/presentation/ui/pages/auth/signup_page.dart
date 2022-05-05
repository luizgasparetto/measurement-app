import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:measurement/app/modules/presentation/blocs/auth/auth_bloc.dart';
import 'package:measurement/app/modules/presentation/ui/widgets/custom_elevated_button.dart';
import 'package:measurement/app/modules/presentation/ui/widgets/custom_input_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const String routeName = "/sign-up";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SignUpPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ValueNotifier _nameNotifier = ValueNotifier("");
  final ValueNotifier _emailNotifier = ValueNotifier("");
  final ValueNotifier _passwordNotifier = ValueNotifier("");

  final authBloc = GetIt.I.get<AuthBloc>();

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
                      'Sign up.',
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
                label: 'Full Name',
                paddingLeft: 20,
                onChangedFunction: (value) => _nameNotifier.value = value,
              ),
              SizedBox(height: 15.h),
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
                label: "Sign up",
                width: double.infinity,
                height: 45.h,
                onPressed: () {
                  authBloc.add(
                    AuthSignUpEvent(
                      name: _nameNotifier.value,
                      email: _emailNotifier.value,
                      password: _passwordNotifier.value,
                    ),
                  );
                },
              ),
              SizedBox(height: 10.h),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Theme.of(context).dialogBackgroundColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "Sign in.",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                        onPressed: () {},
                      )
                    ],
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
