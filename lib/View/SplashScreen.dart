import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preference_mad/Controller/SettingController.dart';
import 'package:shared_preference_mad/View/mainSettingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SettingsController settingsController = Get.find();

  @override
  void initState() {
    super.initState();
    settingsController.loadPreferences();
    checkValuesFetched();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Center(
        child: Image.asset(
          'assets/icon.png',
          width: Get.width * 0.5,
          height: Get.height * 0.5,
        ),
      ),
    );
  }

  void checkValuesFetched() async {
    print("Checking status");
    if (settingsController.isLoading.value) {
      await Future.delayed(const Duration(milliseconds: 100));
      checkValuesFetched(); // recall after delay
    } else {
      Get.to(() => const SettingScreen());
    }
  }
}
