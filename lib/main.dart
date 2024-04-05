import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mxpertx/core/firebase/firebase_utils.dart';
import 'package:mxpertx/core/router/MyAppRouter.dart';
import 'package:mxpertx/core/themes/theme.dart';
import 'package:mxpertx/features/login/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupFirebase();
}

final myAppRouter = MyAppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      themeMode: ThemeMode.light,
      routerConfig: myAppRouter.router,
    );
  }
}
