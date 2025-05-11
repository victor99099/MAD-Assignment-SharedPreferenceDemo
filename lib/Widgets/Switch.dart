import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingHeadingSwitch2 extends StatelessWidget {
  final String headingTitle;
  final String headingSubtitle;
  final ValueChanged onTap;
  final IconData icon;
  final bool value;
  const SettingHeadingSwitch2(
      {super.key,
      required this.headingTitle,
      required this.headingSubtitle,
      required this.icon,
      required this.onTap,
      required this.value});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return Container(
      color: currentTheme.dividerColor,
      height: Get.height * 0.085,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: Get.width * 0.05,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    icon,
                    color: currentTheme.primaryColor,
                    size: Get.width * 0.09,
                  ),
                ),
                Text(
                  headingTitle,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: currentTheme.primaryColorLight),
                ),
              ],
            ).pOnly(left: 7),
            Switch(
                thumbColor: WidgetStatePropertyAll(currentTheme.primaryColor),
                trackColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return currentTheme.primaryColor
                        .withOpacity(0.3); // active track
                  }
                  return currentTheme.scaffoldBackgroundColor; // inactive track
                }),
                value: value,
                onChanged: onTap,
                trackOutlineColor: WidgetStatePropertyAll(
                  currentTheme.dividerColor,
                ))
          ],
        ),
      ),
    );
  }
}
