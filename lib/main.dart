import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jokes/core/services/injection_container.dart';

import 'core/navigation/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
