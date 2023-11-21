import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}