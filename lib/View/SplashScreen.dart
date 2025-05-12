import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preference_mad/Controller/SettingController.dart';
import 'package:shared_preference_mad/View/SignInScreen.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      settingsController.loadPreferences();
      checkValuesFetched();
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Center(
        child: Lottie.asset(
          "assets/Loading.json",
          width: Get.width * 0.5,
          height: Get.height * 0.5,
        ),
      ),
    );
  }

  void checkValuesFetched() async {
    print("Checking status");
    String? user_mail = await settingsController.getSavedEmail();
    print(user_mail);
    if (settingsController.isLoading.value) {
      await Future.delayed(const Duration(milliseconds: 100));
      checkValuesFetched();
    } else {
      if (user_mail == null) {
        await Future.delayed(const Duration(milliseconds: 3000));

        Get.to(() => const LogInScreen());
      } else {
        await Future.delayed(const Duration(milliseconds: 3000));

        Get.to(() => const SettingScreen());
      }
    }
  }
}
