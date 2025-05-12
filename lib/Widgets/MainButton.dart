import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../utils/Themes.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.currentTheme,
      required this.onTap,
      required this.text});

  final ThemeData currentTheme;
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.91,
      height: Get.height * 0.075,
      child: TextButton(
          onPressed: onTap,
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: WidgetStatePropertyAll(currentTheme.primaryColor),
          ),
          child: Text(text,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: currentTheme.colorScheme.onPrimary,
              ))),
    );
  }
}
