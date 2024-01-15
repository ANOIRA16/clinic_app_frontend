// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/appbar_style/app_bar_style.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_builder.dart';

import '../../config/ui/appbar/language_drop_down_menu.dart';
import '../../config/ui/appbar/theme_button.dart';

class AppbarLayout extends StatelessWidget {
  final Widget child;

  const AppbarLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StructureBuilder(
      appbar: AppBarStyle(
        languageDropDownMenu: LanguageDropDownMenu(),
        themeButton: ThemeButton(),
      ),
      child: child,
    );
  }
}
