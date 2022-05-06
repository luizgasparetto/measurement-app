import 'package:flutter/material.dart';
import 'package:measurement/app/modules/external/auth_service/implementations/prefs_service_imp.dart';
import 'package:measurement/app/modules/presentation/ui/pages/auth/login_page.dart';
import 'package:measurement/app/modules/presentation/ui/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SplashPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.wait([
      PrefsServiceImp.isAuth(),
      Future.delayed(const Duration(seconds: 2)),
    ]).then(
      (value) => value[0]
          ? Navigator.pushReplacementNamed(context, HomePage.routeName)
          : Navigator.pushReplacementNamed(context, LoginPage.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Color.fromRGBO(30, 30, 31, 1),
          color: Color.fromRGBO(232, 94, 186, 1),
        ),
      ),
    );
  }
}
