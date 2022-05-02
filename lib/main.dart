import 'package:flutter/material.dart';
import 'package:measurement/app/shared/injection/injection.dart';

import 'app/shared/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injection.inject();
  runApp(const MyApp());
}
