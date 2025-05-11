import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Controller/SettingController.dart';
import '../utils/app-constant.dart';

class SettingHeadingColorSelection extends StatefulWidget {
  SettingHeadingColorSelection({
    super.key,
  });

  @override
  State<SettingHeadingColorSelection> createState() =>
      _SettingHeadingColorSelectionState();
}

class _SettingHeadingColorSelectionState
    extends State<SettingHeadingColorSelection> {
  final SettingsController settingsController = Get.find();
  RxString selectedOption = ''.obs;
  @override
  void initState() {
    super.initState();
    selectedOption.value = settingsController.primaryColorName.value;
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return Container(
      color: currentTheme.dividerColor,
      height: Get.height * 0.15,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child: "Select Theme Color :  ${selectedOption.value}"
                      .text
                      .bold
                      .textStyle(const TextStyle(fontSize: 15))
                      .align(TextAlign.left)
                      .color(currentTheme.primaryColorLight)
                      .make()),
              Padding(
                padding: const EdgeInsets.only(left: 7, top: 10),
                // padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: Get.height * 0.06,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: settingsController.availableColorNames.length,
                    itemBuilder: (context, index) {
                      String colorName =
                          settingsController.availableColorNames[index];
                      Color color = ColorUtils.getColorFromName(colorName);

                      return Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.14,
                            height: Get.height * 0.06,
                            child: Card(
                              color: color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                                side: selectedOption.value ==
                                        settingsController
                                            .availableColorNames[index]
                                    ? BorderSide(
                                        color: currentTheme.primaryColor,
                                        width: 3)
                                    : const BorderSide(
                                        color: Colors.transparent, width: 4),
                              ),
                              child: Stack(
                                alignment:
                                    Alignment.center, // Centering the content
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      selectedOption.value = settingsController
                                          .availableColorNames[index];
                                      settingsController
                                          .setPrimaryColor(colorName);
                                    },
                                    child: const SizedBox
                                        .shrink(), // Empty icon to clear default icon
                                  ),
                                  if (selectedOption.value ==
                                      settingsController
                                          .availableColorNames[index])
                                    Icon(
                                      Icons.check,
                                      size: 25,
                                      color:
                                          selectedOption.value.toLowerCase() ==
                                                  "white"
                                              ? Colors.black
                                              : currentTheme.canvasColor,
                                    )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
