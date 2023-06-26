
import 'package:easytrade/frontend/Pages/slpash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'frontend/sharedprofems/shared.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserSimplePreferences.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        hintColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedWidgetColor: Colors.deepPurple.shade200,
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
