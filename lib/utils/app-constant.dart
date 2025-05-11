import 'package:flutter/material.dart';

class AppConstant {
  static Color primary = Color(0xFFBF905C);
}

class ColorUtils {
  static Color getColorFromName(String colorName) {
    switch (colorName.toUpperCase().trim()) {
      case 'RED':
        return Colors.red;
      case 'BLUE':
        return Colors.blue;
      case 'GREEN':
        return Colors.green;
      case 'YELLOW':
        return Colors.yellow;
      case 'ORANGE':
        return Colors.orange;
      case 'PURPLE':
        return Colors.purple;
      case 'PINK':
        return Colors.pink;
      case 'BROWN':
        return Colors.brown;
      case 'GREY':
        return Colors.grey;
      case 'BLACK':
        return Colors.black;
      case 'WHITE':
        return Colors.white;
      case 'CYAN':
        return Colors.cyan;
      case 'TEAL':
        return Colors.teal;
      case 'INDIGO':
        return Colors.indigo;
      case 'LIME':
        return Colors.lime;
      case 'AMBER':
        return Colors.amber;
      case 'DEEP ORANGE':
        return Colors.deepOrange;
      case 'DEEP PURPLE':
        return Colors.deepPurple;
      case 'LIGHT BLUE':
        return Colors.lightBlue;
      case 'LIGHT GREEN':
        return Colors.lightGreen;
      case 'RED ACCENT':
        return Colors.redAccent;
      case 'BLUE ACCENT':
        return Colors.blueAccent;
      case 'GREEN ACCENT':
        return Colors.greenAccent;
      case 'YELLOW ACCENT':
        return Colors.yellowAccent;
      case 'ROSE GOLD':
        return const Color(0xFFDAB8C1);
      case 'BRONZE':
        return const Color(0xFFCD7F32);
      case 'SILVER':
        return const Color(0xFFC0C0C0);
      case 'GOLD':
        return const Color(0xFFFFD700);
      case 'SPACE GRAY':
        return const Color(0xFF1C1C1C);

      // Newly added colors
      case 'PEACH':
        return const Color(0xFFFFE5B4);
      case 'LAVENDER':
        return const Color(0xFFE6E6FA);
      case 'NUDE':
        return const Color(0xFFF2D2BD);
      case 'CLAY':
        return const Color(0xFFB66A50);
      case 'SEA GREEN':
        return const Color(0xFF2E8B57);
      case 'DARK SLATE BLUE':
        return const Color(0xFF483D8B);
      case 'ANTIQUE PRISM':
        return const Color(0xFFD7BFAF);
      case 'OFF-WHITE':
        return const Color(0xFFFAF9F6);
      case 'BEIGE':
        return const Color(0xFFF5F5DC);
      case 'OLIVE':
        return const Color(0xFF808000);
      case 'MAROON':
        return const Color(0xFF800000);
      case 'NAVY':
      case 'NAVYBLUE':
        return const Color(0xFF000080);
      case 'SKY BLUE':
        return const Color(0xFF87CEEB);
      case 'CREAM':
        return const Color(0xFFFFFDD0);
      case 'COPPER':
        return const Color(0xFFB87333);
      case 'OLD GOLD':
        return const Color(0xFFCFB53B);
      case 'SALMON PINK':
        return const Color(0xFFFF91A4);

      default:
        return Colors.grey;
    }
  }
}
