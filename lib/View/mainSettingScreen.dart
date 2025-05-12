import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preference_mad/View/SplashScreen.dart';

// import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Controller/SettingController.dart';
import '../Widgets/ColorsSelection.dart';
import '../Widgets/SettingLogOut.dart';
import '../Widgets/Switch.dart';

// import '../Orders/OrdersScreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final SettingsController settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: currentTheme.primaryColorDark),
          backgroundColor: currentTheme.scaffoldBackgroundColor,
          title: Row(
            children: [
              Icon(
                Iconsax.setting,
                color: currentTheme.primaryColor,
                size: Get.width * 0.1,
              ),
              5.widthBox,
              "Settings App"
                  .text
                  .color(currentTheme.primaryColorDark)
                  .bold
                  .make(),
            ],
          ),
        ),
        // drawer: MyDrawer(),
        body: Obx(
          () {
            return settingsController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.brown,
                    ),
                  )
                : Container(
                    color: currentTheme.scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: Get.width + 10,
                            decoration: BoxDecoration(
                              color: currentTheme.scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              children: [
                                "MAD Assignment Shared Preferences"
                                    .text
                                    .extraBold
                                    .xl2
                                    .color(currentTheme.primaryColor)
                                    .align(TextAlign.center)
                                    .make()
                                    .pOnly(top: 20, left: 20),
                                20.heightBox,
                                Divider(
                                    color: currentTheme.scaffoldBackgroundColor,
                                    indent: 0,
                                    endIndent: 0,
                                    thickness: 5,
                                    height: 5),
                                Obx(
                                  () => SettingHeadingSwitch2(
                                      headingTitle: "Dark Mode",
                                      headingSubtitle: "Enjoy the dark mode",
                                      icon: Icons.dark_mode_outlined,
                                      onTap: (val) =>
                                          settingsController.toggleDarkMode(),
                                      value:
                                          settingsController.isDarkMode.value),
                                ),
                                Divider(
                                    color: currentTheme.scaffoldBackgroundColor,
                                    indent: 0,
                                    endIndent: 0,
                                    thickness: 5,
                                    height: 5),
                                Obx(
                                  () => SettingHeadingSwitch2(
                                      headingTitle: "Notifications",
                                      headingSubtitle: "Stay Tuned & Updated",
                                      icon: settingsController
                                              .notificationsEnabled.value
                                          ? Icons.notifications_active_outlined
                                          : Icons.notifications_off_outlined,
                                      onTap: (val) => settingsController
                                          .toggleNotifications(),
                                      value: settingsController
                                          .notificationsEnabled.value),
                                ),
                                Divider(
                                    color: currentTheme.scaffoldBackgroundColor,
                                    indent: 0,
                                    endIndent: 0,
                                    thickness: 5,
                                    height: 5),
                                SettingHeadingColorSelection(),
                                Divider(
                                    color: currentTheme.scaffoldBackgroundColor,
                                    indent: 0,
                                    endIndent: 0,
                                    thickness: 5,
                                    height: 5),
                                SettingLogout(
                                  headingTitle: "Logout",
                                  headingSubtitle: "",
                                  icon: Icons.logout,
                                  onTap: () async {
                                    Get.off(() => SplashScreen());

                                    settingsController.clearSavedEmail();
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ));
          },
        ));
  }
}
