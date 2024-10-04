import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';


part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppConstants.kPrimaryColor,
    disabledColor: AppConstants.darkFontColor,
    scaffoldBackgroundColor: AppConstants.lightFontColor,
    canvasColor: AppConstants.kWhiteColor,
    cardColor: AppConstants.kBlackColor
  );
  static final ThemeData _darkTheme = ThemeData.dark();

  ThemeCubit() : super(ThemeState(themeData: lightTheme));

  void toggleTheme(bool isDark) {
    final themeData = isDark ? _darkTheme : lightTheme;
    emit(ThemeState(themeData: themeData));
    _saveTheme(isDark);
  }

  Future<void> _saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
  }

  static Future<bool> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDark') ?? false;
  }

  Future<void> setInitialTheme()async{

    final isDark = await _loadTheme();
    final themeData = isDark? _darkTheme: lightTheme;
    emit(ThemeState(themeData: themeData));

  }
}
