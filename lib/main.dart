import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/SettingController.dart';
import 'View/SplashScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = Get.put(SettingsController());
  await settingsController.loadPreferences(); // make this public and separate
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final SettingsController settingsController = Get.find();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: settingsController.lightTheme,
        darkTheme: settingsController.darkTheme,
        title: 'SPM Assignment Shared Preferences',
        themeMode: settingsController.currentThemeMode,
        home: SplashScreen(),
      );
    });
  }
}
