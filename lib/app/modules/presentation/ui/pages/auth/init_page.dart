import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:measurement/app/modules/domain/repositories/auth_repository.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  static const String routeName = '/init';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const InitPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final authRepository = GetIt.I.get<AuthRepository>();
  late String tokenRoute;

  @override
  Future<void> initState() async {
    tokenRoute = await authRepository.isAuthenticated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Navigator.pushReplacementNamed(context, tokenRoute);
    return Container();
  }
}
