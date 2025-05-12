import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:shared_preference_mad/Widgets/MainButton.dart';

import 'package:velocity_x/velocity_x.dart';

import '../Controller/SettingController.dart';
import '../Widgets/EmailField.dart';
import '../Widgets/PassField.dart';
import 'mainSettingScreen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final SettingsController settingsController = Get.find();

  RxBool isPassVisible = true.obs;
  RxBool rememberMe = false.obs;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        color: currentTheme.scaffoldBackgroundColor,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: Get.width,
                height: Get.height * 0.15,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Shared',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          color: currentTheme.primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: ' Preferences',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          color: currentTheme.primaryColorDark,
                        ),
                      ),
                    ],
                  ),
                  softWrap: true,
                )).pOnly(top: Get.height * 0.1, left: Get.width * 0.02),
            Row(
              children: [
                Text(
                  "Login Account",
                  style: TextStyle(
                      color: currentTheme.primaryColorDark.withOpacity(0.7),
                      fontSize: Get.width * 0.05,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
                5.widthBox,
                ProfileIcon(currentTheme: currentTheme),
              ],
            ).pOnly(
                top: Get.height * 0.04,
                left: Get.width * 0.04,
                bottom: Get.height * 0.02),
            // Logo(currentTheme: currentTheme),
            Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  EmailField(Email: email, currentTheme: currentTheme),
                  10.heightBox,
                  PasswordField(
                      isPassVisible: isPassVisible,
                      password: password,
                      currentTheme: currentTheme),
                  Obx(() {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Obx(() => Checkbox(
                                  fillColor: WidgetStatePropertyAll(
                                      currentTheme.primaryColor.withOpacity(0.5)),
                                  value: rememberMe.value,
                                  onChanged: (val) {
                                    rememberMe.value = val!;
                                  },
                                )),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                color: currentTheme.primaryColorDark
                                    .withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                        settingsController.isLoading.value
                            ? CircularProgressIndicator(
                                color: currentTheme.primaryColor,
                              )
                            : MainButton(
                                currentTheme: currentTheme,
                                onTap: () async {
                                  if (email.text.isEmpty ||
                                      password.text.isEmpty) {
                                    Get.snackbar("Missing Fields",
                                        "Please fill email and passwrod fields",
                                        colorText: Colors.white,
                                        backgroundColor:
                                            currentTheme.primaryColor);
                                  } else {
                                    if (rememberMe.value) {
                                      await settingsController
                                          .saveEmail(email.text);
                                    }
                                    Get.to(() => SettingScreen());
                                  }

                                  // You can add navigation or other login logic here
                                },
                                text: "Login",
                              ).marginOnly(top: Get.width * 0.02),
                      ],
                    );
                  }),
                ],
              ),
            ).pOnly(left: 12, right: 12),
          ],
        ),
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
    required this.currentTheme,
  });

  final ThemeData currentTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Iconsax.user,
          color: currentTheme.primaryColorDark.withOpacity(0.3),
          size: 16,
        ),
        Icon(
          Iconsax.user,
          color: currentTheme.primaryColorDark.withOpacity(0.3),
          size: 17,
        ),
        Icon(
          Iconsax.user,
          color: currentTheme.primaryColorDark.withOpacity(0.3),
          size: 18,
        ),
        Icon(
          Iconsax.user,
          color: currentTheme.primaryColorDark.withOpacity(0.3),
          size: 19,
        ),
        Icon(
          Iconsax.user,
          color: currentTheme.primaryColorDark.withOpacity(0.3),
          size: 20,
        ),
        Icon(
          Iconsax.user,
          color: currentTheme.primaryColorDark.withOpacity(0.3),
          size: 21,
        ),
        Icon(
          Iconsax.user,
          color: currentTheme.primaryColorDark.withOpacity(0.3),
          size: 22,
        ),
      ],
    );
  }
}
