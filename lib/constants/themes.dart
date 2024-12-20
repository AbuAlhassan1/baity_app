// import 'package:baity_app/common/views/colors.dart';
import 'package:flutter/material.dart';

// class Themes {
//   static ThemeData lightTheme = ThemeData(
//     useMaterial3: true,
//     scaffoldBackgroundColor: DimsColors.white,
//     fontFamily: "PublicSans",
//     colorScheme: ColorScheme.light(
//       primary: DimsColors.dmisBlue,
//       secondary: DimsColors.deepBlue,
//       error: DimsColors.error,
//       // surface: DimsColors.greyBlue,
//       brightness: Brightness.light,
//     ),
//   );

//   static ThemeData darkTheme = ThemeData(
//     useMaterial3: true,
//     scaffoldBackgroundColor: DimsColors.deepBlue,
//     fontFamily: "PublicSans",
//     colorScheme: ColorScheme.light(
//       primary: DimsColors.dmisBlue,
//       secondary: DimsColors.greyBlue,
//       error: DimsColors.error,
//       // surface: DimsColors.deepBlue,
//       brightness: Brightness.dark
//     ),
//   );
// }
class Themes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF121513), // Adjust this to your design
    scaffoldBackgroundColor: const Color(0xFFEEEEEE), // Light background color
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFF8E1), // Same as scaffold background
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF000000)), // Black icons
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF000000), // Black bar
      selectedItemColor: Color(0xFFFFFFFF), // White active icons
      unselectedItemColor: Color(0xFF757575), // Gray inactive icons
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF000000), // Black text
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFF757575), // Subtle gray text
      ),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF000000)),
    cardColor: const Color(0xFFFFFFFF), // Card background (white)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF000000), // Button color
        foregroundColor: const Color(0xFFFFFFFF), // Text color
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Color(0xFF000000), // Black active tab
      unselectedLabelColor: Color(0xFF757575), // Gray inactive tab
      dividerColor: Colors.transparent,
      dividerHeight: 0,
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFFFFFFF), // Adjust this to your design
    scaffoldBackgroundColor: const Color(0xFFEEEEEE), // Dark background color
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212), // Same as scaffold background
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)), // White icons
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E), // Dark gray bar
      selectedItemColor: Color(0xFFFFFFFF), // White active icons
      unselectedItemColor: Color(0xFF757575), // Gray inactive icons
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFFFFFFFF), // White text
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFFB0B0B0), // Subtle gray text
      ),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
    cardColor: const Color(0xFF1E1E1E), // Card background (dark gray)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFFFFF), // Button color
        foregroundColor: const Color(0xFF000000), // Text color
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Color(0xFF000000), // Black active tab
      unselectedLabelColor: Color(0xFF757575), // Gray inactive tab
      dividerColor: Colors.transparent,
      dividerHeight: 0,
    ),
  );
}
