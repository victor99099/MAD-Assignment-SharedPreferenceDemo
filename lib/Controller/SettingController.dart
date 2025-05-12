import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app-constant.dart';

class SettingsController extends GetxController {
  final RxBool isDarkMode = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool notificationsEnabled = true.obs;
  final RxString primaryColorName = 'BROWN'.obs; // Default color

  static const String _primaryColorKey = 'primary_color';
  static const String _darkModeKey = 'dark_mode';
  static const String _notificationsKey = 'notifications_enabled';

  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xFFf0f1f1),
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.grey,
        dividerColor: Colors.white,
        primaryColor: ColorUtils.getColorFromName(primaryColorName.value),
      );

  ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColorDark: Colors.white,
        primaryColorLight: const Color.fromARGB(255, 167, 167, 167),
        dividerColor: const Color.fromARGB(255, 70, 70, 70),
        primaryColor: ColorUtils.getColorFromName(primaryColorName.value),
      );

  ThemeMode get currentThemeMode =>
      isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  Future<void> loadPreferences() async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool(_darkModeKey) ?? false;
    notificationsEnabled.value = prefs.getBool(_notificationsKey) ?? true;
    primaryColorName.value = prefs.getString(_primaryColorKey) ?? 'BROWN';
    AppConstant.primary = ColorUtils.getColorFromName(primaryColorName.value);
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
    isLoading.value = false;
  }

  Future<void> toggleDarkMode() async {
    isDarkMode.value = !isDarkMode.value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, isDarkMode.value);
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }

  Future<void> toggleNotifications() async {
    notificationsEnabled.value = !notificationsEnabled.value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notificationsKey, notificationsEnabled.value);
  }

  Future<void> setPrimaryColor(String colorName) async {
    primaryColorName.value = colorName;
    AppConstant.primary = ColorUtils.getColorFromName(colorName);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_primaryColorKey, colorName);
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }

  Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
  }

  Future<String?> getSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_email');
  }

  Future<void> clearSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_email');
  }

  List<String> availableColorNames = [
    'RED',
    'BLUE',
    'GREEN',
    'ORANGE',
    'PURPLE',
    'PINK',
    'BROWN',
    'CYAN',
    'TEAL',
    'INDIGO',
    'AMBER',
  ];
}
