import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:measurement/app/shared/injection/injection.dart';

import 'app/shared/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  Injection.inject();

  runApp(const MyApp());
}
