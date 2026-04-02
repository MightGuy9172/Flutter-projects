import 'package:expense_tracker/expense_home.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

final kColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF1B5E20));

final kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF1B5E20),
  brightness: Brightness.dark,
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          foregroundColor: kColorScheme.primaryContainer,
          backgroundColor: kColorScheme.onPrimaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: kColorScheme.onSecondaryContainer,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: CardThemeData().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      // themeMode: ThemeMode.system,
      home: ExpenseHome(),
    ),
  );
  // });
}
