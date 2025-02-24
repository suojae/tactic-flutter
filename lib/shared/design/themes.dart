import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 테마 모드 Enum (0 = Light, 1 = Dark)
enum ThemePreference {
  light(0),
  dark(1);

  final int value;
  const ThemePreference(this.value);

  static ThemePreference fromValue(int value) =>
      ThemePreference.values.firstWhere(
            (e) => e.value == value,
        orElse: () => ThemePreference.light,
      );
}

/// 테마 모드 (sealed class)
sealed class AppThemeMode {
  const AppThemeMode._();

  static AppThemeMode fromPreference(ThemePreference preference) {
    return preference == ThemePreference.dark ? const Dark() : const Light();
  }
}

final class Light extends AppThemeMode {
  const Light() : super._();
}

final class Dark extends AppThemeMode {
  const Dark() : super._();
}

/// 테마 상태 관리 (Cubit 사용)
class ThemeManager extends Cubit<AppThemeMode> {
  static const _prefsKey = 'app_theme_mode';
  final SharedPreferences _prefs;

  /// 📌 `SharedPreferences`를 생성자에서 한 번만 로드
  ThemeManager._(this._prefs, AppThemeMode initialMode) : super(initialMode);

  /// 📌 Factory 패턴으로 SharedPreferences 미리 로드
  static Future<ThemeManager> create() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = ThemePreference.fromValue(prefs.getInt(_prefsKey) ?? 0);
    return ThemeManager._(prefs, AppThemeMode.fromPreference(savedTheme));
  }

  /// 📌 테마 변경 및 SharedPreferences 저장
  Future<void> toggleTheme() async {
    final newTheme = state is Dark ? const Light() : const Dark();
    emit(newTheme);
    await _prefs.setInt(
      _prefsKey,
      newTheme is Dark ? ThemePreference.dark.value : ThemePreference.light.value,
    );
  }

  /// 📌 Light Mode (Material 3 스타일 적용)
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      error: Colors.red,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );

  /// 📌 Dark Mode (Material 3 스타일 적용)
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.black,
      onPrimary: Colors.black,
      error: Colors.red,
      surface: Colors.black,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[800],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
