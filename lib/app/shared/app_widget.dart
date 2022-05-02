import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:measurement/app/modules/presentation/ui/pages/home_page.dart';
import 'package:measurement/app/shared/injection/bloc_providers.dart';
import 'package:measurement/app/shared/routes/routes.dart';
import 'package:measurement/app/shared/themes/main_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_) => MultiBlocProvider(
        providers: BlocProviders.getProviders(),
        child: MaterialApp(
          title: 'Object Measurement',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoutes,
          initialRoute: HomePage.routeName,
          theme: MainTheme.getTheme(),
        ),
      ),
    );
  }
}
