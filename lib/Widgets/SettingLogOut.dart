import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingLogout extends StatelessWidget {
  final String headingTitle;
  final String headingSubtitle;
  final GestureTapCallback onTap;
  final IconData icon;
  const SettingLogout({
    super.key,
    required this.headingTitle,
    required this.headingSubtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
